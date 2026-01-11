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
import 'package:protocol/protocol.dart';

class MpcService extends ChangeNotifier {
  MpcClient? _client;
  bool _isInitialized = false;
  Future<void>? _persistenceInitFuture;
  bool _dkgComplete = false;
  Box? _identityBox;

  String? _deviceId;
  threshold.Identifier? _signingId;
  threshold.Identifier? _recoveryId;

  String? _storedDeviceId;
  String? _storedSigningIdHex;
  String? _storedRecoveryIdHex;

  MpcClient? get client => _client;
  bool get isInitialized => _isInitialized;

  MpcBitcoinWallet? _wallet;
  MpcBitcoinWallet? get wallet => _wallet;

  BigInt get balance => _wallet?.balance ?? BigInt.zero;
  List<TransactionSummary> get transactions => _wallet?.transactions ?? [];

  String? get receiveAddress {
    if (_wallet == null) return null;
    // Force Regtest format for this environment
    return _wallet!.toAddressCustom(hrp: 'bcrt');
  }

  Future<void> refreshHistory() async {
    if (_wallet != null) {
      await _wallet!.sync();
      notifyListeners();
    }
  }

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
    try {
      // 1. Initialize Hive for MpcClient (and us)
      await _ensurePersistenceInitialized();

      // 2. Open our own box for identity persistence
      _identityBox = await Hive.openBox('mpc_service_identity');

      _host = _identityBox!.get('serverHost', defaultValue: '10.0.2.2');
      print("MPC Service: Using host: $_host");

      _dkgComplete = _identityBox!.get('dkgComplete', defaultValue: false);

      _storedDeviceId = _identityBox!.get('deviceId') as String?;
      _storedSigningIdHex = _identityBox!.get('signingId') as String?;
      _storedRecoveryIdHex = _identityBox!.get('recoveryId') as String?;

      _isInitialized = true;
    } catch (e) {
      print("MPC Service Error: $e");
      rethrow;
    }
  }

  /// Closes all resources. Call this when the app is shutting down.
  @override
  Future<void> dispose() async {
    try {
      await _identityBox?.close();
      _identityBox = null;
    } catch (e) {
      print("MPC Service: Error closing identity box: $e");
    }
    super.dispose();
  }

  Future<void> setHost(String host) async {
    if (_host == host && _isInitialized) return;

    print("MPC Service: Switching host to $host");
    _host = host;

    await _ensurePersistenceInitialized();
    if (_identityBox == null || !_identityBox!.isOpen) {
      _identityBox = await Hive.openBox('mpc_service_identity');
    }
    await _identityBox!.put('serverHost', host);
  }

  Future<void> doDkg() async {
    if (!_isInitialized) throw StateError("MPC Service not initialized");

    if (_dkgComplete &&
        _storedDeviceId != null &&
        _storedSigningIdHex != null &&
        _storedRecoveryIdHex != null) {
      print("MPC Service: Restoring local identities...");
      _deviceId = _storedDeviceId;
      _signingId =
          threshold.Identifier(BigInt.parse(_storedSigningIdHex!, radix: 16));
      _recoveryId =
          threshold.Identifier(BigInt.parse(_storedRecoveryIdHex!, radix: 16));
    } else {
      print("MPC Service: Starting fresh (DKG incomplete)...");

      _deviceId = _generateDeviceId();
      _signingId = threshold.Identifier(threshold.modNRandom());
      _recoveryId = threshold.Identifier(threshold.modNRandom());
    }

    // Create channel
    final channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client =
        MpcClient(channel, _signingId!, _recoveryId!, deviceId: _deviceId!);

    _wallet = MpcBitcoinWallet(_client!,
        isTestnet: true, storageId: 'mpc_wallet_state_${_client!.deviceId}');

    await _wallet!.init();

    notifyListeners();
  }

  Future<void> completeDkg() async {
    if (_client == null ||
        _deviceId == null ||
        _signingId == null ||
        _recoveryId == null) {
      throw StateError("Missing identities; cannot finalize DKG.");
    }

    await _ensurePersistenceInitialized();
    if (_identityBox == null || !_identityBox!.isOpen) {
      _identityBox = await Hive.openBox('mpc_service_identity');
    }
    await _identityBox!.put('deviceId', _deviceId);
    await _identityBox!
        .put('signingId', _signingId!.toScalar().toRadixString(16));
    await _identityBox!
        .put('recoveryId', _recoveryId!.toScalar().toRadixString(16));
    await _identityBox!.put('dkgComplete', true);
    _dkgComplete = true;

    notifyListeners();
  }

  String _generateDeviceId() {
    final r = Random.secure();
    return List.generate(
        16, (index) => r.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }
}
