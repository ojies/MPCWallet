import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:client/policy.dart';
import 'package:grpc/grpc.dart';
import 'package:threshold/core/dkg.dart';
import 'package:threshold/threshold.dart' as threshold;
import 'package:threshold/frost/signing.dart' as frost;
import 'package:threshold/frost/commitment.dart' as frost_comm;
import 'package:protocol/protocol.dart';
import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:client/persistence/wallet_store.dart';

class MpcClient {
  final MPCWalletClient _stub;
  // Store
  late final WalletStore _store;

  // Unique Session ID for this client instance (persisted or generated)
  String _deviceId;
  String get deviceId => _deviceId;

  // Two identities
  final threshold.Identifier _signingId;
  final threshold.Identifier _recoveryId;

  final int _maxSigners;
  final int _minSigners;

  threshold.SecretKey? _signingSecret;
  threshold.SecretKey? _recoverySecret;

  SpendingPolicy? _normalPolicy;
  Map<String, ProtectedPolicy> _protectedPolicies;

  RecoveryPolicy? _recoveryPolicy;

  // Bitcoin Wallet removed (Decoupled)

  /// Creates a client that manages two shares (identities).
  /// [id1] and [id2] are the identifiers for this client's two shares.
  /// [deviceId] identifies this DKG session. If null, a random one is generated.
  MpcClient(ClientChannel channel, this._signingId, this._recoveryId,
      {int maxSigners = 3,
      int minSigners = 2,
      String? deviceId,
      String? storageId})
      : _stub = MPCWalletClient(channel),
        _deviceId = deviceId ?? _generateDeviceId(),
        _maxSigners = maxSigners,
        _minSigners = minSigners,
        _protectedPolicies = {} {
    _store = WalletStore(boxName: storageId ?? 'mpc_wallet_state_$_deviceId');
  }

  static String _generateDeviceId() {
    final r = Random.secure();
    return List.generate(
        16, (index) => r.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }

  /// Initializes persistence for the client.
  /// [path] is the directory where client state will be stored.
  /// If [path] is null, defaults to `$HOME/.mpc_wallet/client`.
  static Future<void> initPersistence({String? path}) async {
    String storePath;
    if (path != null) {
      storePath = path;
    } else {
      final home = Platform.environment['HOME'] ?? Directory.current.path;
      storePath = p.join(home, '.mpc_wallet', 'client');
    }

    final dir = Directory(storePath);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    Hive.init(storePath);
  }

  bool get isInitialized => _normalPolicy != null && _recoveryPolicy != null;

  /// Restores client state from persistence.
  /// [debugState] can be provided to inject state for testing (bypassing store).
  /// Returns true if state was found and restored.
  Future<bool> restoreState({Map<String, dynamic>? debugState}) async {
    // Ensure persistence is initialized (via initPersistence or just ensure path)
    // WalletStore relies on Hive.init being called previously.
    // If not called, assume default? We rely on user calling initPersistence.
    await _store.init();

    Map<String, dynamic>? state;
    if (debugState != null) {
      state = debugState;
    } else {
      state = await _store.getClientState();
    }

    if (state == null) return false;

    _deviceId = state['deviceId'];

    if (state['spendingPolicies'] != null) {
      _normalPolicy = SpendingPolicy.fromJson(
          Map<String, dynamic>.from(state['spendingPolicies']));
    }

    if (state['recoveryPolicy'] != null) {
      _recoveryPolicy = RecoveryPolicy.fromJson(
          Map<String, dynamic>.from(state['recoveryPolicy']));
    }

    if (state['protectedPolicies'] != null) {
      final pp = Map<String, dynamic>.from(state['protectedPolicies'] as Map);
      pp.forEach((k, v) {
        _protectedPolicies[k] =
            ProtectedPolicy.fromJson(Map<String, dynamic>.from(v as Map));
      });
    }

    print("Restored state for device: $_deviceId");
    return true;
  }

  Future<void> _saveState() async {
    final state = <String, dynamic>{
      'deviceId': _deviceId,
    };
    if (_normalPolicy != null) {
      state['spendingPolicies'] = _normalPolicy!.toJson();
    }
    if (_recoveryPolicy != null) {
      state['recoveryPolicy'] = _recoveryPolicy!.toJson();
    }
    if (_protectedPolicies.isNotEmpty) {
      state['protectedPolicies'] =
          _protectedPolicies.map((k, v) => MapEntry(k, v.toJson()));
    }
    await _store.saveClientState(state);
    print("Saved client state.");
  }

  // Getters for testing
  threshold.KeyPackage? get keyPackage1 => _normalPolicy?.keyPackage;
  threshold.KeyPackage? get keyPackage2 => _recoveryPolicy?.keyPackage;
  threshold.PublicKeyPackage? get publicKey => _normalPolicy?.publicKeyPackage;

  // --- DKG ---

  Future<void> doDkg() async {
    await _store.init(); // Ensure store is ready
    // 1. Generate Secrets for both identities
    _signingSecret = threshold.SecretKey(threshold.modNRandom());
    final coeffs1 = threshold.generateCoefficients(_minSigners - 1);
    final (r1Sec1, r1Pub1) = threshold.dkgPart1(
        _signingId, _maxSigners, _minSigners, _signingSecret!, coeffs1);

    _recoverySecret = threshold.SecretKey(threshold.modNRandom());
    final coeffs2 = threshold.generateCoefficients(_minSigners - 1);
    final (r1Sec2, r1Pub2) = threshold.dkgPart1(
        _recoveryId, _maxSigners, _minSigners, _recoverySecret!, coeffs2);

    // 2. Step 1: Exchange Round 1 Packages for both
    final req1 = DKGStep1Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..round1Package = jsonEncode(r1Pub1.toJson());

    final req2 = DKGStep1Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_recoveryId.toScalar())
      ..round1Package = jsonEncode(r1Pub2.toJson());

    final step1Futures =
        await Future.wait([_stub.dKGStep1(req1), _stub.dKGStep1(req2)]);

    final step1Resp = step1Futures[0];

    // 3. Step 2: Compute Shares
    // Trigger Step 2 on server for this session
    await _stub.dKGStep2(DKGStep2Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar()));

