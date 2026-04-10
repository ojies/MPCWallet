/// Static single-key P2TR wallet for funding MutinyNet integration tests.
///
/// Connects directly to MutinyNet's public Electrum server over TCP
/// and can send P2TR transactions signed with a single Schnorr key.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

/// Minimal Electrum JSON-RPC client over TCP.
class _ElectrumTcp {
  final String host;
  final int port;
  Socket? _socket;
  int _nextId = 0;
  final _pending = <int, Completer<dynamic>>{};
  final _buffer = StringBuffer();

  _ElectrumTcp(this.host, this.port);

  Future<void> connect() async {
    _socket = await Socket.connect(host, port);
    utf8.decoder.bind(_socket!).listen(_onData, onDone: () {
      for (final c in _pending.values) {
        if (!c.isCompleted) c.completeError('Connection closed');
      }
      _pending.clear();
    });
  }

  void _onData(String data) {
    _buffer.write(data);
    // Electrum sends newline-delimited JSON
    final full = _buffer.toString();
    final lines = full.split('\n');
    // Last element is either empty (complete line) or partial
    _buffer.clear();
    _buffer.write(lines.last);
    for (var i = 0; i < lines.length - 1; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;
      try {
        final msg = jsonDecode(line) as Map<String, dynamic>;
        final id = msg['id'] as int?;
        if (id != null && _pending.containsKey(id)) {
          final error = msg['error'];
          if (error != null) {
            _pending[id]!.completeError('Electrum error: $error');
          } else {
            _pending[id]!.complete(msg['result']);
          }
          _pending.remove(id);
        }
      } catch (e) {
        // Ignore parse errors for notifications
      }
    }
  }

  Future<dynamic> request(String method, List<dynamic> params) async {
    final id = _nextId++;
    final payload = jsonEncode({
      'jsonrpc': '2.0',
      'method': method,
      'params': params,
      'id': id,
    });
    final completer = Completer<dynamic>();
    _pending[id] = completer;
    _socket!.write('$payload\n');
    return completer.future;
  }

  Future<void> close() async {
    await _socket?.close();
    _socket = null;
  }
}

/// MutinyNet funder: single-key P2TR wallet backed by Electrum TCP.
class MutinyNetFunder {
  final String _secretKeyHex;
  late final ECPrivate _key;
  late final ECPublic _pub;
  late final P2trAddress _address;
  late final String _scriptHash;
  late final _ElectrumTcp _electrum;
  final String electrumHost;
  final int electrumPort;

  MutinyNetFunder(
    this._secretKeyHex, {
    this.electrumHost = 'electrum.mutinynet.com',
    this.electrumPort = 50001,
  });

  String get address => _address.toAddress(BitcoinNetwork.signet);

  Future<void> connect() async {
    _key = ECPrivate.fromHex(_secretKeyHex);
    _pub = _key.getPublic();
    _address = P2trAddress.fromInternalKey(internalKey: _pub.toXOnly());

    // Compute Electrum script hash: SHA256(scriptPubKey), reversed
    final scriptPubKey = _address.toScriptPubKey();
    final scriptBytes = scriptPubKey.toBytes();
    final hash = QuickCrypto.sha256Hash(scriptBytes);
    _scriptHash = BytesUtils.toHexString(hash.reversed.toList());

    _electrum = _ElectrumTcp(electrumHost, electrumPort);
    await _electrum.connect();
  }

  /// Get total confirmed balance in sats.
  Future<int> getBalanceSats() async {
    final utxos = await _listUnspent();
    return utxos.fold<int>(0, (sum, u) => sum + (u['value'] as int));
  }

  /// List unspent outputs for the funder address.
  Future<List<Map<String, dynamic>>> _listUnspent() async {
    final result = await _electrum.request(
        'blockchain.scripthash.listunspent', [_scriptHash]);
    return (result as List).cast<Map<String, dynamic>>();
  }

