import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:client/policy.dart';
import 'package:client/auth_helper.dart';
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
import 'package:convert/convert.dart';

import 'package:client/persistence/wallet_store.dart';
import 'package:client/hardware_signer.dart';

class MpcClient {
  final MPCWalletClient _stub;
  // Store
  late final WalletStore _store;

  // User ID for this client instance (persisted or derived after DKG)
  List<int>? _userId;
  String? get userId => _userId == null ? null : hex.encode(_userId!);

  // Recovey Id
  List<int>? _recoveryId;
  List<int>? get recoveryId => _recoveryId;

  final int _maxSigners;
  final int _minSigners;

  threshold.SecretKey? _signingSecret;

  // Auth helper for signing requests (initialized after DKG or restore)
  ClientAuthHelper? _authHelper;

  SpendingPolicy? _normalPolicy;
  Map<String, ProtectedPolicy> _protectedPolicies;

  RecoveryPolicy? _recoveryPolicy;

  // Hardware signer for recovery identity
  final HardwareSignerInterface _hardwareSigner;

  /// Creates a client that manages two shares (identities).
  ///
  /// [channel] - gRPC channel to the MPC server
  /// [maxSigners] - Maximum number of signers in the threshold scheme
  /// [minSigners] - Minimum signers required (threshold)
  /// [storageId] - Unique identifier for the Hive box
  /// [encryptionCipher] - Optional cipher for encrypted storage.
  ///                      Use HiveAesCipher for AES-256 encryption.
  ///                      When null, data is stored unencrypted.
  /// [hardwareSigner] - Hardware signer for recovery identity.
  ///                    The recovery identity's secret stays on the
  ///                    hardware signer and DKG/signing is delegated.
  MpcClient(
    ClientChannel channel, {
    int maxSigners = 3,
    int minSigners = 2,
    String? storageId,
    HiveCipher? encryptionCipher,
    required HardwareSignerInterface hardwareSigner,
  })  : _stub = MPCWalletClient(channel),
        _maxSigners = maxSigners,
        _minSigners = minSigners,
        _hardwareSigner = hardwareSigner,
        _protectedPolicies = {} {
    _store = WalletStore(
      boxName: storageId ?? 'mpc_wallet_state_default',
      cipher: encryptionCipher,
    );
  }

  /// Initializes persistence for the client.
  ///
  /// [path] is the directory where client state will be stored.
  /// If [path] is null, defaults to `$HOME/.mpc_wallet/client`.
  ///
  /// This must be called before creating MpcClient instances.
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

  bool get hasSpendingPolicy => _protectedPolicies.isNotEmpty;

  ProtectedPolicy? get activeSpendingPolicy =>
      _protectedPolicies.isNotEmpty ? _protectedPolicies.values.last : null;

  List<ProtectedPolicy> get spendingPolicies =>
      _protectedPolicies.values.toList();

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

    final storedUserId = state['userId'];
    if (storedUserId is! String || storedUserId.isEmpty) {
      return false;
    }
    _userId = hex.decode(storedUserId);

    // Restore signing secret for authentication
    if (state['signingSecret'] != null) {
      final secretHex = state['signingSecret'] as String;
      final secretBytes = Uint8List.fromList(hex.decode(secretHex));
      _signingSecret =
          threshold.SecretKey(threshold.bytesToBigInt(secretBytes));
      _authHelper =
          ClientAuthHelper.fromSigningSecret(_signingSecret!, _userId!);
    }

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