    // Parse R1 packages for Identity 1
    final round1PkgsMap1 = <threshold.Identifier, threshold.Round1Package>{};
    // Parse R1 packages for Identity 2
    final round1PkgsMap2 = <threshold.Identifier, threshold.Round1Package>{};

    step1Resp.round1Packages.forEach((k, v) {
      final id = threshold.Identifier(BigInt.parse(k, radix: 16));
      final pkg = threshold.Round1Package.fromJson(jsonDecode(v));

      if (id != _signingId) round1PkgsMap1[id] = pkg;
      if (id != _recoveryId) round1PkgsMap2[id] = pkg;
    });

    // Compute shares
    final (r2Sec1, sharesFrom1) = threshold.dkgPart2(r1Sec1, round1PkgsMap1);
    final (r2Sec2, sharesFrom2) = threshold.dkgPart2(r1Sec2, round1PkgsMap2);

    // 4. Step 3: Exchange Shares
    final req3_1 = DKGStep3Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom1));

    final req3_2 = DKGStep3Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_recoveryId.toScalar())
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom2));

    final step3Futures =
        await Future.wait([_stub.dKGStep3(req3_1), _stub.dKGStep3(req3_2)]);

    final sharesForMe1 = _parseShares(step3Futures[0].round2PackagesForMe);
    final sharesForMe2 = _parseShares(step3Futures[1].round2PackagesForMe);

    // 5. Finalize for both
    final (keyPkg1, pubKeyPkg1) =
        threshold.dkgPart3(r1Sec1, r2Sec1, round1PkgsMap1, sharesForMe1);
    final (keyPkg2, pubKeyPkg2) =
        threshold.dkgPart3(r1Sec2, r2Sec2, round1PkgsMap2, sharesForMe2);

    _normalPolicy = SpendingPolicy(
        id: "normal_policy_id",
        keyPackage: keyPkg1,
        publicKeyPackage: pubKeyPkg1);

    _recoveryPolicy = RecoveryPolicy(
        id: "recovery_policy_id",
        keyPackage: keyPkg2,
        publicKeyPackage: pubKeyPkg2);

    await _saveState();
  }

  // Note: PublicKey is the unifying key for all identities
  PublicKeyPackage? getTweakedPublicKeyPackage(List<int>? merkle_root) {
    final publicKeyPackage = _normalPolicy?.publicKeyPackage;
    return publicKeyPackage?.tweak(merkle_root);
  }

  PublicKeyPackage? getPublicKeyPackage() {
    return _normalPolicy?.publicKeyPackage;
  }

  // --- REFRESH ---

  Future<void> createSpendingPolicy(
      Duration interval, Int64 thresholdAmount, String pin) async {
    if (!isInitialized) {
      throw StateError("Client not initialized (DKG not run).");
    }

    final seed = sha256.convert(utf8.encode(pin)).bytes;

    // Part 1: Generate Refresh Secrets
    // We use 2-party refresh (Client + Server) for Policy Creation.
    final refreshTotalParties = 2;
    final refreshThreshold = 2; // 2-of-2

    final (r1Sec1, r1Pub1) = threshold.dkgRefreshPart1(
        _signingId, refreshTotalParties, refreshThreshold,
        seed: seed);

    // Step 1: Exchange
    final req1 = RefreshStep1Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..round1Package = jsonEncode(r1Pub1.toJson())
      ..interval = Int64(interval.inSeconds)
      ..thresholdAmount = thresholdAmount;

    final step1Resp = await _stub.refreshStep1(req1);

    // Step 2: Shares
    final req2_1 = RefreshStep2Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar());

    await _stub.refreshStep2(req2_1);

    // Parse R1 packages (includes server's)
    final round1PkgsMap1 = <threshold.Identifier, threshold.Round1Package>{};

    step1Resp.round1Packages.forEach((k, v) {
      final id_temp = threshold.Identifier(BigInt.parse(k, radix: 16));
      final pkg = threshold.Round1Package.fromJson(jsonDecode(v));
      if (id_temp != _signingId) round1PkgsMap1[id_temp] = pkg;
    });

    // Compute shares
    final (r2Sec1, sharesFrom1) =
        threshold.dkgRefreshPart2(r1Sec1, round1PkgsMap1);

    // Step 3: Finalize
    final req3_1 = RefreshStep3Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom1));

    final step3Resp1 = await _stub.refreshStep3(req3_1);

    final sharesForMe1 = _parseShares(step3Resp1.round2PackagesForMe);

    final normalKeyPackage1 = _normalPolicy!.keyPackage;
    final normalPubPackage = _normalPolicy!.publicKeyPackage;

    final (keyPkg1, pubKeyPkg1) = threshold.dkgRefreshPart3(r2Sec1,
        round1PkgsMap1, sharesForMe1, normalPubPackage, normalKeyPackage1);

    // Compute protected key for Identity 1
    // myUpdate is evaluatePolynomial(myId, coeffs)
    final myUpdate =
        threshold.evaluatePolynomial(_signingId, r1Sec1.coefficients);
    final newSecret = keyPkg1.secretShare;

    var diff = (newSecret - myUpdate);

    final protectedKeyPkg = threshold.KeyPackage(
      keyPkg1.identifier,
      diff, // Cleared
      keyPkg1.verifyingShare,
      keyPkg1.verifyingKey,
      keyPkg1.minSigners,
    );

    _protectedPolicies[step1Resp.policyId] = ProtectedPolicy(
      id: step1Resp.policyId,
      keyPackage: protectedKeyPkg,
      publicKeyPackage: pubKeyPkg1,
      startTime:
          DateTime.fromMillisecondsSinceEpoch(step1Resp.startTime.toInt()),
      interval: interval,
    );
    await _saveState();
  }

  // --- SIGNING ---
  Future<String> getPolicyId(Uint8List message) async {
    final response = await _stub.getPolicyId(GetPolicyIdRequest()
      ..deviceId = _deviceId
      ..txMessage = message);
    return response.policyId;
  }

  Future<threshold.Signature> sign(Uint8List message,
      {String? pin, String? policyId, List<int>? fullTransaction}) async {
    var keyPackage = _normalPolicy!.keyPackage;
    var groupPubKey = _normalPolicy!.publicKeyPackage;

    if (policyId != null &&
        _protectedPolicies.containsKey(policyId) &&
        pin != null) {
      final protectedPolicy = _protectedPolicies[policyId];

      final minSigners = 2; // Matched with createSpendingPolicy

      final seed = sha256.convert(utf8.encode(pin)).bytes;

      // Re-run part 1 logic to reliably recover the polynomial
      final (r1Sec, _) = threshold
          .dkgRefreshPart1(_signingId, minSigners, minSigners, seed: seed);

      final myUpdate =
          threshold.evaluatePolynomial(_signingId, r1Sec.coefficients);

      final partialShare = protectedPolicy!.keyPackage.secretShare;
      final correctedShare = (partialShare + myUpdate);

      keyPackage = threshold.KeyPackage(
        protectedPolicy.keyPackage.identifier,
        correctedShare,
        protectedPolicy.keyPackage.verifyingShare,
        protectedPolicy.keyPackage.verifyingKey,
        protectedPolicy.keyPackage.minSigners,
      );

      groupPubKey = protectedPolicy.publicKeyPackage;
    }

    return signWithContext(
      message,
      keyPackage,
      groupPubKey,
      fullTransaction,
      null,
    );
  }

  Future<threshold.Signature> signWithContext(
    Uint8List message,
    threshold.KeyPackage keyPkg,
    threshold.PublicKeyPackage groupPubKey,
    List<int>? fullTransaction,
    List<UtxoInfo>? inputUtxos,
  ) async {
    final nonce = frost_comm.newNonce(keyPkg.secretShare);

    // 2. Step 1: Commitments
    final req = SignStep1Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..hidingCommitment =
          threshold.elemSerializeCompressed(nonce.commitments.hiding)
      ..bindingCommitment =
          threshold.elemSerializeCompressed(nonce.commitments.binding)
      ..messageToSign = message;

    if (fullTransaction != null) {
      req.fullTransaction = fullTransaction;
    }
    if (inputUtxos != null) {
      req.inputUtxos.addAll(inputUtxos);
    }

    final signStep1Resp = await _stub.signStep1(req);

    // Parse Commitments
    final commitmentsMap =
        <threshold.Identifier, frost_comm.SigningCommitments>{};
    signStep1Resp.commitments.forEach((k, v) {
      final id = threshold.Identifier(BigInt.parse(k, radix: 16));
      final hiding =
          threshold.elemDeserializeCompressed(Uint8List.fromList(v.hiding));
      final binding =
          threshold.elemDeserializeCompressed(Uint8List.fromList(v.binding));
      commitmentsMap[id] = frost_comm.SigningCommitments(binding, hiding);
    });

    // 3. Step 2: Sign
    final signingPkg = frost_comm.SigningPackage(commitmentsMap, message);

    // Explicitly apply Taproot tweak (Key Path Spending)
    keyPkg = keyPkg.tweak(null);
    final pubPackage = groupPubKey.tweak(null);

    final sigShare = frost.sign(signingPkg, nonce, keyPkg);

    // 4. Send Share & Get Result
    final signStep2Resp = await _stub.signStep2(SignStep2Request()
      ..deviceId = _deviceId
      ..identifier = threshold.bigIntToBytes(_signingId.toScalar())
      ..signatureShare = threshold.bigIntToBytes(sigShare.s));

    // 5. Verify
    final R = threshold
        .elemDeserializeCompressed(Uint8List.fromList(signStep2Resp.rPoint));
    final z =
        threshold.bytesToBigInt(Uint8List.fromList(signStep2Resp.zScalar));

    final signature = threshold.Signature(R, z);

    return signature.verify(pubPackage.verifyingKey, message);
  }

  // Helpers
  Map<String, String> _buildSharesMap(
      Map<threshold.Identifier, threshold.Round2Package> shares) {
    final m = <String, String>{};
    shares.forEach((id, pkg) {
      m[threshold
          .bigIntToBytes(id.toScalar())
          .map((b) => b.toRadixString(16).padLeft(2, '0'))
          .join()] = jsonEncode(pkg.toJson());
    });
    return m;
  }

  Map<threshold.Identifier, threshold.Round2Package> _parseShares(
      Map<String, String> raw) {
    final m = <threshold.Identifier, threshold.Round2Package>{};
    raw.forEach((k, v) {
      m[threshold.Identifier(BigInt.parse(k, radix: 16))] =
          threshold.Round2Package.fromJson(jsonDecode(v));
    });
    return m;
  }

  // --- BROADCAST ---
  Future<String> broadcastTransaction(String txHex) async {
    final request = BroadcastTransactionRequest()
      ..deviceId = _deviceId
      ..txHex = txHex;

    final response = await _stub.broadcastTransaction(request);
    return response.txId;
  }

  // --- SYNC ---
  Future<List<UtxoInfo>> fetchHistory() async {
    final response =
        await _stub.fetchHistory(FetchHistoryRequest()..deviceId = _deviceId);
    return response.utxos;
  }

  Stream<TransactionNotification> subscribeToHistory() {
    return _stub
        .subscribeToHistory(SubscribeToHistoryRequest()..deviceId = _deviceId);
  }

  Future<List<TransactionSummary>> fetchRecentTransactions() async {
    final response = await _stub.fetchRecentTransactions(
        FetchRecentTransactionsRequest()..deviceId = _deviceId);
    return response.transactions;
  }
}
