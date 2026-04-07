/// One-time script to generate a funder keypair for MutinyNet integration tests.
///
/// Usage:
///   cd e2e && dart run bin/gen_funder_key.dart
///
/// Output: hex secret key + tb1p... address.
/// Save the secret key as MUTINYNET_FUNDER_KEY env var and fund the address
/// via the MutinyNet faucet (https://faucet.mutinynet.com).
library;

import 'dart:math';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

void main() {
  // Generate 32 random bytes for the secret key
  final rng = Random.secure();
  final secretBytes = List<int>.generate(32, (_) => rng.nextInt(256));
  final secretHex = BytesUtils.toHexString(secretBytes);

  // Derive ECPrivate key and P2TR address
  final ecPrivate = ECPrivate.fromHex(secretHex);
  final ecPublic = ecPrivate.getPublic();
  final p2tr = P2trAddress.fromInternalKey(internalKey: ecPublic.toXOnly());
  final address = p2tr.toAddress(BitcoinNetwork.signet);

  print('=== MutinyNet Funder Keypair ===');
  print('');
  print('Secret key (hex):  $secretHex');
  print('Address (signet):  $address');
  print('');
  print('Save the secret key:');
  print('  export MUTINYNET_FUNDER_KEY=$secretHex');
  print('');
  print('Fund the address via MutinyNet faucet:');
  print('  https://faucet.mutinynet.com');
}
