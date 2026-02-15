import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:grpc/grpc.dart';
import 'package:threshold/threshold.dart' as threshold;
import 'package:client/client.dart';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:fixnum/fixnum.dart';
import 'package:hive/hive.dart';

import 'package:server/server.dart';
import 'package:server/bitcoin.dart';
import 'package:server/bitcoin_service.dart';
import 'package:server/persistence/store.dart';

void main() {
  late Server server;
  late ClientChannel channel;
  late MPCWalletService service;
  late HttpServer mockBitcoind;
  Directory? tempDir;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync("policies_test_");
    Hive.init(tempDir!.path);

    // Start Mock Bitcoind
    mockBitcoind = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    mockBitcoind.listen((request) async {
      final content = await utf8.decoder.bind(request).join();
      final json = jsonDecode(content);
      final method = json['method'];

      var result;
      if (method == 'sendrawtransaction') {
        // Return a fake TXID
        result =
            "0000000000000000000000000000000000000000000000000000000000000001";
      } else {
        result = null;
      }

      request.response
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({"result": result, "error": null, "id": json['id']}))
        ..close();
    });

    final dkgStore = DKGSessionStore();
    final policyStore = PolicyStore();
    final refreshStore = RefreshSessionStore();
    final signingStore = SigningSessionStore();
    final utxoStore = UtxoStore();

    await dkgStore.init();
    await policyStore.init();
    await refreshStore.init();
    await signingStore.init();
    await utxoStore.init();

    service = MPCWalletService(
        dkgStore: dkgStore,
        signingStore: signingStore,
        refreshStore: refreshStore,
        policyStore: policyStore,
        utxoStore: utxoStore,
        bitcoinService: BitcoinService(utxoStore,
            rpcUrl: "http://localhost:${mockBitcoind.port}",
            rpcUser: "admin1",
            rpcPassword: "123"),
        historyService: BitcoinHistoryService());

    server = Server.create(services: [service]);
    await server.serve(port: 0);
    channel = ClientChannel(
      'localhost',
      port: server.port!,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  });

  tearDown(() async {
    await channel.shutdown();
    await server.shutdown();
    await mockBitcoind.close();
    await Hive.close();
    if (tempDir != null && tempDir!.existsSync()) {
      tempDir!.deleteSync(recursive: true);
    }
  });

  test('E2E Policies Flow', () async {
    // 1. DKG
    final client = MpcClient(channel, minSigners: 2, maxSigners: 3);
    await client.doDkg();
    expect(client.isInitialized, isTrue);

    // 2. Broadcast Funding Transaction (to populate Server UTXOs)
    // We need to create a dummy Tx that outputs to our P2TR address.
    final pubKeyPkg = client.getTweakedPublicKeyPackage(null)!;
    final point = pubKeyPkg.verifyingKey.E;
    final pointBytes = threshold.elemSerializeCompressed(point);
    final ecPub = ECPublic.fromHex(BytesUtils.toHexString(pointBytes));
    final p2tr = P2trAddress.fromProgram(
        program: BytesUtils.toHexString(ecPub.toXOnly()));
    final myAddress = p2tr.toAddress(
        BitcoinNetwork.testnet); // Regtest often maps to testnet in libs

    // Dummy Output: 10,000 sats
    final output = TxOutput(
        amount: BigInt.from(10000), scriptPubKey: p2tr.toScriptPubKey());
    // Dummy Input
    final input = TxInput(
      txId: "00" * 32,
      txIndex: 0,
      scriptSig: Script(script: []),
    );

    final fundingTx = BtcTransaction(
      inputs: [input],
      outputs: [output],
    );
    final fundingTxHex = fundingTx.serialize();

    // Broadcast
    await client.broadcastTransaction(fundingTxHex);

    // *CRITICAL*: The server saved this to UtxoStore.
    // We need to verify if the server's IN-MEMORY UtxoState has it.
    // If not, policy check will fail (balance 0).
    // (We anticipate this might fail if _getUtxoState doesn't load from store).

    // 3. Create Spending Policy (Limit 1000 sats)
    // We use Refresh Flow for this.
    // Interval 60s, Threshold 1000 sats.
    await client.createSpendingPolicy(
        Duration(seconds: 60), Int64(1000), "1234");

    // 4. Tx 1: Spend 500 Sats (Success Expected)
    // Input: The Utxo from Funding Tx (TxId 00...01, Vout 0, Amount 10000)
    // Output: External (500), Change (9500)
    // Wait, Funding Tx ID was returned by Mock Bitcoind as "...01".
    final utxoTxId =
        "0000000000000000000000000000000000000000000000000000000000000001";

    final spendInput = TxInput(
      txId: utxoTxId,
      txIndex: 0,
      scriptSig: Script(script: []),
    );
    final destOutput = TxOutput(
        amount: BigInt.from(500),
        scriptPubKey:
            P2trAddress.fromProgram(program: "00" * 32).toScriptPubKey());
    final changeOutput = TxOutput(
        amount: BigInt.from(9500), scriptPubKey: p2tr.toScriptPubKey());

    final spendTx1 = BtcTransaction(
      inputs: [spendInput],
      outputs: [destOutput, changeOutput],
    );

    // Sign
    final msg1 = Uint8List.fromList(List.filled(32, 1)); // Dummy Hash
    final fullTx1 = BytesUtils.fromHexString(spendTx1.serialize());

    // We must pass inputUtxos to signWithContext so Client/Server can verify?
    // Server looks up UTXOs from its store. Client doesn't need to send them in `signStep1` unless for validation?
    // `signStep1` request has `inputUtxos` field. But `_calculateSpentAmount` uses `_utxos[deviceId]`.
    // It does NOT use `request.inputUtxos`.
    // So we assume Server knows the UTXO.

    print("Signing Tx 1 (500 sats)...");
    // Use client.sign with fullTransaction
    final sig1 = await client.sign(msg1, fullTransaction: fullTx1);
    expect(sig1, isNotNull); // Should succeed (Normal Policy)

    // 5. Tx 2: Spend 600 Sats (Total 1100 > 1000) -> Failure Expected
    final destOutput2 = TxOutput(
        amount: BigInt.from(600),
        scriptPubKey:
            P2trAddress.fromProgram(program: "00" * 32).toScriptPubKey());
    final changeOutput2 = TxOutput(
        amount: BigInt.from(9400), scriptPubKey: p2tr.toScriptPubKey());

    final spendTx2 = BtcTransaction(
      inputs: [
        spendInput
      ], // Reusing input for simulation (double spend logic not checked here, just policy)
      outputs: [destOutput2, changeOutput2],
    );

    final msg2 = Uint8List.fromList(List.filled(32, 2));
    final fullTx2 = BytesUtils.fromHexString(spendTx2.serialize());

    print('Signing Tx 2 (600 sats, Cumulative 1100)...');
    try {
      await client.sign(msg2, fullTransaction: fullTx2);
      print('Tx 2 Signed Successfully (UNEXPECTED).');
      fail(
          "Should have thrown Invalid Signature exception due to Policy Block");
    } catch (e) {
      print('Tx 2 Signing Failed as Expected: $e');
      expect(e.toString().toLowerCase(), contains('invalid signature'));
    }

    // 6. Tx 2 Retry: Sign with PIN (Success Expected)
    print('Signing Tx 2 Retry with PIN...');
    // get Policy ID
    final realBitcoinTxMsg = Uint8List.fromList(fullTx2);
    final policyId = await client.getPolicyId(realBitcoinTxMsg);
    //print policy ID
    print('Test Policy ID: $policyId');
    // We explicitly provide the policyId (which keys the protected policy map) and the PIN
    final sig2 = await client.sign(msg2,
        fullTransaction: fullTx2, pin: "1234", policyId: policyId);
    expect(sig2, isNotNull);
    print('Tx 2 Signed Successfully with PIN.');
  }, timeout: Timeout(Duration(minutes: 5)));
}
