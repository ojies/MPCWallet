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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'keyPackage': keyPackage.toJson(),
      'publicKeyPackage': publicKeyPackage.toJson(),
    };
  }

  static SpendingPolicy fromJson(Map<String, dynamic> json) {
    final keyPackageJson =
        Map<String, dynamic>.from(json['keyPackage'] as Map);
    final publicKeyPackageJson =
        Map<String, dynamic>.from(json['publicKeyPackage'] as Map);
    return SpendingPolicy(
      id: json['id'],
      keyPackage: threshold.KeyPackage.fromJson(keyPackageJson),
      publicKeyPackage: threshold.PublicKeyPackage.fromJson(
          publicKeyPackageJson),
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'keyPackage': keyPackage.toJson(),
      'publicKeyPackage': publicKeyPackage.toJson(),
      'startTime': startTime.millisecondsSinceEpoch,
      'interval': interval.inSeconds,
    };
  }

  static ProtectedPolicy fromJson(Map<String, dynamic> json) {
    final keyPackageJson =
        Map<String, dynamic>.from(json['keyPackage'] as Map);
    final publicKeyPackageJson =
        Map<String, dynamic>.from(json['publicKeyPackage'] as Map);
    return ProtectedPolicy(
      id: json['id'],
      keyPackage: threshold.KeyPackage.fromJson(keyPackageJson),
      publicKeyPackage: threshold.PublicKeyPackage.fromJson(
          publicKeyPackageJson),
      startTime: DateTime.fromMillisecondsSinceEpoch(json['startTime']),
      interval: Duration(seconds: json['interval']),
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'keyPackage': keyPackage.toJson(),
      'publicKeyPackage': publicKeyPackage.toJson(),
    };
  }

  static RecoveryPolicy fromJson(Map<String, dynamic> json) {
    final keyPackageJson =
        Map<String, dynamic>.from(json['keyPackage'] as Map);
    final publicKeyPackageJson =
        Map<String, dynamic>.from(json['publicKeyPackage'] as Map);
    return RecoveryPolicy(
      id: json['id'],
      keyPackage: threshold.KeyPackage.fromJson(keyPackageJson),
      publicKeyPackage: threshold.PublicKeyPackage.fromJson(
          publicKeyPackageJson),
    );
  }
}
