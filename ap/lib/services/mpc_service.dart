import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/bitcoin.dart';
import 'package:client/client.dart';
import 'package:client/policy.dart';
import 'package:hive/hive.dart';
import 'dart:math';
import 'package:protocol/protocol.dart';

class MpcService extends ChangeNotifier {
  MpcClient? _client;
  bool _isInitialized = false;
  Future<void>? _persistenceInitFuture;
  bool _dkgComplete = false;
  Box? _identityBox;

  String? _storageId;

  MpcClient? get client => _client;
  bool get isInitialized => _isInitialized;

  MpcBitcoinWallet? _wallet;
  MpcBitcoinWallet? get wallet => _wallet;

  BigInt _balance = BigInt.zero;
  BigInt get balance => _balance;
  List<TransactionSummary> get transactions => _wallet?.transactions ?? [];
  ProtectedPolicy? get activePolicy => _client?.activeSpendingPolicy;
  List<ProtectedPolicy> get policies => _client?.spendingPolicies ?? [];

  void policyUpdated() {
    notifyListeners();
  }

  String? get receiveAddress {
    if (_wallet == null) return null;
    // Force Regtest format for this environment
    return _wallet!.toAddressCustom(hrp: 'bcrt');
  }

  Future<void> refreshHistory() async {
    if (_wallet != null) {
      await _wallet!.sync();
      _balance = await _wallet!.getBalance();
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
      _storageId = _identityBox!.get('storageId') as String?;
      if (_storageId == null || _storageId!.isEmpty) {
        _storageId = 'mpc_wallet_state_${_generateSessionId()}';
        await _identityBox!.put('storageId', _storageId);
      }

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

    if (_dkgComplete) {
      throw StateError("DKG already completed for this user.");
    }

    final storageId = _storageId ?? 'mpc_wallet_state_default';

    // Create channel
    final channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = MpcClient(channel, storageId: storageId);

    _wallet = MpcBitcoinWallet(_client!, isTestnet: true, storageId: storageId);

    await _wallet!.init();
    _balance = await _wallet!.getBalance();

    _dkgComplete = true;

    notifyListeners();
  }

  String _generateSessionId() {
    final r = Random.secure();
    return List.generate(
        16, (index) => r.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }
}