    return true;
  }

  Future<void> _saveState() async {
    final state = <String, dynamic>{
      'userId': hex.encode(_userId!),
    };
    if (_signingSecret != null) {
      state['signingSecret'] =
          hex.encode(threshold.bigIntToBytes(_signingSecret!.scalar));
    }
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
  }

  // Getters for testing
  threshold.KeyPackage? get keyPackage1 => _normalPolicy?.keyPackage;
  threshold.KeyPackage? get keyPackage2 => _recoveryPolicy?.keyPackage;
  threshold.PublicKeyPackage? get publicKey => _normalPolicy?.publicKeyPackage;

  // --- DKG ---

  /// DKG: signing identity runs locally, recovery identity
  /// runs on the hardware signer (secret never leaves the device).
  Future<void> doDkg() async {
    await _store.init();
    final signer = _hardwareSigner;

    // 1. Generate signing secret locally (participant 1 — unchanged)
    _signingSecret = threshold.SecretKey(threshold.modNRandom());
    final coeffs1 = threshold.generateCoefficients(_minSigners - 1);
    final (r1Sec1, r1Pub1) =
        threshold.dkgPart1(_maxSigners, _minSigners, _signingSecret!, coeffs1);

    // 2. Hardware signer generates recovery secret (participant 2)
    final dkgInit = await signer.dkgInit(_maxSigners, _minSigners);

    final userId = threshold.elemSerializeCompressed(r1Pub1.verifyingKey.E);
    final recoveryId = dkgInit.verifyingKeyBytes;

    _userId = userId;
    _recoveryId = recoveryId;

    final signingIdThresholdId = threshold.Identifier.derive(userId);
    final recoveryIdThresholdId = dkgInit.identifier;

    // 3. Send both Round1Packages to server
    final r1Json1 = jsonEncode(r1Pub1.toJson());
    final r1Json2 = jsonEncode(dkgInit.round1Package.toJson());

    final req1 = DKGStep1Request()
      ..userId = userId
      ..identifier = signingIdThresholdId.serialize()
      ..round1Package = r1Json1;

    final req2 = DKGStep1Request()
      ..userId = userId
      ..identifier = recoveryIdThresholdId.serialize()
      ..round1Package = r1Json2;

    final step1Futures =
        await Future.wait([_stub.dKGStep1(req1), _stub.dKGStep1(req2)]);
    final step1Resp = step1Futures[0];

    // Trigger Step 2 on server
    await _stub.dKGStep2(DKGStep2Request()..userId = userId);

    // Parse R1 packages for both identities
    final round1PkgsMap1 = <threshold.Identifier, threshold.Round1Package>{};
    final round1PkgsMap2 = <threshold.Identifier, threshold.Round1Package>{};

    step1Resp.round1Packages.forEach((k, v) {
      if (v.isEmpty) {
        throw FormatException('Empty round1 package for key $k');
      }
      final id = threshold.Identifier(BigInt.parse(k, radix: 16));
      final pkg = threshold.Round1Package.fromJson(jsonDecode(v));
      if (id != signingIdThresholdId) round1PkgsMap1[id] = pkg;
      if (id != recoveryIdThresholdId) round1PkgsMap2[id] = pkg;
    });

    // 4. Compute shares: signing identity locally, recovery via hardware signer
    final (r2Sec1, sharesFrom1) = threshold.dkgPart2(r1Sec1, round1PkgsMap1);
    final sharesFrom2 = await signer.dkgRound2(round1PkgsMap2);

    // 5. Send shares to server
    final req3_1 = DKGStep3Request()
      ..userId = userId
      ..identifier = threshold.bigIntToBytes(signingIdThresholdId.toScalar())
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom1));

    final req3_2 = DKGStep3Request()
      ..userId = userId
      ..identifier = threshold.bigIntToBytes(recoveryIdThresholdId.toScalar())
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom2));

    final step3Futures =
        await Future.wait([_stub.dKGStep3(req3_1), _stub.dKGStep3(req3_2)]);

    final sharesForMe1 = _parseShares(step3Futures[0].round2PackagesForMe);
    final sharesForMe2 = _parseShares(step3Futures[1].round2PackagesForMe);

    // 6. Finalize signing identity locally
    final (keyPkg1, pubKeyPkg1) =
        threshold.dkgPart3(r1Sec1, r2Sec1, round1PkgsMap1, sharesForMe1);

    // 7. Hardware signer finalizes recovery identity (stores key internally)
    final dkgResult = await signer.dkgRound3(round1PkgsMap2, sharesForMe2);

    // 8. Store policies
    _normalPolicy = SpendingPolicy(
        id: "normal_policy_id",
        keyPackage: keyPkg1,
        publicKeyPackage: pubKeyPkg1);

    // Recovery policy: secret share stays on hardware signer (store zero locally)
    final recoveryVerifyingShare =
        pubKeyPkg1.verifyingShares[dkgResult.identifier];
    if (recoveryVerifyingShare == null) {
      throw StateError("Recovery identifier not found in public key package");
    }

    final recoveryKeyPkg = threshold.KeyPackage(
      dkgResult.identifier,
      BigInt.zero, // secret stays on hardware signer
      recoveryVerifyingShare,
      pubKeyPkg1.verifyingKey,
      _minSigners,
    );

    _recoveryPolicy = RecoveryPolicy(
        id: "recovery_policy_id",
        keyPackage: recoveryKeyPkg,
        publicKeyPackage: pubKeyPkg1);

    _userId = userId.toList();
    _authHelper = ClientAuthHelper.fromSigningSecret(_signingSecret!, _userId!);

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

    if (_userId == null) {
      throw StateError("Signing secret is null, cannot proceed with refresh.");
    }

    final signingIdentifier =
        threshold.Identifier.derive(Uint8List.fromList(_userId!));

    final (r1Sec1, r1Pub1) = threshold.dkgRefreshPart1(
        signingIdentifier, refreshTotalParties, refreshThreshold,
        seed: seed);

    if (_userId == null) {
      throw StateError("User ID is null, cannot proceed with refresh.");
    }

    // Step 1: Exchange
    final auth1 = _authHelper!.signForRefreshStep1();
    final req1 = RefreshStep1Request()
      ..userId = _userId!
      ..round1Package = jsonEncode(r1Pub1.toJson())
      ..interval = Int64(interval.inSeconds)
      ..thresholdAmount = thresholdAmount
      ..signature = auth1.signature
      ..timestampMs = auth1.timestampMs;

    final step1Resp = await _stub.refreshStep1(req1);

    // Step 2: Shares
    final auth2 = _authHelper!.signForRefreshStep2();
    final req2_1 = RefreshStep2Request()
      ..userId = _userId!
      ..signature = auth2.signature
      ..timestampMs = auth2.timestampMs;

    await _stub.refreshStep2(req2_1);

    // Parse R1 packages (includes server's)
    final round1PkgsMap1 = <threshold.Identifier, threshold.Round1Package>{};

    step1Resp.round1Packages.forEach((k, v) {
      final id_temp = threshold.Identifier(BigInt.parse(k, radix: 16));
      final pkg = threshold.Round1Package.fromJson(jsonDecode(v));
      if (id_temp != signingIdentifier) round1PkgsMap1[id_temp] = pkg;
    });

    // Compute shares
    final (r2Sec1, sharesFrom1) =
        threshold.dkgRefreshPart2(r1Sec1, round1PkgsMap1);

    // Step 3: Finalize
    final auth3 = _authHelper!.signForRefreshStep3();
    final req3_1 = RefreshStep3Request()
      ..userId = _userId!
      ..round2PackagesForOthers.addAll(_buildSharesMap(sharesFrom1))
      ..signature = auth3.signature
      ..timestampMs = auth3.timestampMs;

    final step3Resp1 = await _stub.refreshStep3(req3_1);

    final sharesForMe1 = _parseShares(step3Resp1.round2PackagesForMe);

    final normalKeyPackage1 = _normalPolicy!.keyPackage;
    final normalPubPackage = _normalPolicy!.publicKeyPackage;

    final (keyPkg1, pubKeyPkg1) = threshold.dkgRefreshPart3(r2Sec1,
        round1PkgsMap1, sharesForMe1, normalPubPackage, normalKeyPackage1);

    // Compute protected key for Identity 1
    // myUpdate is evaluatePolynomial(myId, coeffs)
    final myUpdate =
        threshold.evaluatePolynomial(signingIdentifier, r1Sec1.coefficients);
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
      thresholdSats: thresholdAmount.toInt(),
    );
    await _saveState();
  }

  // --- SIGNING ---
  Future<String> getPolicyId(Uint8List message) async {
    if (_userId == null) {
      throw StateError("User ID is null, cannot get Policy ID.");
    }

    final auth = _authHelper!.signForGetPolicyId();
    final response = await _stub.getPolicyId(GetPolicyIdRequest()
      ..userId = _userId!
      ..txMessage = message
      ..signature = auth.signature
      ..timestampMs = auth.timestampMs);
    return response.policyId;
  }

  Future<threshold.Signature> sign(Uint8List message,
      {String? pin, String? policyId, List<int>? fullTransaction}) async {
    var keyPackage = _normalPolicy!.keyPackage;
    var groupPubKey = _normalPolicy!.publicKeyPackage;

    if (_userId == null) {
      throw StateError("User ID is null, cannot proceed with signing.");
    }

    final signingIdentifier =
        threshold.Identifier.derive(Uint8List.fromList(_userId!));

    if (policyId != null &&
        _protectedPolicies.containsKey(policyId) &&
        pin != null) {
      final protectedPolicy = _protectedPolicies[policyId];

      final minSigners = 2; // Matched with createSpendingPolicy

      final seed = sha256.convert(utf8.encode(pin)).bytes;

      // Re-run part 1 logic to reliably recover the polynomial
      final (r1Sec, _) = threshold.dkgRefreshPart1(
          signingIdentifier, minSigners, minSigners,
          seed: seed);

      final myUpdate =
          threshold.evaluatePolynomial(signingIdentifier, r1Sec.coefficients);

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
    );
  }

  Future<threshold.Signature> signWithContext(
    Uint8List message,
    threshold.KeyPackage keyPkg,
    threshold.PublicKeyPackage groupPubKey,
    List<int>? fullTransaction,
  ) async {
    final nonce = frost_comm.newNonce(keyPkg.secretShare);

    if (_userId == null) {
      throw StateError("User ID is null, cannot proceed with signing.");
    }

    // 2. Step 1: Commitments
    final auth1 = _authHelper!.signForSignStep1();
    final req = SignStep1Request()
      ..userId = _userId!
      ..hidingCommitment =
          threshold.elemSerializeCompressed(nonce.commitments.hiding)
      ..bindingCommitment =
          threshold.elemSerializeCompressed(nonce.commitments.binding)
      ..messageToSign = message
      ..signature = auth1.signature
      ..timestampMs = auth1.timestampMs;

    if (fullTransaction != null) {
      req.fullTransaction = fullTransaction;
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
    final auth2 = _authHelper!.signForSignStep2();
    final signStep2Resp = await _stub.signStep2(SignStep2Request()
      ..userId = _userId!
      ..signatureShare = threshold.bigIntToBytes(sigShare.s)
      ..signature = auth2.signature
      ..timestampMs = auth2.timestampMs);

    // 5. Verify
    final R = threshold
        .elemDeserializeCompressed(Uint8List.fromList(signStep2Resp.rPoint));
    final z =
        threshold.bytesToBigInt(Uint8List.fromList(signStep2Resp.zScalar));

    final signature = threshold.Signature(R, z);

    return signature.verify(pubPackage.verifyingKey, message);
  }

  // --- RECOVERY SIGNING (Client-only 2-of-3 FROST) ---

  /// Produces a FROST threshold signature using both client key packages
  /// (signing + recovery identity) without server participation.
  /// No taproot tweak is applied — this is for auth, not Bitcoin transactions.
  ///
  /// When a hardware signer is configured, the recovery identity's nonce
  /// generation and signing are delegated to the hardware device.
  /// FROST sign with both keys: signing identity (local) + recovery identity
  /// (hardware signer). No taproot tweak — used for auth, not Bitcoin txs.
  Future<threshold.Signature> _frostSignWithBothKeys(Uint8List message) async {
    if (!isInitialized) {
      throw StateError("Client not initialized (DKG not run).");
    }

    final signer = _hardwareSigner;
    final keyPkg1 = _normalPolicy!.keyPackage;
    final recoveryId = _recoveryPolicy!.keyPackage.identifier;
    final groupPubKey = _normalPolicy!.publicKeyPackage;

    // 1. Hardware signer generates nonce for recovery identity
    final recoveryCommitments = await signer.generateNonce();

    // 2. Generate signing identity nonce locally
    final nonce1 = frost_comm.newNonce(keyPkg1.secretShare);

    // 3. Build commitments map with both identities
    final commitmentsMap = <threshold.Identifier, frost_comm.SigningCommitments>{
      keyPkg1.identifier: nonce1.commitments,
      recoveryId: recoveryCommitments,
    };

    // 4. Create signing package
    final signingPkg = frost_comm.SigningPackage(commitmentsMap, message);

    // 5. Hardware signer produces recovery share (no taproot tweak)
    final recoveryShareScalar = await signer.sign(
      message: message,
      commitments: commitmentsMap,
      applyTweak: false,
    );

    // 6. Compute signing identity share locally
    final share1 = frost.sign(signingPkg, nonce1, keyPkg1);

    // 7. Aggregate both shares
    final sharesMap = <threshold.Identifier, frost.SignatureShare>{
      keyPkg1.identifier: share1,
      recoveryId: frost.SignatureShare(recoveryShareScalar),
    };

    return frost.aggregate(signingPkg, sharesMap, groupPubKey);
  }

  // --- POLICY MANAGEMENT ---

  Future<void> updatePolicy(String policyId,
      {int? thresholdSats, int? intervalSeconds}) async {
    if (_userId == null) {
      throw StateError("User ID is null, cannot update policy.");
    }
    if (!_protectedPolicies.containsKey(policyId)) {
      throw StateError("Policy $policyId not found.");
    }

    final existing = _protectedPolicies[policyId]!;
    final newThreshold = thresholdSats ?? existing.thresholdSats;
    final newInterval = intervalSeconds ?? existing.interval.inSeconds;
    final timestampMs = DateTime.now().millisecondsSinceEpoch;

    final message = threshold.RecoveryAuthMessage.buildUpdatePolicyMessage(
      policyId: policyId,
      thresholdSats: newThreshold,
      intervalSeconds: newInterval,
      timestampMs: timestampMs,
      userIdHex: hex.encode(_userId!),
    );

    final signature = await _frostSignWithBothKeys(message);

    await _stub.updatePolicy(UpdatePolicyRequest()
      ..userId = _userId!
      ..policyId = policyId
      ..thresholdSats = Int64(newThreshold)
      ..intervalSeconds = Int64(newInterval)
      ..frostSignatureR = threshold.elemSerializeCompressed(signature.R)
      ..frostSignatureZ = threshold.bigIntToBytes(signature.Z)
      ..timestampMs = Int64(timestampMs));

    // Update local state
    _protectedPolicies[policyId] = ProtectedPolicy(
      id: policyId,
      keyPackage: existing.keyPackage,
      publicKeyPackage: existing.publicKeyPackage,
      startTime: existing.startTime,
      interval: Duration(seconds: newInterval),
      thresholdSats: newThreshold,
    );
    await _saveState();
  }

  Future<void> deletePolicy(String policyId) async {
    if (_userId == null) {
      throw StateError("User ID is null, cannot delete policy.");
    }
    if (!_protectedPolicies.containsKey(policyId)) {
      throw StateError("Policy $policyId not found.");
    }

    final timestampMs = DateTime.now().millisecondsSinceEpoch;

    final message = threshold.RecoveryAuthMessage.buildDeletePolicyMessage(
      policyId: policyId,
      timestampMs: timestampMs,
      userIdHex: hex.encode(_userId!),
    );

    final signature = await _frostSignWithBothKeys(message);

    await _stub.deletePolicy(DeletePolicyRequest()
      ..userId = _userId!
      ..policyId = policyId
      ..frostSignatureR = threshold.elemSerializeCompressed(signature.R)
      ..frostSignatureZ = threshold.bigIntToBytes(signature.Z)
      ..timestampMs = Int64(timestampMs));

    // Update local state
    _protectedPolicies.remove(policyId);
    await _saveState();
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
    if (_userId == null) {
      throw StateError("User ID is null, cannot broadcast transaction.");
    }

    final request = BroadcastTransactionRequest()
      ..userId = _userId!
      ..txHex = txHex;

    final response = await _stub.broadcastTransaction(request);
    return response.txId;
  }

  // --- SYNC ---
  Future<List<UtxoInfo>> fetchHistory() async {
    if (_userId == null) {
      throw StateError("User ID is null, cannot fetch history.");
    }

    final auth = _authHelper!.signForFetchHistory();
    final response = await _stub.fetchHistory(FetchHistoryRequest()
      ..userId = _userId!
      ..signature = auth.signature
      ..timestampMs = auth.timestampMs);
    return response.utxos;
  }

  Stream<TransactionNotification> subscribeToHistory() {
    if (_userId == null) {
      throw StateError("User ID is null, cannot subscribe to history.");
    }

    final auth = _authHelper!.signForSubscribeHistory();
    return _stub.subscribeToHistory(SubscribeToHistoryRequest()
      ..userId = _userId!
      ..signature = auth.signature
      ..timestampMs = auth.timestampMs);
  }

  Future<List<TransactionSummary>> fetchRecentTransactions() async {
    if (_userId == null) {
      throw StateError("User ID is null, cannot fetch recent transactions.");
    }

    final auth = _authHelper!.signForFetchRecentTransactions();
    final response =
        await _stub.fetchRecentTransactions(FetchRecentTransactionsRequest()
          ..userId = _userId!
          ..signature = auth.signature
          ..timestampMs = auth.timestampMs);
    return response.transactions;
  }
}
