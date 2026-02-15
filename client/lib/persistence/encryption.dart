import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';

/// Abstract interface for providing encryption keys.
///
/// Implementations can use platform-specific secure storage:
/// - iOS: Keychain
/// - Android: EncryptedSharedPreferences or Android Keystore
/// - Desktop: OS-specific keychain or secure storage
abstract class SecureKeyProvider {
  /// Returns a 32-byte encryption key.
  /// This key should be securely stored and retrieved.
  Future<Uint8List> getOrCreateKey();

  /// Clears the stored key (for logout/reset scenarios).
  Future<void> clearKey();
}

/// Simple key provider that derives a 32-byte key from a PIN using SHA256.
///
/// This matches the existing PIN derivation approach in the codebase.
class PinDerivedKeyProvider implements SecureKeyProvider {
  final String _pin;
  Uint8List? _cachedKey;

  PinDerivedKeyProvider(this._pin);

  @override
  Future<Uint8List> getOrCreateKey() async {
    if (_cachedKey != null) return _cachedKey!;
    _cachedKey = Uint8List.fromList(sha256.convert(_pin.codeUnits).bytes);
    return _cachedKey!;
  }

  @override
  Future<void> clearKey() async {
    _cachedKey = null;
  }
}

/// Creates a HiveAesCipher from a 32-byte key.
HiveCipher createCipherFromKey(Uint8List key) {
  if (key.length != 32) {
    throw ArgumentError('Encryption key must be exactly 32 bytes');
  }
  return HiveAesCipher(key);
}

/// Creates a HiveAesCipher from a key provider.
Future<HiveCipher> createCipher(SecureKeyProvider keyProvider) async {
  final key = await keyProvider.getOrCreateKey();
  return createCipherFromKey(key);
}

/// Creates a HiveAesCipher from a PIN using SHA256 derivation.
HiveCipher createCipherFromPin(String pin) {
  final key = Uint8List.fromList(sha256.convert(pin.codeUnits).bytes);
  return HiveAesCipher(key);
}
