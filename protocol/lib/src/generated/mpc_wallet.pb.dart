//
//  Generated code. Do not modify.
//  source: mpc_wallet.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DKGStep1Request extends $pb.GeneratedMessage {
  factory DKGStep1Request({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (identifier != null) {
      $result.identifier = identifier;
    }
    if (round1Package != null) {
      $result.round1Package = round1Package;
    }
    return $result;
  }
  DKGStep1Request._() : super();
  factory DKGStep1Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep1Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep1Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep1Request clone() => DKGStep1Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep1Request copyWith(void Function(DKGStep1Request) updates) => super.copyWith((message) => updates(message as DKGStep1Request)) as DKGStep1Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep1Request create() => DKGStep1Request._();
  DKGStep1Request createEmptyInstance() => create();
  static $pb.PbList<DKGStep1Request> createRepeated() => $pb.PbList<DKGStep1Request>();
  @$core.pragma('dart2js:noInline')
  static DKGStep1Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep1Request>(create);
  static DKGStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);
}

class DKGStep1Response extends $pb.GeneratedMessage {
  factory DKGStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round1Packages,
  }) {
    final $result = create();
    if (round1Packages != null) {
      $result.round1Packages.addEntries(round1Packages);
    }
    return $result;
  }
  DKGStep1Response._() : super();
  factory DKGStep1Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep1Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep1Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round1Packages', entryClassName: 'DKGStep1Response.Round1PackagesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep1Response clone() => DKGStep1Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep1Response copyWith(void Function(DKGStep1Response) updates) => super.copyWith((message) => updates(message as DKGStep1Response)) as DKGStep1Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep1Response create() => DKGStep1Response._();
  DKGStep1Response createEmptyInstance() => create();
  static $pb.PbList<DKGStep1Response> createRepeated() => $pb.PbList<DKGStep1Response>();
  @$core.pragma('dart2js:noInline')
  static DKGStep1Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep1Response>(create);
  static DKGStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round1Packages => $_getMap(0);
}

class DKGStep2Request extends $pb.GeneratedMessage {
  factory DKGStep2Request({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (identifier != null) {
      $result.identifier = identifier;
    }
    if (round1Package != null) {
      $result.round1Package = round1Package;
    }
    return $result;
  }
  DKGStep2Request._() : super();
  factory DKGStep2Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep2Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep2Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep2Request clone() => DKGStep2Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep2Request copyWith(void Function(DKGStep2Request) updates) => super.copyWith((message) => updates(message as DKGStep2Request)) as DKGStep2Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep2Request create() => DKGStep2Request._();
  DKGStep2Request createEmptyInstance() => create();
  static $pb.PbList<DKGStep2Request> createRepeated() => $pb.PbList<DKGStep2Request>();
  @$core.pragma('dart2js:noInline')
  static DKGStep2Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep2Request>(create);
  static DKGStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);
}

class DKGStep2Response extends $pb.GeneratedMessage {
  factory DKGStep2Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? allRound1Packages,
  }) {
    final $result = create();
    if (allRound1Packages != null) {
      $result.allRound1Packages.addEntries(allRound1Packages);
    }
    return $result;
  }
  DKGStep2Response._() : super();
  factory DKGStep2Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep2Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep2Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'allRound1Packages', entryClassName: 'DKGStep2Response.AllRound1PackagesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep2Response clone() => DKGStep2Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep2Response copyWith(void Function(DKGStep2Response) updates) => super.copyWith((message) => updates(message as DKGStep2Response)) as DKGStep2Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep2Response create() => DKGStep2Response._();
  DKGStep2Response createEmptyInstance() => create();
  static $pb.PbList<DKGStep2Response> createRepeated() => $pb.PbList<DKGStep2Response>();
  @$core.pragma('dart2js:noInline')
  static DKGStep2Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep2Response>(create);
  static DKGStep2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get allRound1Packages => $_getMap(0);
}

