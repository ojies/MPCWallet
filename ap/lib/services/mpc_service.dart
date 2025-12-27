import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/bitcoin.dart';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:client/client.dart';
import 'package:hive/hive.dart';
import 'dart:math';
import 'package:threshold/threshold.dart' as threshold;

class MpcService extends ChangeNotifier {
  MpcClient? _client;
  bool _isInitialized = false;
  Future<void>? _persistenceInitFuture;
  bool _dkgComplete = false;

  String? _deviceId;
  threshold.Identifier? _signingId;
  threshold.Identifier? _recoveryId;

  MpcClient? get client => _client;
  bool get isInitialized => _isInitialized;

  MpcBitcoinWallet? _wallet;
  MpcBitcoinWallet? get wallet => _wallet;

  // Hardcoded for now, could be configurable
  String _host = '10.0.2.2'; // Default, will be overwritten by persistence
  static const int _port = 50051;

  Future<void> _ensurePersistenceInitialized() async {
    _persistenceInitFuture ??= () async {
      final appDir = await getApplicationDocumentsDirectory();
      final persistencePath = '${appDir.path}/mpc_client';
      await MpcClient.initPersistence(path: persistencePath);
    }();
    await _persistenceInitFuture;
  }

  Future<void> init() async {
    if (_isInitialized) return;

    try {
      // 1. Initialize Hive for MpcClient (and us)
      await _ensurePersistenceInitialized();

      // 2. Open our own box for identity persistence
      final identityBox = await Hive.openBox('mpc_service_identity');

      _host = identityBox.get('serverHost', defaultValue: '10.0.2.2');
      print("MPC Service: Using host: $_host");

      _dkgComplete = identityBox.get('dkgComplete', defaultValue: false);

      final storedDeviceId = identityBox.get('deviceId') as String?;
      final storedSigningIdHex = identityBox.get('signingId') as String?;
      final storedRecoveryIdHex = identityBox.get('recoveryId') as String?;

      if (_dkgComplete &&
          storedDeviceId != null &&
          storedSigningIdHex != null &&
          storedRecoveryIdHex != null) {
        print("MPC Service: Restoring local identities...");
        _deviceId = storedDeviceId;
        _signingId =
            threshold.Identifier(BigInt.parse(storedSigningIdHex, radix: 16));
        _recoveryId =
            threshold.Identifier(BigInt.parse(storedRecoveryIdHex, radix: 16));
      } else {
        print("MPC Service: Starting fresh (DKG incomplete)...");
        await identityBox.delete('deviceId');
        await identityBox.delete('signingId');
        await identityBox.delete('recoveryId');
        await identityBox.put('dkgComplete', false);

        _deviceId = _generateDeviceId();
        _signingId = threshold.Identifier(threshold.modNRandom());
        _recoveryId = threshold.Identifier(threshold.modNRandom());
      }

      await _connectAndInitializeClient(_signingId!, _recoveryId!, _deviceId!,
          initializeWallet: _dkgComplete);

      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      print("MPC Service Error: $e");
      rethrow;
    }
  }

  Future<void> _connectAndInitializeClient(threshold.Identifier signingId,
      threshold.Identifier recoveryId, String deviceId,
      {bool initializeWallet = true}) async {
    // Create channel
    final channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = MpcClient(channel, signingId, recoveryId, deviceId: deviceId);

    // Restore client state (policies, etc.)
    await _client!.restoreState();

    if (initializeWallet) {
      // Initialize Bitcoin Wallet Wrapper
      // Note: isTestnet true for Regtest usually
      _wallet = MpcBitcoinWallet(_client!,
          isTestnet: true, storageId: 'mpc_wallet_state_${_client!.deviceId}');
      await _wallet!.init();

      if (_wallet?.address != null) {
        try {
          print(
              "MPC Service: Initialized. Address: ${_wallet!.address.toAddress(BitcoinNetwork.testnet)}");
        } catch (_) {
          print("MPC Service: Initialized but address pending DKG.");
        }
      }
    }
  }

  Future<void> setHost(String host) async {
    if (_host == host && _isInitialized) return;

    print("MPC Service: Switching host to $host");
    _host = host;

    await _ensurePersistenceInitialized();
    final identityBox = await Hive.openBox('mpc_service_identity');
    await identityBox.put('serverHost', host);

    // If we are already initialized, we need to re-connect
    if (_isInitialized && _client != null) {
      // We can reuse the existing identities
      // But we need to recreate the channel and client.
      // Ideally we should close the old channel if possible, but grpc-dart channels are lazy?
      // Let's just re-run the connection part.

      // Note: Private fields from client like identities are not directly exposed but we saved them in Hive.
      final deviceId = _deviceId ?? identityBox.get('deviceId');
      final signingIdHex = _signingId?.toScalar().toRadixString(16) ??
          identityBox.get('signingId');
      final recoveryIdHex = _recoveryId?.toScalar().toRadixString(16) ??
          identityBox.get('recoveryId');

      if (deviceId != null && signingIdHex != null && recoveryIdHex != null) {
        final signingId =
            threshold.Identifier(BigInt.parse(signingIdHex, radix: 16));
        final recoveryId =
            threshold.Identifier(BigInt.parse(recoveryIdHex, radix: 16));
        await _connectAndInitializeClient(signingId, recoveryId, deviceId,
            initializeWallet: _dkgComplete);
        notifyListeners();
      }
    }
  }

  Future<void> completeDkg() async {
    if (_client == null ||
        _deviceId == null ||
        _signingId == null ||
        _recoveryId == null) {
      throw StateError("Missing identities; cannot finalize DKG.");
    }

    await _ensurePersistenceInitialized();
    final identityBox = await Hive.openBox('mpc_service_identity');
    await identityBox.put('deviceId', _deviceId);
    await identityBox.put(
        'signingId', _signingId!.toScalar().toRadixString(16));
    await identityBox.put(
        'recoveryId', _recoveryId!.toScalar().toRadixString(16));
    await identityBox.put('dkgComplete', true);
    _dkgComplete = true;

    if (_wallet == null) {
      _wallet = MpcBitcoinWallet(_client!,
          isTestnet: true, storageId: 'mpc_wallet_state_${_client!.deviceId}');
      await _wallet!.init();
    }
  }

  String _generateDeviceId() {
    final r = Random();
    return List.generate(
        16, (index) => r.nextInt(255).toRadixString(16).padLeft(2, '0')).join();
  }
}
