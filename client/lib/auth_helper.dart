import 'dart:typed_data';
import 'package:client/threshold/threshold.dart' as threshold;
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart';

/// Helper class for creating authentication signatures for gRPC requests.
///
/// This class manages the creation of Schnorr signatures over authentication
/// messages for all authenticated RPC calls in the MPC wallet protocol.
class ClientAuthHelper {
  final threshold.AuthSigner _signer;
  final String _userIdHex;

  ClientAuthHelper._(this._signer, this._userIdHex);

  /// Creates an auth helper from the user's signing secret.
  ///
  /// The signing secret is the secret key used during DKG to derive
  /// the user's identity (public key).
  factory ClientAuthHelper.fromSigningSecret(
      threshold.SecretKey signingSecret, List<int> userId) {
    final signer = threshold.AuthSigner.fromSecret(signingSecret);
    final userIdHex = hex.encode(userId);
    return ClientAuthHelper._(signer, userIdHex);
  }

  /// Creates an auth helper from raw private key bytes.
  factory ClientAuthHelper.fromPrivateKeyBytes(
      Uint8List privateKeyBytes, List<int> userId) {
    final signer = threshold.AuthSigner.fromBytes(privateKeyBytes);
    final userIdHex = hex.encode(userId);
    return ClientAuthHelper._(signer, userIdHex);
  }

  /// Gets the current timestamp in milliseconds.
  Int64 get currentTimestamp => Int64(DateTime.now().millisecondsSinceEpoch);

  /// Creates an authentication signature for SignStep1.
  AuthSignature signForSignStep1() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opSignStep1,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for SignStep2.
  AuthSignature signForSignStep2() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opSignStep2,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for RefreshStep1.
  AuthSignature signForRefreshStep1() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opRefreshStep1,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for RefreshStep2.
  AuthSignature signForRefreshStep2() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opRefreshStep2,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for RefreshStep3.
  AuthSignature signForRefreshStep3() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opRefreshStep3,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for GetPolicyId.
  AuthSignature signForGetPolicyId() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opGetPolicyId,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for FetchHistory.
  AuthSignature signForFetchHistory() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opFetchHistory,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for FetchRecentTransactions.
  AuthSignature signForFetchRecentTransactions() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opFetchRecentTxs,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }

  /// Creates an authentication signature for SubscribeToHistory.
  AuthSignature signForSubscribeHistory() {
    final timestamp = currentTimestamp;
    final signature = _signer.signOperation(
      operation: threshold.AuthMessage.opSubscribeHistory,
      userIdHex: _userIdHex,
      timestampMs: timestamp.toInt(),
    );
    return AuthSignature(signature, timestamp);
  }
}

/// Represents an authentication signature with its timestamp.
class AuthSignature {
  final Uint8List signature;
  final Int64 timestampMs;

  AuthSignature(this.signature, this.timestampMs);
}
