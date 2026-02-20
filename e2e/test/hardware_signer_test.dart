import 'dart:io';
import 'dart:async';
import 'package:test/test.dart';
import 'package:client/client.dart';
import 'package:client/bitcoin.dart';
import 'package:client/hardware_signer.dart';
import 'package:e2e/regtest_helper.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

/// E2E test for hardware signer integration.
///
/// Prerequisites: `make regtest` must be running (bitcoind, electrs,
/// signer-server on 9090, MPC server on 50051).
void main() {
  late RegtestHelper btc;
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('mpc_hw_e2e_');
    Hive.init(tempDir.path);

    // Use existing Docker + services started by `make regtest`
    btc = RegtestHelper(rpcUrl: "http://127.0.0.1:18443/wallet/default");

    // Verify bitcoind is reachable
    try {
      await btc.getNewAddress();
      print("Bitcoind reachable.");
    } catch (e) {
      throw Exception("Bitcoind not reachable. Run 'make regtest' first: $e");
    }
  });

  tearDownAll(() async {
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Hardware signer DKG + normal transaction (no signer needed)', () async {
    // 1. Connect to signer-server
    print('1. Connecting to hardware signer on 127.0.0.1:9090');
    final signer = TcpHardwareSigner(host: '127.0.0.1', port: 9090);
    await signer.connect();
    print('   Connected.');

    // Verify signer has no key yet
    final infoBefore = await signer.getInfo();
    print('   Signer info: hasKeyPackage=${infoBefore.hasKeyPackage}');
    expect(infoBefore.hasKeyPackage, isFalse);

    // 2. MPC Setup with hardware signer as recovery identity
    print('2. Running DKG with hardware signer...');
    final channel = ClientChannel(
      '127.0.0.1',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = MpcClient(channel, hardwareSigner: signer);

    await client.doDkg();
    print('   DKG Complete.');

    // Verify signer now has a key package
    final infoAfter = await signer.getInfo();
    print('   Signer info: hasKeyPackage=${infoAfter.hasKeyPackage}');
    expect(infoAfter.hasKeyPackage, isTrue);

    // 3. Init Wallet
    print('3. Initializing wallet...');
    final wallet = MpcBitcoinWallet(client, isTestnet: true);
    await wallet.init();

    final address = wallet.toAddressCustom(hrp: 'bcrt');
    print('   Wallet Address: $address');
    expect(address, isNotNull);
    expect(address, startsWith('bcrt1'));

    // 4. Fund Wallet
    print('4. Funding wallet with 1 BTC...');
    final minerAddr = await btc.getNewAddress();

    final txId = await btc.sendToAddress(address, 1.0);
    print('   Funded: $txId');
    await btc.generateToAddress(1, minerAddr);

    // 5. Sync and verify balance
    print('5. Syncing wallet...');
    int retries = 30;
    while (retries > 0) {
      try {
        await wallet.sync();
        final utxos = await wallet.store.getUtxos();
        if (utxos.isNotEmpty) break;
        print("   Synced 0 UTXOs, retrying... ($retries left)");
      } catch (e) {
        print("   Sync error: $e, retrying...");
      }
      retries--;
      if (retries > 0) await Future.delayed(Duration(seconds: 2));
    }

    final utxos = await wallet.store.getUtxos();
    expect(utxos.length, greaterThanOrEqualTo(1));
    final balance = utxos.fold(BigInt.zero, (s, u) => s + u.utxo.value);
    print('   Balance: $balance sats (${utxos.length} UTXOs)');

    // 6. Normal spend — this uses signing identity + server (no hardware signer)
    print('6. Normal spend (10,000 sats) — no hardware signer involved...');
    final dest = await btc.getNewAddress();
    final unsignedTx = await wallet.createTransaction(
        destination: dest, amount: BigInt.from(10000), feeRate: 1);
    final hexTx = await wallet.signTransaction(unsignedTx);
    final spendTxId = await wallet.broadcast(hexTx);
    print('   Broadcast: $spendTxId');
    await btc.generateToAddress(1, minerAddr);

    // Verify transaction confirmed
    await Future.delayed(Duration(seconds: 2));
    final txInfo = await btc.getRawTransaction(spendTxId);
    expect(txInfo['confirmations'], greaterThanOrEqualTo(1));
    print('   Confirmed with ${txInfo['confirmations']} confirmation(s).');

    // Cleanup — use terminate() to avoid hanging on open streams
    print('   Cleaning up...');
    try {
      await signer.disconnect().timeout(Duration(seconds: 5));
    } catch (e) {
      print('   Signer disconnect: $e');
    }
    try {
      await channel.terminate();
    } catch (e) {
      print('   Channel terminate: $e');
    }

    print('Hardware signer E2E test passed!');
  }, timeout: Timeout(Duration(minutes: 5)));
}