  /// Send [amountSats] to [dest] address. Returns the broadcast txid.
  Future<String> sendToAddress(String dest, int amountSats,
      {int feeRate = 1}) async {
    // 1. Fetch UTXOs
    final rawUtxos = await _listUnspent();
    if (rawUtxos.isEmpty) {
      throw Exception('Funder wallet has no UTXOs. Fund $address first.');
    }

    // Build UtxoWithAddress list
    final utxos = <UtxoWithAddress>[];
    for (final u in rawUtxos) {
      utxos.add(UtxoWithAddress(
        utxo: BitcoinUtxo(
          txHash: u['tx_hash'] as String,
          value: BigInt.from(u['value'] as int),
          vout: u['tx_pos'] as int,
          scriptType: SegwitAddressType.p2tr,
        ),
        ownerDetails: UtxoAddressDetails(
          publicKey: _pub.toHex(),
          address: _address,
        ),
      ));
    }

    // 2. Coin selection (simple: use all UTXOs, calculate fee)
    final totalIn = utxos.fold<BigInt>(BigInt.zero, (s, u) => s + u.utxo.value);

    // P2TR: ~58 vbytes per input, ~43 per output, ~10.5 overhead
    final estimatedVbytes = 11 + utxos.length * 58 + 2 * 43;
    final fee = BigInt.from(estimatedVbytes * feeRate);

    final amount = BigInt.from(amountSats);
    if (totalIn < amount + fee) {
      throw Exception(
          'Insufficient balance: have ${totalIn} sats, need ${amount + fee}');
    }

    final changeValue = totalIn - amount - fee;

    // 3. Build destination address
    BitcoinBaseAddress destAddress;
    if (dest.startsWith('bcrt')) {
      final decoded = SegwitBech32Decoder.decode('bcrt', dest);
      destAddress =
          P2trAddress.fromProgram(program: BytesUtils.toHexString(decoded.item2));
    } else {
      destAddress =
          P2trAddress.fromAddress(address: dest, network: BitcoinNetwork.signet);
    }

    // 4. Build outputs
    final outputs = <BitcoinOutput>[
      BitcoinOutput(address: destAddress, value: amount),
    ];
    if (changeValue > BigInt.from(546)) {
      outputs.add(BitcoinOutput(address: _address, value: changeValue));
    }

    // 5. Build and sign transaction
    final builder = BitcoinTransactionBuilder(
      outPuts: outputs,
      fee: fee,
      network: BitcoinNetwork.signet,
      utxos: utxos,
    );

    final btcTx = await builder.buildTransaction(
        (sighash, utxo, publicKey, index) {
      // P2TR key-path signing with BIP-341 tweak (matches fromInternalKey)
      return _key.signBip340(sighash, tweak: true);
    });

    final txHex = btcTx.serialize();

    // 6. Broadcast
    final txid = await _electrum.request(
        'blockchain.transaction.broadcast', [txHex]);
    return txid as String;
  }

  /// Wait for a transaction to get at least 1 confirmation.
  Future<void> waitForConfirmation(String txid,
      {int timeoutSecs = 300}) async {
    final deadline = DateTime.now().add(Duration(seconds: timeoutSecs));
    while (DateTime.now().isBefore(deadline)) {
      try {
        // Request verbose tx (true = return JSON with confirmations)
        final result = await _electrum.request(
            'blockchain.transaction.get', [txid, true]);
        if (result is Map && result.containsKey('confirmations')) {
          final confs = result['confirmations'] as int;
          if (confs > 0) return;
        }
      } catch (_) {
        // Some Electrum servers don't support verbose mode; fall back to
        // checking if the tx appears in our scripthash history with height > 0
        final history = await _electrum.request(
            'blockchain.scripthash.get_history', [_scriptHash]);
        for (final item in (history as List)) {
          if (item['tx_hash'] == txid && (item['height'] as int) > 0) return;
        }
      }
      await Future.delayed(Duration(seconds: 10));
    }
    throw Exception('Timed out waiting for confirmation of $txid');
  }

  Future<void> close() async {
    await _electrum.close();
  }
}
