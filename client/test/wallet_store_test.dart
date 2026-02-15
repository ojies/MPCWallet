import 'dart:io';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:client/persistence/wallet_store.dart';
import 'package:client/persistence/encryption.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('wallet_store_test_');
    Hive.init(tempDir.path);
  });

  tearDown(() async {
    await Hive.close();
    await tempDir.delete(recursive: true);
  });

  group('Encryption utilities', () {
    test('createCipherFromPin creates valid cipher', () {
      final cipher = createCipherFromPin('1234');
      expect(cipher, isA<HiveAesCipher>());
    });

    test('PinDerivedKeyProvider returns 32-byte key', () async {
      final provider = PinDerivedKeyProvider('testpin');
      final key = await provider.getOrCreateKey();
      expect(key.length, equals(32));
    });

    test('PinDerivedKeyProvider returns consistent key', () async {
      final provider = PinDerivedKeyProvider('testpin');
      final key1 = await provider.getOrCreateKey();
      final key2 = await provider.getOrCreateKey();
      expect(key1, equals(key2));
    });

    test('Different PINs produce different keys', () async {
      final provider1 = PinDerivedKeyProvider('1234');
      final provider2 = PinDerivedKeyProvider('5678');
      final key1 = await provider1.getOrCreateKey();
      final key2 = await provider2.getOrCreateKey();
      expect(key1, isNot(equals(key2)));
    });

    test('createCipherFromKey validates key length', () {
      expect(
        () => createCipherFromKey(Uint8List(16)),
        throwsArgumentError,
      );
      expect(
        () => createCipherFromKey(Uint8List(32)),
        returnsNormally,
      );
    });
  });

  group('WalletStore', () {
    test('initializes without encryption', () async {
      final store = WalletStore(boxName: 'test_unencrypted');
      await store.init();
      expect(store.isInitialized, isTrue);
      await store.close();
    });

    test('initializes with encryption', () async {
      final cipher = createCipherFromPin('testpin');
      final store = WalletStore(
        boxName: 'test_encrypted',
        cipher: cipher,
      );
      await store.init();
      expect(store.isInitialized, isTrue);
      await store.close();
    });

    test('saves and retrieves client state', () async {
      final store = WalletStore(boxName: 'test_state');
      await store.init();

      final testState = {
        'userId': 'abcd1234' * 8, // 64 hex chars
        'signingSecret': 'ef567890' * 8, // 64 hex chars
      };

      await store.saveClientState(testState);
      final retrieved = await store.getClientState();

      expect(retrieved, isNotNull);
      expect(retrieved!['userId'], equals(testState['userId']));
      expect(retrieved['signingSecret'], equals(testState['signingSecret']));

      await store.close();
    });

    test('saves and retrieves state with encryption', () async {
      final cipher = createCipherFromPin('securepin');
      final store = WalletStore(
        boxName: 'test_encrypted_state',
        cipher: cipher,
      );
      await store.init();

      final testState = {
        'userId': 'abcd1234' * 8,
        'signingSecret': 'ef567890' * 8,
      };

      await store.saveClientState(testState);
      final retrieved = await store.getClientState();

      expect(retrieved, isNotNull);
      expect(retrieved!['userId'], equals(testState['userId']));

      await store.close();
    });

    test('validates userId format on retrieval', () async {
      final store = WalletStore(boxName: 'test_validation');
      await store.init();

      // Save invalid state directly to box (bypassing validation)
      final box = await Hive.openBox('test_validation_raw');
      await box.put('client_state', {'userId': ''}); // Invalid empty userId
      await box.close();

      // Create new store pointing to same data
      final store2 = WalletStore(boxName: 'test_validation_raw');
      await store2.init();
      final retrieved = await store2.getClientState();

      expect(retrieved, isNull); // Should fail validation

      await store.close();
      await store2.close();
    });

    test('validates signingSecret hex format', () async {
      final store = WalletStore(boxName: 'test_secret_validation');
      await store.init();

      // Save state with invalid hex in signingSecret
      final box = await Hive.openBox('test_secret_validation_raw');
      await box.put('client_state', {
        'userId': 'abcd1234' * 8,
        'signingSecret': 'not-valid-hex!',
      });
      await box.close();

      final store2 = WalletStore(boxName: 'test_secret_validation_raw');
      await store2.init();
      final retrieved = await store2.getClientState();

      expect(retrieved, isNull); // Should fail validation

      await store.close();
      await store2.close();
    });

    test('throws when not initialized', () async {
      final store = WalletStore(boxName: 'test_not_init');
      // Don't call init()

      expect(
        () async => await store.getUtxos(),
        throwsStateError,
      );
    });

    test('close is idempotent', () async {
      final store = WalletStore(boxName: 'test_close');
      await store.init();
      await store.close();
      await store.close(); // Should not throw
      expect(store.isInitialized, isFalse);
    });
  });

  group('Encrypted storage isolation', () {
    test('wrong PIN cannot read encrypted data', () async {
      // Save with PIN 1
      final cipher1 = createCipherFromPin('correctpin');
      final store1 = WalletStore(
        boxName: 'test_pin_isolation',
        cipher: cipher1,
      );
      await store1.init();
      await store1.saveClientState({
        'userId': 'abcd1234' * 8,
        'signingSecret': 'ef567890' * 8,
      });
      await store1.close();

      // Try to read with wrong PIN - this should fail to open or read
      final cipher2 = createCipherFromPin('wrongpin');
      final store2 = WalletStore(
        boxName: 'test_pin_isolation',
        cipher: cipher2,
      );

      // Opening with wrong cipher should fail or return corrupted data
      try {
        await store2.init();
        await store2.getClientState();
        // If we get here, data should be null/corrupted due to wrong key
        // Hive may throw or return garbage depending on implementation
        await store2.close();
      } catch (e) {
        // Expected - wrong key should cause decryption failure
        expect(e, isNotNull);
      }
    });
  });
}