class DKGStep3Request extends $pb.GeneratedMessage {
  factory DKGStep3Request({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? identifier,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round2PackagesForOthers,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (identifier != null) {
      $result.identifier = identifier;
    }
    if (round2PackagesForOthers != null) {
      $result.round2PackagesForOthers.addEntries(round2PackagesForOthers);
    }
    return $result;
  }
  DKGStep3Request._() : super();
  factory DKGStep3Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep3Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep3Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'round2PackagesForOthers', entryClassName: 'DKGStep3Request.Round2PackagesForOthersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep3Request clone() => DKGStep3Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep3Request copyWith(void Function(DKGStep3Request) updates) => super.copyWith((message) => updates(message as DKGStep3Request)) as DKGStep3Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep3Request create() => DKGStep3Request._();
  DKGStep3Request createEmptyInstance() => create();
  static $pb.PbList<DKGStep3Request> createRepeated() => $pb.PbList<DKGStep3Request>();
  @$core.pragma('dart2js:noInline')
  static DKGStep3Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep3Request>(create);
  static DKGStep3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForOthers => $_getMap(2);
}

class DKGStep3Response extends $pb.GeneratedMessage {
  factory DKGStep3Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round2PackagesForMe,
  }) {
    final $result = create();
    if (round2PackagesForMe != null) {
      $result.round2PackagesForMe.addEntries(round2PackagesForMe);
    }
    return $result;
  }
  DKGStep3Response._() : super();
  factory DKGStep3Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DKGStep3Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DKGStep3Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round2PackagesForMe', entryClassName: 'DKGStep3Response.Round2PackagesForMeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DKGStep3Response clone() => DKGStep3Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DKGStep3Response copyWith(void Function(DKGStep3Response) updates) => super.copyWith((message) => updates(message as DKGStep3Response)) as DKGStep3Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep3Response create() => DKGStep3Response._();
  DKGStep3Response createEmptyInstance() => create();
  static $pb.PbList<DKGStep3Response> createRepeated() => $pb.PbList<DKGStep3Response>();
  @$core.pragma('dart2js:noInline')
  static DKGStep3Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DKGStep3Response>(create);
  static DKGStep3Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForMe => $_getMap(0);
}

