import 'package:threshold/threshold.dart' as threshold;

class SpendingPolicy {
  final String id;

  final threshold.KeyPackage keyPackage;
  final threshold.PublicKeyPackage publicKeyPackage;

  SpendingPolicy({
    required this.id,
    required this.keyPackage,
    required this.publicKeyPackage,
  });
}

class ProtectedPolicy {
  final String id;
  final DateTime startTime;
  final Duration interval;
  final threshold.KeyPackage keyPackage;
  final threshold.PublicKeyPackage publicKeyPackage;

  ProtectedPolicy({
    required this.id,
    required this.keyPackage,
    required this.publicKeyPackage,
    required this.startTime,
    required this.interval,
  });
}

class RecoveryPolicy {
  final String id;
  final threshold.KeyPackage keyPackage;
  final threshold.PublicKeyPackage publicKeyPackage;

  RecoveryPolicy({
    required this.id,
    required this.keyPackage,
    required this.publicKeyPackage,
  });
}
