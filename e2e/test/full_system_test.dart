import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:test/test.dart';
import 'package:client/client.dart';
import 'package:client/bitcoin.dart';
import 'package:client/hardware_signer.dart';
import 'package:e2e/regtest_helper.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';
import 'package:fixnum/fixnum.dart';

void main() {
  Process? serverProcess;
  late RegtestHelper btc;
  late Directory tempDir;
  late Directory serverTempDir;
  late int serverPort;

  Future<void> waitForUtxoByTxId(MpcBitcoinWallet wallet, String expectedTxId,
      {int retries = 30}) async {
    while (retries > 0) {
      await wallet.sync();
      final utxos = await wallet.store.getUtxos();
      final hasExpected = utxos.any((u) => u.utxo.txHash == expectedTxId);
      if (hasExpected) return;
      print("Waiting for change UTXO from $expectedTxId... ($retries left)");
      retries--;
      if (retries > 0) {
        await Future.delayed(Duration(seconds: 2));
      }
    }
    fail("Timed out waiting for change UTXO from $expectedTxId");
  }

  setUpAll(() async {
    print('--- Setup ---');

    // 0. Hive Init
    tempDir = await Directory.systemTemp.createTemp('mpc_e2e_');
    Hive.init(tempDir.path);

    // 1. Docker
    print('Starting Docker (Bitcoind)...');
    var dRes = await Process.run('docker', [
      'compose',
      'up',
      '-d',
      'bitcoind',
    ]);
    if (dRes.exitCode != 0)
      throw Exception("Docker Bitcoind failed: ${dRes.stderr}");

    print("Waiting for Bitcoind (10s)...");
    await Future.delayed(Duration(seconds: 10));

    print('Starting Docker (Electrs)...');
    dRes = await Process.run('docker', [
      'compose',
      'up',
      '-d',
      'electrs',
    ]);
    if (dRes.exitCode != 0)
      throw Exception("Docker Electrs failed: ${dRes.stderr}");

    // Wait for services to stabilize
    print("Waiting for Electrs (20s)...");
    await Future.delayed(Duration(seconds: 20));

    // Probe
    btc = RegtestHelper();
    try {
      try {
        await btc.createWallet("default");
      } catch (e) {
        if (!e.toString().contains("already loaded")) rethrow;
      }
      btc = RegtestHelper(rpcUrl: "http://127.0.0.1:18443/wallet/default");
      await btc.getNewAddress();
      print("Docker Regtest Operational.");
    } catch (e) {
      throw Exception("Docker started but RPC unreachable: $e");
    }

    // 2. Server (Rust)
    print('Starting MPC Server...');
    final portSocket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    serverPort = portSocket.port;
    await portSocket.close();
    serverTempDir = await Directory.systemTemp.createTemp('mpc_server_');
    final serverReady = Completer<void>();
    final serverFailed = Completer<void>();
    serverProcess = await Process.start(
      '../server/target/release/server',
      [
        '--wasm', '../cosigner/target/wasm32-wasip1/release/cosigner.wasm',
        '--port', serverPort.toString(),
      ],
      mode: ProcessStartMode.normal,
      environment: {
        'ELECTRUM_URL': '127.0.0.1',
        'ELECTRUM_PORT': '50001',
        'BITCOIN_RPC_USER': 'admin1',
        'BITCOIN_RPC_PASSWORD': '123',
        'HOME': serverTempDir.path,
      },
    );
    final stdoutBuffer = StringBuffer();
    serverProcess!.stdout.transform(utf8.decoder).listen((data) {
      stdoutBuffer.write(data);
      print('[Server]: $data');
      if (!serverReady.isCompleted &&
          stdoutBuffer.toString().contains('MPC Wallet Server listening on')) {
        serverReady.complete();
      }
    }, onDone: () {
      if (!serverReady.isCompleted && !serverFailed.isCompleted) {
        serverFailed.complete();
      }
    });
    // Server uses tracing which outputs to stderr
    final stderrBuffer = StringBuffer();
    serverProcess!.stderr.transform(utf8.decoder).listen((data) {
      stderrBuffer.write(data);
      print('[Server]: $data');
      if (!serverReady.isCompleted &&
          stderrBuffer.toString().contains('MPC Wallet Server listening on')) {
        serverReady.complete();
      }
    }, onDone: () {
      if (!serverReady.isCompleted && !serverFailed.isCompleted) {
        serverFailed.complete();
      }
    });

    try {
      await Future.any([
        serverReady.future,
        serverFailed.future.then((_) {
          throw Exception("MPC Server failed to start");
        }),
      ]).timeout(Duration(seconds: 15), onTimeout: () {
        throw Exception("MPC Server did not become ready in time");
      });
    } catch (e) {
      serverProcess?.kill();
      try {
        await serverTempDir.delete(recursive: true);
      } catch (_) {}
      rethrow;
    }
    print('--- Setup Complete ---');
  });

  tearDownAll(() async {
    serverProcess?.kill();
    try {
      await serverTempDir.delete(recursive: true);
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Full E2E Regtest Flow with Policies', () async {
    // 1. MPC Setup
    print('1. MPC Setup');
    final channel = ClientChannel(
      '127.0.0.1',
      port: serverPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final signer = TcpHardwareSigner(host: '127.0.0.1', port: 9090);
    await signer.connect();
    final client1 = MpcClient(channel, hardwareSigner: signer);

    await client1.doDkg();
    print('DKG Complete');

    // 2. Init Wallet
    final wallet = MpcBitcoinWallet(client1, isTestnet: true);
    await wallet.init();

    final address = wallet.toAddressCustom(hrp: 'bcrt');
    print('Wallet Address: $address');

    // 3. Fund Wallet
    print('2. Funding Wallet 1');
    final minerAddr = await btc.getNewAddress();
    await btc.generateToAddress(101, minerAddr);

    final txId = await btc.sendToAddress(address, 1.0);
    print('Funded Wallet 1 with $txId');
    await btc.generateToAddress(1, minerAddr);

    // 4. Sync Wallet
    print('3. Syncing Wallet 1');
    try {
      int retries = 30;
      while (retries > 0) {
        try {
          await wallet.sync();
          final utxos = await wallet.store.getUtxos();
          if (utxos.isNotEmpty) break;
          print("Synced 0 UTXOs from server. Retrying... ($retries left)");
        } catch (e) {
          print("Sync error: $e, retrying...");
        }
        retries--;
        if (retries > 0) await Future.delayed(Duration(seconds: 2));
      }
      final utxos = await wallet.store.getUtxos();

      if (utxos.isEmpty) {
        // Debug: Check Bitcoind direct view
        try {
          final scan = await btc.scanUtxos(address);
          print("DEBUG: Bitcoind scanUtxos for $address: $scan");
        } catch (e) {
          print("DEBUG: scanUtxos failed: $e");
        }

        // Dump logs
        final logs = await Process.run('docker', ['logs', 'mpc_electrs']);
        print("DEBUG: Electrs Logs:\n${logs.stdout}\n${logs.stderr}");
      }

      expect(utxos.length, greaterThanOrEqualTo(1));
      print(
          'Synced: ${utxos.length} UTXOs. Balance: ${utxos.fold(BigInt.zero, (s, u) => s + u.utxo.value)}');
    } catch (e) {
      fail("Failed to sync wallet: $e");
    }

    // 5. Initial Spend (Normal)
    print('4. Normal Spend (100,000 sats)');
    final dest1 = await btc.getNewAddress();
    // Using wallet helper
    final unsignedTx1 = await wallet.createTransaction(
        destination: dest1, amount: BigInt.from(10000), feeRate: 1);
    final hexTx1 = await wallet.signTransaction(unsignedTx1);
    final tx1Id = await wallet.broadcast(hexTx1);
    print('Normal Spend Broadcast: $tx1Id');
    await btc.generateToAddress(1, minerAddr);
    await waitForUtxoByTxId(wallet, tx1Id);

    // 6. Create Spending Policy (Threshold 50,000 sats)
    // History is now 10,000 sats spend.
    // Next transaction should trigger Policy.
    print('5. Creating Spending Policy (Limit 50,000 sats)');
    final interval = Duration(hours: 1);
    const pin = "123456";
    final limit = Int64(50000);

    // Create policy on server
    await client1.createSpendingPolicy(interval, limit, pin);
    print('Spending Policy Created. PIN protected.');

    // 7. Attempt Spend exceeding limit (Wallet API -> Should Fail)
    print('6. Attempting Spend (60,000 sats) via Wallet API (Expect Failure)');
    // Current window usage: 10,000. Limit 50,000. Any spend triggers policy.
    bool failed = false;
    try {
      final dest2 = await btc.getNewAddress();
      final unsignedTx2 = await wallet.createTransaction(
          destination: dest2, amount: BigInt.from(60000), feeRate: 1);

      await wallet.signTransaction(unsignedTx2);
    } catch (e) {
      print('Expected Failure Caught: $e');
      failed = true;
    }
    expect(failed, isTrue, reason: "Transaction should fail without PIN");

    // 8. Spend with PIN (Manual Construction)
    print('7. Spending with PIN (Manual Construction)');
    // We need to manually construct the transaction and call client.sign with PIN.

    // a. Select Inputs
    await waitForUtxoByTxId(wallet, tx1Id);

    final dest3 = await btc.getNewAddress();
    final unsignedTx2 = await wallet.createTransaction(
        destination: dest3, amount: BigInt.from(60000), feeRate: 1);
    final policyId = await wallet.getPolicyId(unsignedTx2);
    final hexTx2 =
        await wallet.signTransaction(unsignedTx2, policyId: policyId, pin: pin);
    final tx2Id = await wallet.broadcast(hexTx2);
    print('Normal Spend Broadcast: $tx2Id');
    await btc.generateToAddress(1, minerAddr);

    // Wait for Electrs to index the new block
    await waitForUtxoByTxId(wallet, tx2Id);
    await wallet.sync();

    final balance = await wallet.store
        .getUtxos()
        .then((l) => l.fold(BigInt.zero, (s, u) => s + u.utxo.value).toInt());

    print('Final Balance: ${balance}');
    final res = await btc.getRawTransaction(tx2Id);
    expect(res['confirmations'], 1);

    // 9. Delete Spending Policy
    print('8. Deleting Spending Policy');
    final policy = client1.activeSpendingPolicy;
    expect(policy, isNotNull, reason: "Should have an active policy to delete");
    await client1.deletePolicy(policy!.id);
    expect(client1.hasSpendingPolicy, isFalse,
        reason: "Policy should be removed after deletion");
    print('   Policy deleted: ${policy.id}');

    // 10. Verify spend works without PIN after policy deletion
    print('9. Spending without PIN after policy deletion (should succeed)');
    await waitForUtxoByTxId(wallet, tx2Id);
    await wallet.sync();
    final dest5 = await btc.getNewAddress();
    final unsignedTx4 = await wallet.createTransaction(
        destination: dest5, amount: BigInt.from(60000), feeRate: 1);
    final hexTx4 = await wallet.signTransaction(unsignedTx4);
    final tx4Id = await wallet.broadcast(hexTx4);
    print('   Broadcast: $tx4Id');
    await btc.generateToAddress(1, minerAddr);
    await waitForUtxoByTxId(wallet, tx4Id);

    // 11. Restore wallet (simulate new phone)
    print('10. Restoring wallet via re-DKG');
    final originalAddress = address;
    final client2 = MpcClient(channel, hardwareSigner: signer, storageId: 'restore_e2e');
    await client2.doRestore();
    print('   Restore Complete');

    final wallet2 = MpcBitcoinWallet(client2, isTestnet: true);
    await wallet2.init();
    final restoredAddress = wallet2.toAddressCustom(hrp: 'bcrt');
    print('   Restored Address: $restoredAddress');
    expect(restoredAddress, equals(originalAddress),
        reason: "Restored wallet must have the same Bitcoin address");

    // 12. Sync restored wallet
    // Wait for init()'s background sync to settle to avoid auth replay
    await Future.delayed(Duration(seconds: 2));
    print('11. Syncing restored wallet');
    int syncRetries = 30;
    while (syncRetries > 0) {
      try {
        await wallet2.sync();
      } catch (e) {
        print('   Sync error (retrying): $e');
        syncRetries--;
        if (syncRetries > 0) await Future.delayed(Duration(seconds: 2));
        continue;
      }
      final utxos = await wallet2.store.getUtxos();
      if (utxos.isNotEmpty) break;
      print('   Waiting for UTXO... ($syncRetries left)');
      syncRetries--;
      if (syncRetries > 0) await Future.delayed(Duration(seconds: 2));
    }
    final restoredUtxos = await wallet2.store.getUtxos();
    expect(restoredUtxos.length, greaterThanOrEqualTo(1),
        reason: "Restored wallet should see existing UTXOs");
    print('   Balance: ${restoredUtxos.fold(BigInt.zero, (s, u) => s + u.utxo.value)} sats');

    // 13. Sign with restored wallet
    print('12. Signing transaction with restored wallet');
    final dest4 = await btc.getNewAddress();
    final unsignedTx3 = await wallet2.createTransaction(
        destination: dest4, amount: BigInt.from(10000), feeRate: 1);
    final hexTx3 = await wallet2.signTransaction(unsignedTx3);
    final tx3Id = await wallet2.broadcast(hexTx3);
    print('    Broadcast: $tx3Id');
    await btc.generateToAddress(1, minerAddr);

    await Future.delayed(Duration(seconds: 2));
    final res2 = await btc.getRawTransaction(tx3Id);
    expect(res2['confirmations'], 1,
        reason: "Post-restore transaction should be confirmed");

    print('Testing Complete.');
  }, timeout: Timeout(Duration(minutes: 10)));

  test('Policy: Cumulative spending within window', () async {
    // This test verifies that the policy engine correctly tracks cumulative
    // spending across multiple transactions within the same time window.
    //
    // Bug scenario: 50,000 sat policy limit
    //   - Spend 20,000 sats → under limit, goes through with normal policy
    //   - Spend 31,000 sats → cumulative 51,000 > 50,000, SHOULD require PIN
    //   - Previously the second spend also went through without PIN

    print('=== Policy Cumulative Spending Test ===');

    // 1. Setup fresh client
    print('1. MPC Setup');
    final channel = ClientChannel(
      '127.0.0.1',
      port: serverPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final signer = TcpHardwareSigner(host: '127.0.0.1', port: 9090);
    await signer.connect();
    final client = MpcClient(channel, hardwareSigner: signer, storageId: 'policy_cumulative');

    await client.doDkg();
    print('   DKG Complete');

    final wallet = MpcBitcoinWallet(client, isTestnet: true);
    await wallet.init();
    final address = wallet.toAddressCustom(hrp: 'bcrt');
    print('   Wallet Address: $address');

    // 2. Fund wallet generously
    print('2. Funding wallet');
    final minerAddr = await btc.getNewAddress();
    // Mine blocks to ensure miner has enough to send
    await btc.generateToAddress(10, minerAddr);

    final txId = await btc.sendToAddress(address, 0.5); // 50,000,000 sats
    await btc.generateToAddress(1, minerAddr);
    print('   Funded with $txId');

    // 3. Sync wallet
    print('3. Syncing wallet');
    int retries = 30;
    while (retries > 0) {
      await wallet.sync();
      final utxos = await wallet.store.getUtxos();
      if (utxos.isNotEmpty) break;
      print('   Waiting for UTXO... ($retries left)');
      retries--;
      if (retries > 0) await Future.delayed(Duration(seconds: 2));
    }
    final utxos = await wallet.store.getUtxos();
    expect(utxos.length, greaterThanOrEqualTo(1));
    final bal = utxos.fold(BigInt.zero, (s, u) => s + u.utxo.value);
    print('   Balance: $bal sats');

    // 4. Create spending policy: 50,000 sat limit, 1 hour window
    print('4. Creating spending policy (50,000 sat limit, 1h window)');
    const pin = "654321";
    await client.createSpendingPolicy(Duration(hours: 1), Int64(50000), pin);
    expect(client.hasSpendingPolicy, isTrue);
    print('   Policy created');

    // 5. First spend: 20,000 sats — under limit, should succeed without PIN
    print('5. First spend: 20,000 sats (under limit, no PIN)');
    final dest1 = await btc.getNewAddress();
    final unsigned1 = await wallet.createTransaction(
        destination: dest1, amount: BigInt.from(20000), feeRate: 1);
    final hex1 = await wallet.signTransaction(unsigned1);
    final tx1 = await wallet.broadcast(hex1);
    print('   Broadcast: $tx1');
    await btc.generateToAddress(1, minerAddr);
    await waitForUtxoByTxId(wallet, tx1);

    // 6. Second spend: 31,000 sats — cumulative 51,000 > 50,000, should FAIL without PIN
    print('6. Second spend: 31,000 sats (cumulative 51k > 50k limit, no PIN — expect failure)');
    await wallet.sync();
    bool secondSpendFailed = false;
    try {
      final dest2 = await btc.getNewAddress();
      final unsigned2 = await wallet.createTransaction(
          destination: dest2, amount: BigInt.from(31000), feeRate: 1);
      await wallet.signTransaction(unsigned2);
    } catch (e) {
      print('   Expected failure: $e');
      secondSpendFailed = true;
    }
    expect(secondSpendFailed, isTrue,
        reason: "Second spend should fail without PIN because cumulative (20k+31k=51k) exceeds 50k limit");

    // 7. Same spend with PIN — should succeed
    print('7. Second spend: 31,000 sats WITH PIN (should succeed)');
    final dest3 = await btc.getNewAddress();
    final unsigned3 = await wallet.createTransaction(
        destination: dest3, amount: BigInt.from(31000), feeRate: 1);
    final policyId = await wallet.getPolicyId(unsigned3);
    final hex3 = await wallet.signTransaction(unsigned3, policyId: policyId, pin: pin);
    final tx3 = await wallet.broadcast(hex3);
    print('   Broadcast: $tx3');
    await btc.generateToAddress(1, minerAddr);
    await waitForUtxoByTxId(wallet, tx3);

    // 8. Third spend: small amount — cumulative now ~82k, any spend should require PIN
    print('8. Third spend: 5,000 sats (cumulative ~82k > 50k, no PIN — expect failure)');
    await wallet.sync();
    bool thirdSpendFailed = false;
    try {
      final dest4 = await btc.getNewAddress();
      final unsigned4 = await wallet.createTransaction(
          destination: dest4, amount: BigInt.from(5000), feeRate: 1);
      await wallet.signTransaction(unsigned4);
    } catch (e) {
      print('   Expected failure: $e');
      thirdSpendFailed = true;
    }
    expect(thirdSpendFailed, isTrue,
        reason: "Any spend should require PIN when cumulative already exceeds limit");

    // 9. Under-limit spend after policy deletion should work
    print('9. Delete policy, then spend without PIN');
    final activePolicy = client.activeSpendingPolicy!;
    await client.deletePolicy(activePolicy.id);
    expect(client.hasSpendingPolicy, isFalse);

    final dest5 = await btc.getNewAddress();
    final unsigned5 = await wallet.createTransaction(
        destination: dest5, amount: BigInt.from(5000), feeRate: 1);
    final hex5 = await wallet.signTransaction(unsigned5);
    final tx5 = await wallet.broadcast(hex5);
    print('   Broadcast: $tx5');
    await btc.generateToAddress(1, minerAddr);

    await Future.delayed(Duration(seconds: 2));
    final res = await btc.getRawTransaction(tx5);
    expect(res['confirmations'], 1);

    print('=== Policy Cumulative Spending Test Complete ===');
  }, timeout: Timeout(Duration(minutes: 10)));
}