class SignStep1Request extends $pb.GeneratedMessage {
  factory SignStep1Request({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? hidingCommitment,
    $core.List<$core.int>? bindingCommitment,
    $core.List<$core.int>? messageToSign,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? fullTransaction,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (hidingCommitment != null) {
      $result.hidingCommitment = hidingCommitment;
    }
    if (bindingCommitment != null) {
      $result.bindingCommitment = bindingCommitment;
    }
    if (messageToSign != null) {
      $result.messageToSign = messageToSign;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (fullTransaction != null) {
      $result.fullTransaction = fullTransaction;
    }
    return $result;
  }
  SignStep1Request._() : super();
  factory SignStep1Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignStep1Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignStep1Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'hidingCommitment', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'bindingCommitment', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'messageToSign', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'fullTransaction', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignStep1Request clone() => SignStep1Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignStep1Request copyWith(void Function(SignStep1Request) updates) => super.copyWith((message) => updates(message as SignStep1Request)) as SignStep1Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Request create() => SignStep1Request._();
  SignStep1Request createEmptyInstance() => create();
  static $pb.PbList<SignStep1Request> createRepeated() => $pb.PbList<SignStep1Request>();
  @$core.pragma('dart2js:noInline')
  static SignStep1Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignStep1Request>(create);
  static SignStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hidingCommitment => $_getN(1);
  @$pb.TagNumber(2)
  set hidingCommitment($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHidingCommitment() => $_has(1);
  @$pb.TagNumber(2)
  void clearHidingCommitment() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get bindingCommitment => $_getN(2);
  @$pb.TagNumber(3)
  set bindingCommitment($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBindingCommitment() => $_has(2);
  @$pb.TagNumber(3)
  void clearBindingCommitment() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get messageToSign => $_getN(3);
  @$pb.TagNumber(4)
  set messageToSign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageToSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageToSign() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(5)
  set signature($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get fullTransaction => $_getN(5);
  @$pb.TagNumber(6)
  set fullTransaction($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFullTransaction() => $_has(5);
  @$pb.TagNumber(6)
  void clearFullTransaction() => $_clearField(6);
}

class SignStep1Response_Commitment extends $pb.GeneratedMessage {
  factory SignStep1Response_Commitment({
    $core.List<$core.int>? hiding,
    $core.List<$core.int>? binding,
  }) {
    final $result = create();
    if (hiding != null) {
      $result.hiding = hiding;
    }
    if (binding != null) {
      $result.binding = binding;
    }
    return $result;
  }
  SignStep1Response_Commitment._() : super();
  factory SignStep1Response_Commitment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignStep1Response_Commitment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignStep1Response.Commitment', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hiding', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'binding', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignStep1Response_Commitment clone() => SignStep1Response_Commitment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignStep1Response_Commitment copyWith(void Function(SignStep1Response_Commitment) updates) => super.copyWith((message) => updates(message as SignStep1Response_Commitment)) as SignStep1Response_Commitment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Response_Commitment create() => SignStep1Response_Commitment._();
  SignStep1Response_Commitment createEmptyInstance() => create();
  static $pb.PbList<SignStep1Response_Commitment> createRepeated() => $pb.PbList<SignStep1Response_Commitment>();
  @$core.pragma('dart2js:noInline')
  static SignStep1Response_Commitment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignStep1Response_Commitment>(create);
  static SignStep1Response_Commitment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hiding => $_getN(0);
  @$pb.TagNumber(1)
  set hiding($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHiding() => $_has(0);
  @$pb.TagNumber(1)
  void clearHiding() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get binding => $_getN(1);
  @$pb.TagNumber(2)
  set binding($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBinding() => $_has(1);
  @$pb.TagNumber(2)
  void clearBinding() => $_clearField(2);
}

class SignStep1Response extends $pb.GeneratedMessage {
  factory SignStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, SignStep1Response_Commitment>>? commitments,
    $core.List<$core.int>? messageToSign,
    $core.int? usedKeyIndex,
  }) {
    final $result = create();
    if (commitments != null) {
      $result.commitments.addEntries(commitments);
    }
    if (messageToSign != null) {
      $result.messageToSign = messageToSign;
    }
    if (usedKeyIndex != null) {
      $result.usedKeyIndex = usedKeyIndex;
    }
    return $result;
  }
  SignStep1Response._() : super();
  factory SignStep1Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignStep1Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignStep1Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, SignStep1Response_Commitment>(1, _omitFieldNames ? '' : 'commitments', entryClassName: 'SignStep1Response.CommitmentsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: SignStep1Response_Commitment.create, valueDefaultOrMaker: SignStep1Response_Commitment.getDefault, packageName: const $pb.PackageName('mpc_wallet'))
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'messageToSign', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'usedKeyIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignStep1Response clone() => SignStep1Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignStep1Response copyWith(void Function(SignStep1Response) updates) => super.copyWith((message) => updates(message as SignStep1Response)) as SignStep1Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Response create() => SignStep1Response._();
  SignStep1Response createEmptyInstance() => create();
  static $pb.PbList<SignStep1Response> createRepeated() => $pb.PbList<SignStep1Response>();
  @$core.pragma('dart2js:noInline')
  static SignStep1Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignStep1Response>(create);
  static SignStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, SignStep1Response_Commitment> get commitments => $_getMap(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messageToSign => $_getN(1);
  @$pb.TagNumber(2)
  set messageToSign($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageToSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageToSign() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get usedKeyIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set usedKeyIndex($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsedKeyIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsedKeyIndex() => $_clearField(3);
}

class SignStep2Request extends $pb.GeneratedMessage {
  factory SignStep2Request({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? signatureShare,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (signatureShare != null) {
      $result.signatureShare = signatureShare;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  SignStep2Request._() : super();
  factory SignStep2Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignStep2Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignStep2Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'signatureShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignStep2Request clone() => SignStep2Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignStep2Request copyWith(void Function(SignStep2Request) updates) => super.copyWith((message) => updates(message as SignStep2Request)) as SignStep2Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep2Request create() => SignStep2Request._();
  SignStep2Request createEmptyInstance() => create();
  static $pb.PbList<SignStep2Request> createRepeated() => $pb.PbList<SignStep2Request>();
  @$core.pragma('dart2js:noInline')
  static SignStep2Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignStep2Request>(create);
  static SignStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signatureShare => $_getN(1);
  @$pb.TagNumber(3)
  set signatureShare($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignatureShare() => $_has(1);
  @$pb.TagNumber(3)
  void clearSignatureShare() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);
}

class UtxoInfo extends $pb.GeneratedMessage {
  factory UtxoInfo({
    $core.String? txHash,
    $core.int? vout,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (txHash != null) {
      $result.txHash = txHash;
    }
    if (vout != null) {
      $result.vout = vout;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  UtxoInfo._() : super();
  factory UtxoInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UtxoInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UtxoInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHash')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'vout', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UtxoInfo clone() => UtxoInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UtxoInfo copyWith(void Function(UtxoInfo) updates) => super.copyWith((message) => updates(message as UtxoInfo)) as UtxoInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UtxoInfo create() => UtxoInfo._();
  UtxoInfo createEmptyInstance() => create();
  static $pb.PbList<UtxoInfo> createRepeated() => $pb.PbList<UtxoInfo>();
  @$core.pragma('dart2js:noInline')
  static UtxoInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UtxoInfo>(create);
  static UtxoInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

class SignStep2Response extends $pb.GeneratedMessage {
  factory SignStep2Response({
    $core.List<$core.int>? rPoint,
    $core.List<$core.int>? zScalar,
  }) {
    final $result = create();
    if (rPoint != null) {
      $result.rPoint = rPoint;
    }
    if (zScalar != null) {
      $result.zScalar = zScalar;
    }
    return $result;
  }
  SignStep2Response._() : super();
  factory SignStep2Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignStep2Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignStep2Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'rPoint', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'zScalar', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignStep2Response clone() => SignStep2Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignStep2Response copyWith(void Function(SignStep2Response) updates) => super.copyWith((message) => updates(message as SignStep2Response)) as SignStep2Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep2Response create() => SignStep2Response._();
  SignStep2Response createEmptyInstance() => create();
  static $pb.PbList<SignStep2Response> createRepeated() => $pb.PbList<SignStep2Response>();
  @$core.pragma('dart2js:noInline')
  static SignStep2Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignStep2Response>(create);
  static SignStep2Response? _defaultInstance;

  /// Final aggregated signature
  /// (R, z)
  @$pb.TagNumber(1)
  $core.List<$core.int> get rPoint => $_getN(0);
  @$pb.TagNumber(1)
  set rPoint($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearRPoint() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get zScalar => $_getN(1);
  @$pb.TagNumber(2)
  set zScalar($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasZScalar() => $_has(1);
  @$pb.TagNumber(2)
  void clearZScalar() => $_clearField(2);
}

class RefreshStep1Request extends $pb.GeneratedMessage {
  factory RefreshStep1Request({
    $core.List<$core.int>? userId,
    $core.String? round1Package,
    $fixnum.Int64? thresholdAmount,
    $fixnum.Int64? interval,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (round1Package != null) {
      $result.round1Package = round1Package;
    }
    if (thresholdAmount != null) {
      $result.thresholdAmount = thresholdAmount;
    }
    if (interval != null) {
      $result.interval = interval;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  RefreshStep1Request._() : super();
  factory RefreshStep1Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep1Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep1Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..aInt64(4, _omitFieldNames ? '' : 'thresholdAmount')
    ..aInt64(5, _omitFieldNames ? '' : 'interval')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep1Request clone() => RefreshStep1Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep1Request copyWith(void Function(RefreshStep1Request) updates) => super.copyWith((message) => updates(message as RefreshStep1Request)) as RefreshStep1Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep1Request create() => RefreshStep1Request._();
  RefreshStep1Request createEmptyInstance() => create();
  static $pb.PbList<RefreshStep1Request> createRepeated() => $pb.PbList<RefreshStep1Request>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep1Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep1Request>(create);
  static RefreshStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(1);
  @$pb.TagNumber(3)
  set round1Package($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(1);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get thresholdAmount => $_getI64(2);
  @$pb.TagNumber(4)
  set thresholdAmount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasThresholdAmount() => $_has(2);
  @$pb.TagNumber(4)
  void clearThresholdAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get interval => $_getI64(3);
  @$pb.TagNumber(5)
  set interval($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasInterval() => $_has(3);
  @$pb.TagNumber(5)
  void clearInterval() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(6)
  set signature($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(6)
  void clearSignature() => $_clearField(6);
}

class RefreshStep1Response extends $pb.GeneratedMessage {
  factory RefreshStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round1Packages,
    $core.String? policyId,
    $fixnum.Int64? startTime,
  }) {
    final $result = create();
    if (round1Packages != null) {
      $result.round1Packages.addEntries(round1Packages);
    }
    if (policyId != null) {
      $result.policyId = policyId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    return $result;
  }
  RefreshStep1Response._() : super();
  factory RefreshStep1Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep1Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep1Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round1Packages', entryClassName: 'RefreshStep1Response.Round1PackagesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..aOS(2, _omitFieldNames ? '' : 'policyId')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep1Response clone() => RefreshStep1Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep1Response copyWith(void Function(RefreshStep1Response) updates) => super.copyWith((message) => updates(message as RefreshStep1Response)) as RefreshStep1Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep1Response create() => RefreshStep1Response._();
  RefreshStep1Response createEmptyInstance() => create();
  static $pb.PbList<RefreshStep1Response> createRepeated() => $pb.PbList<RefreshStep1Response>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep1Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep1Response>(create);
  static RefreshStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round1Packages => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get policyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set policyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPolicyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPolicyId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);
}

class RefreshStep2Request extends $pb.GeneratedMessage {
  factory RefreshStep2Request({
    $core.List<$core.int>? userId,
    $core.String? round1Package,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (round1Package != null) {
      $result.round1Package = round1Package;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  RefreshStep2Request._() : super();
  factory RefreshStep2Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep2Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep2Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep2Request clone() => RefreshStep2Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep2Request copyWith(void Function(RefreshStep2Request) updates) => super.copyWith((message) => updates(message as RefreshStep2Request)) as RefreshStep2Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep2Request create() => RefreshStep2Request._();
  RefreshStep2Request createEmptyInstance() => create();
  static $pb.PbList<RefreshStep2Request> createRepeated() => $pb.PbList<RefreshStep2Request>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep2Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep2Request>(create);
  static RefreshStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// In DKG Step 2 we sent round1_package again, but strict state management
  /// might not need it if session is locked. We will mirror DKG for consistency.
  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(1);
  @$pb.TagNumber(3)
  set round1Package($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(1);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);
}

class RefreshStep2Response extends $pb.GeneratedMessage {
  factory RefreshStep2Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? allRound1Packages,
  }) {
    final $result = create();
    if (allRound1Packages != null) {
      $result.allRound1Packages.addEntries(allRound1Packages);
    }
    return $result;
  }
  RefreshStep2Response._() : super();
  factory RefreshStep2Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep2Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep2Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'allRound1Packages', entryClassName: 'RefreshStep2Response.AllRound1PackagesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep2Response clone() => RefreshStep2Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep2Response copyWith(void Function(RefreshStep2Response) updates) => super.copyWith((message) => updates(message as RefreshStep2Response)) as RefreshStep2Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep2Response create() => RefreshStep2Response._();
  RefreshStep2Response createEmptyInstance() => create();
  static $pb.PbList<RefreshStep2Response> createRepeated() => $pb.PbList<RefreshStep2Response>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep2Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep2Response>(create);
  static RefreshStep2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get allRound1Packages => $_getMap(0);
}

class RefreshStep3Request extends $pb.GeneratedMessage {
  factory RefreshStep3Request({
    $core.List<$core.int>? userId,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round2PackagesForOthers,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (round2PackagesForOthers != null) {
      $result.round2PackagesForOthers.addEntries(round2PackagesForOthers);
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  RefreshStep3Request._() : super();
  factory RefreshStep3Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep3Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep3Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'round2PackagesForOthers', entryClassName: 'RefreshStep3Request.Round2PackagesForOthersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep3Request clone() => RefreshStep3Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep3Request copyWith(void Function(RefreshStep3Request) updates) => super.copyWith((message) => updates(message as RefreshStep3Request)) as RefreshStep3Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep3Request create() => RefreshStep3Request._();
  RefreshStep3Request createEmptyInstance() => create();
  static $pb.PbList<RefreshStep3Request> createRepeated() => $pb.PbList<RefreshStep3Request>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep3Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep3Request>(create);
  static RefreshStep3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForOthers => $_getMap(1);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);
}

class RefreshStep3Response extends $pb.GeneratedMessage {
  factory RefreshStep3Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round2PackagesForMe,
  }) {
    final $result = create();
    if (round2PackagesForMe != null) {
      $result.round2PackagesForMe.addEntries(round2PackagesForMe);
    }
    return $result;
  }
  RefreshStep3Response._() : super();
  factory RefreshStep3Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshStep3Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshStep3Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round2PackagesForMe', entryClassName: 'RefreshStep3Response.Round2PackagesForMeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshStep3Response clone() => RefreshStep3Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshStep3Response copyWith(void Function(RefreshStep3Response) updates) => super.copyWith((message) => updates(message as RefreshStep3Response)) as RefreshStep3Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep3Response create() => RefreshStep3Response._();
  RefreshStep3Response createEmptyInstance() => create();
  static $pb.PbList<RefreshStep3Response> createRepeated() => $pb.PbList<RefreshStep3Response>();
  @$core.pragma('dart2js:noInline')
  static RefreshStep3Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshStep3Response>(create);
  static RefreshStep3Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForMe => $_getMap(0);
}

class CreateSpendingPolicyRequest extends $pb.GeneratedMessage {
  factory CreateSpendingPolicyRequest({
    $core.List<$core.int>? userId,
    $fixnum.Int64? thresholdSats,
    $fixnum.Int64? startTime,
    $fixnum.Int64? intervalSeconds,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (thresholdSats != null) {
      $result.thresholdSats = thresholdSats;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (intervalSeconds != null) {
      $result.intervalSeconds = intervalSeconds;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  CreateSpendingPolicyRequest._() : super();
  factory CreateSpendingPolicyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSpendingPolicyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSpendingPolicyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'thresholdSats')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..aInt64(4, _omitFieldNames ? '' : 'intervalSeconds')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSpendingPolicyRequest clone() => CreateSpendingPolicyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSpendingPolicyRequest copyWith(void Function(CreateSpendingPolicyRequest) updates) => super.copyWith((message) => updates(message as CreateSpendingPolicyRequest)) as CreateSpendingPolicyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyRequest create() => CreateSpendingPolicyRequest._();
  CreateSpendingPolicyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSpendingPolicyRequest> createRepeated() => $pb.PbList<CreateSpendingPolicyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSpendingPolicyRequest>(create);
  static CreateSpendingPolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get thresholdSats => $_getI64(1);
  @$pb.TagNumber(2)
  set thresholdSats($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThresholdSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearThresholdSats() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get intervalSeconds => $_getI64(3);
  @$pb.TagNumber(4)
  set intervalSeconds($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIntervalSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntervalSeconds() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(5)
  set signature($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => $_clearField(5);
}

class CreateSpendingPolicyResponse extends $pb.GeneratedMessage {
  factory CreateSpendingPolicyResponse({
    $core.String? policyId,
    $core.int? allocatedKeyIndex,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    if (allocatedKeyIndex != null) {
      $result.allocatedKeyIndex = allocatedKeyIndex;
    }
    return $result;
  }
  CreateSpendingPolicyResponse._() : super();
  factory CreateSpendingPolicyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSpendingPolicyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSpendingPolicyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'allocatedKeyIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSpendingPolicyResponse clone() => CreateSpendingPolicyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSpendingPolicyResponse copyWith(void Function(CreateSpendingPolicyResponse) updates) => super.copyWith((message) => updates(message as CreateSpendingPolicyResponse)) as CreateSpendingPolicyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyResponse create() => CreateSpendingPolicyResponse._();
  CreateSpendingPolicyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSpendingPolicyResponse> createRepeated() => $pb.PbList<CreateSpendingPolicyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSpendingPolicyResponse>(create);
  static CreateSpendingPolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get allocatedKeyIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set allocatedKeyIndex($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAllocatedKeyIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllocatedKeyIndex() => $_clearField(2);
}

class GetPolicyIdRequest extends $pb.GeneratedMessage {
  factory GetPolicyIdRequest({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? txMessage,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (txMessage != null) {
      $result.txMessage = txMessage;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  GetPolicyIdRequest._() : super();
  factory GetPolicyIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPolicyIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPolicyIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'txMessage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPolicyIdRequest clone() => GetPolicyIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPolicyIdRequest copyWith(void Function(GetPolicyIdRequest) updates) => super.copyWith((message) => updates(message as GetPolicyIdRequest)) as GetPolicyIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPolicyIdRequest create() => GetPolicyIdRequest._();
  GetPolicyIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetPolicyIdRequest> createRepeated() => $pb.PbList<GetPolicyIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPolicyIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPolicyIdRequest>(create);
  static GetPolicyIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txMessage => $_getN(1);
  @$pb.TagNumber(2)
  set txMessage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);
}

class GetPolicyIdResponse extends $pb.GeneratedMessage {
  factory GetPolicyIdResponse({
    $core.String? policyId,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    return $result;
  }
  GetPolicyIdResponse._() : super();
  factory GetPolicyIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPolicyIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPolicyIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPolicyIdResponse clone() => GetPolicyIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPolicyIdResponse copyWith(void Function(GetPolicyIdResponse) updates) => super.copyWith((message) => updates(message as GetPolicyIdResponse)) as GetPolicyIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPolicyIdResponse create() => GetPolicyIdResponse._();
  GetPolicyIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetPolicyIdResponse> createRepeated() => $pb.PbList<GetPolicyIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPolicyIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPolicyIdResponse>(create);
  static GetPolicyIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);
}

class BroadcastTransactionRequest extends $pb.GeneratedMessage {
  factory BroadcastTransactionRequest({
    $core.List<$core.int>? userId,
    $core.String? txHex,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (txHex != null) {
      $result.txHex = txHex;
    }
    return $result;
  }
  BroadcastTransactionRequest._() : super();
  factory BroadcastTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'txHex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRequest clone() => BroadcastTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRequest copyWith(void Function(BroadcastTransactionRequest) updates) => super.copyWith((message) => updates(message as BroadcastTransactionRequest)) as BroadcastTransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest create() => BroadcastTransactionRequest._();
  BroadcastTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionRequest> createRepeated() => $pb.PbList<BroadcastTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionRequest>(create);
  static BroadcastTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get txHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set txHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxHex() => $_clearField(2);
}

class BroadcastTransactionResponse extends $pb.GeneratedMessage {
  factory BroadcastTransactionResponse({
    $core.String? txId,
  }) {
    final $result = create();
    if (txId != null) {
      $result.txId = txId;
    }
    return $result;
  }
  BroadcastTransactionResponse._() : super();
  factory BroadcastTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionResponse clone() => BroadcastTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionResponse copyWith(void Function(BroadcastTransactionResponse) updates) => super.copyWith((message) => updates(message as BroadcastTransactionResponse)) as BroadcastTransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse create() => BroadcastTransactionResponse._();
  BroadcastTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionResponse> createRepeated() => $pb.PbList<BroadcastTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionResponse>(create);
  static BroadcastTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxId() => $_clearField(1);
}

class FetchHistoryRequest extends $pb.GeneratedMessage {
  factory FetchHistoryRequest({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  FetchHistoryRequest._() : super();
  factory FetchHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchHistoryRequest clone() => FetchHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchHistoryRequest copyWith(void Function(FetchHistoryRequest) updates) => super.copyWith((message) => updates(message as FetchHistoryRequest)) as FetchHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchHistoryRequest create() => FetchHistoryRequest._();
  FetchHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<FetchHistoryRequest> createRepeated() => $pb.PbList<FetchHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchHistoryRequest>(create);
  static FetchHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class FetchHistoryResponse extends $pb.GeneratedMessage {
  factory FetchHistoryResponse({
    $core.Iterable<UtxoInfo>? utxos,
  }) {
    final $result = create();
    if (utxos != null) {
      $result.utxos.addAll(utxos);
    }
    return $result;
  }
  FetchHistoryResponse._() : super();
  factory FetchHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..pc<UtxoInfo>(1, _omitFieldNames ? '' : 'utxos', $pb.PbFieldType.PM, subBuilder: UtxoInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchHistoryResponse clone() => FetchHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchHistoryResponse copyWith(void Function(FetchHistoryResponse) updates) => super.copyWith((message) => updates(message as FetchHistoryResponse)) as FetchHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchHistoryResponse create() => FetchHistoryResponse._();
  FetchHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<FetchHistoryResponse> createRepeated() => $pb.PbList<FetchHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchHistoryResponse>(create);
  static FetchHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UtxoInfo> get utxos => $_getList(0);
}

class FetchRecentTransactionsRequest extends $pb.GeneratedMessage {
  factory FetchRecentTransactionsRequest({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  FetchRecentTransactionsRequest._() : super();
  factory FetchRecentTransactionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchRecentTransactionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchRecentTransactionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchRecentTransactionsRequest clone() => FetchRecentTransactionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchRecentTransactionsRequest copyWith(void Function(FetchRecentTransactionsRequest) updates) => super.copyWith((message) => updates(message as FetchRecentTransactionsRequest)) as FetchRecentTransactionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecentTransactionsRequest create() => FetchRecentTransactionsRequest._();
  FetchRecentTransactionsRequest createEmptyInstance() => create();
  static $pb.PbList<FetchRecentTransactionsRequest> createRepeated() => $pb.PbList<FetchRecentTransactionsRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchRecentTransactionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchRecentTransactionsRequest>(create);
  static FetchRecentTransactionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class FetchRecentTransactionsResponse extends $pb.GeneratedMessage {
  factory FetchRecentTransactionsResponse({
    $core.Iterable<TransactionSummary>? transactions,
  }) {
    final $result = create();
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    return $result;
  }
  FetchRecentTransactionsResponse._() : super();
  factory FetchRecentTransactionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchRecentTransactionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchRecentTransactionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..pc<TransactionSummary>(1, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: TransactionSummary.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchRecentTransactionsResponse clone() => FetchRecentTransactionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchRecentTransactionsResponse copyWith(void Function(FetchRecentTransactionsResponse) updates) => super.copyWith((message) => updates(message as FetchRecentTransactionsResponse)) as FetchRecentTransactionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecentTransactionsResponse create() => FetchRecentTransactionsResponse._();
  FetchRecentTransactionsResponse createEmptyInstance() => create();
  static $pb.PbList<FetchRecentTransactionsResponse> createRepeated() => $pb.PbList<FetchRecentTransactionsResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchRecentTransactionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchRecentTransactionsResponse>(create);
  static FetchRecentTransactionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TransactionSummary> get transactions => $_getList(0);
}

class TransactionSummary extends $pb.GeneratedMessage {
  factory TransactionSummary({
    $core.String? txHash,
    $fixnum.Int64? amountSats,
    $fixnum.Int64? timestamp,
    $core.bool? isPending,
  }) {
    final $result = create();
    if (txHash != null) {
      $result.txHash = txHash;
    }
    if (amountSats != null) {
      $result.amountSats = amountSats;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (isPending != null) {
      $result.isPending = isPending;
    }
    return $result;
  }
  TransactionSummary._() : super();
  factory TransactionSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionSummary', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHash')
    ..aInt64(2, _omitFieldNames ? '' : 'amountSats')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..aOB(4, _omitFieldNames ? '' : 'isPending')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionSummary clone() => TransactionSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionSummary copyWith(void Function(TransactionSummary) updates) => super.copyWith((message) => updates(message as TransactionSummary)) as TransactionSummary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionSummary create() => TransactionSummary._();
  TransactionSummary createEmptyInstance() => create();
  static $pb.PbList<TransactionSummary> createRepeated() => $pb.PbList<TransactionSummary>();
  @$core.pragma('dart2js:noInline')
  static TransactionSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSummary>(create);
  static TransactionSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amountSats => $_getI64(1);
  @$pb.TagNumber(2)
  set amountSats($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmountSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountSats() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPending => $_getBF(3);
  @$pb.TagNumber(4)
  set isPending($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPending() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPending() => $_clearField(4);
}

class SubscribeToHistoryRequest extends $pb.GeneratedMessage {
  factory SubscribeToHistoryRequest({
    $core.List<$core.int>? userId,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  SubscribeToHistoryRequest._() : super();
  factory SubscribeToHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeToHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeToHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeToHistoryRequest clone() => SubscribeToHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeToHistoryRequest copyWith(void Function(SubscribeToHistoryRequest) updates) => super.copyWith((message) => updates(message as SubscribeToHistoryRequest)) as SubscribeToHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeToHistoryRequest create() => SubscribeToHistoryRequest._();
  SubscribeToHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeToHistoryRequest> createRepeated() => $pb.PbList<SubscribeToHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeToHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeToHistoryRequest>(create);
  static SubscribeToHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class TransactionNotification extends $pb.GeneratedMessage {
  factory TransactionNotification({
    $core.String? txHash,
    $core.int? height,
    $core.Iterable<UtxoInfo>? addedUtxos,
    $core.Iterable<UtxoInfo>? spentUtxos,
  }) {
    final $result = create();
    if (txHash != null) {
      $result.txHash = txHash;
    }
    if (height != null) {
      $result.height = height;
    }
    if (addedUtxos != null) {
      $result.addedUtxos.addAll(addedUtxos);
    }
    if (spentUtxos != null) {
      $result.spentUtxos.addAll(spentUtxos);
    }
    return $result;
  }
  TransactionNotification._() : super();
  factory TransactionNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHash')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..pc<UtxoInfo>(3, _omitFieldNames ? '' : 'addedUtxos', $pb.PbFieldType.PM, subBuilder: UtxoInfo.create)
    ..pc<UtxoInfo>(4, _omitFieldNames ? '' : 'spentUtxos', $pb.PbFieldType.PM, subBuilder: UtxoInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionNotification clone() => TransactionNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionNotification copyWith(void Function(TransactionNotification) updates) => super.copyWith((message) => updates(message as TransactionNotification)) as TransactionNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionNotification create() => TransactionNotification._();
  TransactionNotification createEmptyInstance() => create();
  static $pb.PbList<TransactionNotification> createRepeated() => $pb.PbList<TransactionNotification>();
  @$core.pragma('dart2js:noInline')
  static TransactionNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionNotification>(create);
  static TransactionNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => $_clearField(2);

  /// Using a simple notification that "something changed" or sending the full update?
  /// User said "rely on server for maintaining state and updating it with latest transactions"
  /// Sending the relevant UTXOs involved (newly created ones owned by wallet)
  @$pb.TagNumber(3)
  $pb.PbList<UtxoInfo> get addedUtxos => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<UtxoInfo> get spentUtxos => $_getList(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
