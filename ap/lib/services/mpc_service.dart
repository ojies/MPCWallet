import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/bitcoin.dart';
import 'package:client/client.dart';
import 'package:client/hardware_signer.dart';
import 'package:client/policy.dart';
import '../usb/usb_hardware_signer.dart';
import 'package:hive/hive.dart';
import 'dart:math';
import 'package:protocol/protocol.dart';

class MpcService extends ChangeNotifier {
  MpcClient? _client;
  bool _isInitialized = false;
  Future<void>? _persistenceInitFuture;
  bool _dkgComplete = false;
  bool _isConnected = false;
  Box? _identityBox;
  ClientChannel? _channel;

  String? _storageId;

  // Hardware signer settings
  String _signerMode = 'hardware';
  String _signerType = 'tcp'; // 'usb' or 'tcp'
  String _signerHost = '10.0.2.2';
  int _signerPort = 9090;
  HardwareSignerInterface? _hardwareSigner;

  String get signerMode => _signerMode;
  String get signerType => _signerType;

  /// Future that completes when init() finishes. Await this before
  /// checking dkgComplete or calling restoreSession().
  late Future<void> initFuture;

  MpcClient? get client => _client;
  bool get isInitialized => _isInitialized;
  bool get dkgComplete => _dkgComplete;
  bool get isConnected => _isConnected;

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
      try {
        await _wallet!.sync();
        _balance = await _wallet!.getBalance();
        _isConnected = true;
      } catch (e) {
        print("Refresh failed: $e");
        _isConnected = false;
      }
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

      _signerMode = _identityBox!.get('signerMode', defaultValue: 'hardware');
      _signerType = _identityBox!.get('signerType', defaultValue: 'tcp');
      _signerHost = _identityBox!.get('signerHost', defaultValue: '10.0.2.2');
      _signerPort = _identityBox!.get('signerPort', defaultValue: 9090);
      print("MPC Service: Signer type: $_signerType");

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
      await _hardwareSigner?.disconnect();
      _hardwareSigner = null;
    } catch (e) {
      print("MPC Service: Error disconnecting hardware signer: $e");
    }
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

  Future<void> setSignerType(String type) async {
    _signerType = type;
    await _ensurePersistenceInitialized();
    if (_identityBox == null || !_identityBox!.isOpen) {
      _identityBox = await Hive.openBox('mpc_service_identity');
    }
    await _identityBox!.put('signerType', type);
  }

  Future<void> setSignerHost(String host, int port) async {
    _signerHost = host;
    _signerPort = port;
    await _ensurePersistenceInitialized();
    if (_identityBox == null || !_identityBox!.isOpen) {
      _identityBox = await Hive.openBox('mpc_service_identity');
    }
    await _identityBox!.put('signerHost', host);
    await _identityBox!.put('signerPort', port);
  }

  HardwareSignerInterface _createSigner() {
    if (_signerType == 'usb') {
      return UsbHardwareSigner();
    }
    return TcpHardwareSigner(host: _signerHost, port: _signerPort);
  }

  Future<void> doDkg() async {
    if (!_isInitialized) throw StateError("MPC Service not initialized");

    if (_dkgComplete) {
      throw StateError("DKG already completed for this user.");
    }

    final storageId = _storageId ?? 'mpc_wallet_state_default';

    // Connect hardware signer based on type
    _hardwareSigner = _createSigner();
    await _hardwareSigner!.connect();

    _channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = MpcClient(
      _channel!,
      storageId: storageId,
      hardwareSigner: _hardwareSigner!,
    );
    _wallet = MpcBitcoinWallet(_client!, isTestnet: true, storageId: storageId);
    _wallet!.onSyncComplete = _onWalletSyncComplete;

    await _wallet!.init();
    _balance = await _wallet!.getBalance();

    _dkgComplete = true;
    _isConnected = true;
    await _identityBox!.put('dkgComplete', true);

    notifyListeners();
  }

  /// Restores a previously completed session without re-running DKG.
  /// Creates gRPC channel + MpcClient + MpcBitcoinWallet, then calls
  /// wallet.init() which restores keys from Hive persistence.
  Future<void> restoreSession() async {
    if (!_isInitialized) throw StateError("MPC Service not initialized");
    if (!_dkgComplete) throw StateError("DKG not completed. Cannot restore.");

    final storageId = _storageId ?? 'mpc_wallet_state_default';

    // Reconnect hardware signer
    if (_hardwareSigner == null) {
      _hardwareSigner = _createSigner();
      await _hardwareSigner!.connect();
    }

    _channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = MpcClient(
      _channel!,
      storageId: storageId,
      hardwareSigner: _hardwareSigner!,
    );
    _wallet = MpcBitcoinWallet(_client!, isTestnet: true, storageId: storageId);
    _wallet!.onSyncComplete = _onWalletSyncComplete;

    await _wallet!.init();
    _balance = await _wallet!.getBalance();
    _isConnected = true;

    notifyListeners();
  }

  /// Reconnects to the server by tearing down the existing channel
  /// and restoring the session fresh.
  Future<void> reconnect() async {
    if (!_dkgComplete) return;

    _isConnected = false;
    notifyListeners();

    try {
      await _channel?.shutdown();
    } catch (_) {}
    try {
      await _hardwareSigner?.disconnect();
    } catch (_) {}
    _channel = null;
    _client = null;
    _wallet = null;
    _hardwareSigner = null;

    try {
      await restoreSession();
    } catch (e) {
      print("Reconnect failed: $e");
      _isConnected = false;
      notifyListeners();
    }
  }

  /// Called by MpcBitcoinWallet when a background sync completes
  /// (e.g. after a transaction notification from the server).
  Future<void> _onWalletSyncComplete() async {
    try {
      _balance = await _wallet!.getBalance();
      _isConnected = true;
    } catch (e) {
      print("Post-sync balance update failed: $e");
    }
    notifyListeners();
  }

  String _generateSessionId() {
    final r = Random.secure();
    return List.generate(
        16, (index) => r.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }
}
