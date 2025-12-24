// This is a generated file - do not edit.
//
// Generated from mpc_wallet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DKGStep1Request extends $pb.GeneratedMessage {
  factory DKGStep1Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round1Package != null) result.round1Package = round1Package;
    return result;
  }

  DKGStep1Request._();

  factory DKGStep1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep1Request copyWith(void Function(DKGStep1Request) updates) =>
      super.copyWith((message) => updates(message as DKGStep1Request))
          as DKGStep1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep1Request create() => DKGStep1Request._();
  @$core.override
  DKGStep1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep1Request>(create);
  static DKGStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);
}

class DKGStep1Response extends $pb.GeneratedMessage {
  factory DKGStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round1Packages,
  }) {
    final result = create();
    if (round1Packages != null)
      result.round1Packages.addEntries(round1Packages);
    return result;
  }

  DKGStep1Response._();

  factory DKGStep1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round1Packages',
        entryClassName: 'DKGStep1Response.Round1PackagesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep1Response copyWith(void Function(DKGStep1Response) updates) =>
      super.copyWith((message) => updates(message as DKGStep1Response))
          as DKGStep1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep1Response create() => DKGStep1Response._();
  @$core.override
  DKGStep1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep1Response>(create);
  static DKGStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round1Packages => $_getMap(0);
}

class DKGStep2Request extends $pb.GeneratedMessage {
  factory DKGStep2Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round1Package != null) result.round1Package = round1Package;
    return result;
  }

  DKGStep2Request._();

  factory DKGStep2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep2Request copyWith(void Function(DKGStep2Request) updates) =>
      super.copyWith((message) => updates(message as DKGStep2Request))
          as DKGStep2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep2Request create() => DKGStep2Request._();
  @$core.override
  DKGStep2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep2Request>(create);
  static DKGStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);
}

class DKGStep2Response extends $pb.GeneratedMessage {
  factory DKGStep2Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        allRound1Packages,
  }) {
    final result = create();
    if (allRound1Packages != null)
      result.allRound1Packages.addEntries(allRound1Packages);
    return result;
  }

  DKGStep2Response._();

  factory DKGStep2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1, _omitFieldNames ? '' : 'allRound1Packages',
        entryClassName: 'DKGStep2Response.AllRound1PackagesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep2Response copyWith(void Function(DKGStep2Response) updates) =>
      super.copyWith((message) => updates(message as DKGStep2Response))
          as DKGStep2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep2Response create() => DKGStep2Response._();
  @$core.override
  DKGStep2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep2Response>(create);
  static DKGStep2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get allRound1Packages => $_getMap(0);
}

class DKGStep3Request extends $pb.GeneratedMessage {
  factory DKGStep3Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        round2PackagesForOthers,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round2PackagesForOthers != null)
      result.round2PackagesForOthers.addEntries(round2PackagesForOthers);
    return result;
  }

  DKGStep3Request._();

  factory DKGStep3Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep3Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep3Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..m<$core.String, $core.String>(
        3, _omitFieldNames ? '' : 'round2PackagesForOthers',
        entryClassName: 'DKGStep3Request.Round2PackagesForOthersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep3Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep3Request copyWith(void Function(DKGStep3Request) updates) =>
      super.copyWith((message) => updates(message as DKGStep3Request))
          as DKGStep3Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep3Request create() => DKGStep3Request._();
  @$core.override
  DKGStep3Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep3Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep3Request>(create);
  static DKGStep3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForOthers =>
      $_getMap(2);
}

class DKGStep3Response extends $pb.GeneratedMessage {
  factory DKGStep3Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        round2PackagesForMe,
  }) {
    final result = create();
    if (round2PackagesForMe != null)
      result.round2PackagesForMe.addEntries(round2PackagesForMe);
    return result;
  }

  DKGStep3Response._();

  factory DKGStep3Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DKGStep3Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DKGStep3Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1, _omitFieldNames ? '' : 'round2PackagesForMe',
        entryClassName: 'DKGStep3Response.Round2PackagesForMeEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep3Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DKGStep3Response copyWith(void Function(DKGStep3Response) updates) =>
      super.copyWith((message) => updates(message as DKGStep3Response))
          as DKGStep3Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DKGStep3Response create() => DKGStep3Response._();
  @$core.override
  DKGStep3Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DKGStep3Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DKGStep3Response>(create);
  static DKGStep3Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForMe => $_getMap(0);
}

class SignStep1Request extends $pb.GeneratedMessage {
  factory SignStep1Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.List<$core.int>? hidingCommitment,
    $core.List<$core.int>? bindingCommitment,
    $core.List<$core.int>? messageToSign,
    $core.List<$core.int>? fullTransaction,
    $core.Iterable<UtxoInfo>? inputUtxos,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (hidingCommitment != null) result.hidingCommitment = hidingCommitment;
    if (bindingCommitment != null) result.bindingCommitment = bindingCommitment;
    if (messageToSign != null) result.messageToSign = messageToSign;
    if (fullTransaction != null) result.fullTransaction = fullTransaction;
    if (inputUtxos != null) result.inputUtxos.addAll(inputUtxos);
    return result;
  }

  SignStep1Request._();

  factory SignStep1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignStep1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignStep1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'hidingCommitment', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'bindingCommitment', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'messageToSign', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'fullTransaction', $pb.PbFieldType.OY)
    ..pPM<UtxoInfo>(7, _omitFieldNames ? '' : 'inputUtxos',
        subBuilder: UtxoInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Request copyWith(void Function(SignStep1Request) updates) =>
      super.copyWith((message) => updates(message as SignStep1Request))
          as SignStep1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Request create() => SignStep1Request._();
  @$core.override
  SignStep1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignStep1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignStep1Request>(create);
  static SignStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get hidingCommitment => $_getN(2);
  @$pb.TagNumber(3)
  set hidingCommitment($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHidingCommitment() => $_has(2);
  @$pb.TagNumber(3)
  void clearHidingCommitment() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bindingCommitment => $_getN(3);
  @$pb.TagNumber(4)
  set bindingCommitment($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBindingCommitment() => $_has(3);
  @$pb.TagNumber(4)
  void clearBindingCommitment() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get messageToSign => $_getN(4);
  @$pb.TagNumber(5)
  set messageToSign($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessageToSign() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageToSign() => $_clearField(5);

  /// New: Transaction Context for Policy Enforcement
  @$pb.TagNumber(6)
  $core.List<$core.int> get fullTransaction => $_getN(5);
  @$pb.TagNumber(6)
  set fullTransaction($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFullTransaction() => $_has(5);
  @$pb.TagNumber(6)
  void clearFullTransaction() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<UtxoInfo> get inputUtxos => $_getList(6);
}

class UtxoInfo extends $pb.GeneratedMessage {
  factory UtxoInfo({
    $core.String? txHash,
    $core.int? vout,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (txHash != null) result.txHash = txHash;
    if (vout != null) result.vout = vout;
    if (amount != null) result.amount = amount;
    return result;
  }

  UtxoInfo._();

  factory UtxoInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UtxoInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UtxoInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHash')
    ..aI(2, _omitFieldNames ? '' : 'vout')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoInfo copyWith(void Function(UtxoInfo) updates) =>
      super.copyWith((message) => updates(message as UtxoInfo)) as UtxoInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UtxoInfo create() => UtxoInfo._();
  @$core.override
  UtxoInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UtxoInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UtxoInfo>(create);
  static UtxoInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

class SignStep1Response_Commitment extends $pb.GeneratedMessage {
  factory SignStep1Response_Commitment({
    $core.List<$core.int>? hiding,
    $core.List<$core.int>? binding,
  }) {
    final result = create();
    if (hiding != null) result.hiding = hiding;
    if (binding != null) result.binding = binding;
    return result;
  }

  SignStep1Response_Commitment._();

  factory SignStep1Response_Commitment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignStep1Response_Commitment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignStep1Response.Commitment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hiding', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'binding', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Response_Commitment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Response_Commitment copyWith(
          void Function(SignStep1Response_Commitment) updates) =>
      super.copyWith(
              (message) => updates(message as SignStep1Response_Commitment))
          as SignStep1Response_Commitment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Response_Commitment create() =>
      SignStep1Response_Commitment._();
  @$core.override
  SignStep1Response_Commitment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignStep1Response_Commitment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignStep1Response_Commitment>(create);
  static SignStep1Response_Commitment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hiding => $_getN(0);
  @$pb.TagNumber(1)
  set hiding($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHiding() => $_has(0);
  @$pb.TagNumber(1)
  void clearHiding() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get binding => $_getN(1);
  @$pb.TagNumber(2)
  set binding($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBinding() => $_has(1);
  @$pb.TagNumber(2)
  void clearBinding() => $_clearField(2);
}

class SignStep1Response extends $pb.GeneratedMessage {
  factory SignStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, SignStep1Response_Commitment>>?
        commitments,
    $core.List<$core.int>? messageToSign,
    $core.int? usedKeyIndex,
  }) {
    final result = create();
    if (commitments != null) result.commitments.addEntries(commitments);
    if (messageToSign != null) result.messageToSign = messageToSign;
    if (usedKeyIndex != null) result.usedKeyIndex = usedKeyIndex;
    return result;
  }

  SignStep1Response._();

  factory SignStep1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignStep1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignStep1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, SignStep1Response_Commitment>(
        1, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'SignStep1Response.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: SignStep1Response_Commitment.create,
        valueDefaultOrMaker: SignStep1Response_Commitment.getDefault,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'messageToSign', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'usedKeyIndex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep1Response copyWith(void Function(SignStep1Response) updates) =>
      super.copyWith((message) => updates(message as SignStep1Response))
          as SignStep1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep1Response create() => SignStep1Response._();
  @$core.override
  SignStep1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignStep1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignStep1Response>(create);
  static SignStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, SignStep1Response_Commitment> get commitments =>
      $_getMap(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messageToSign => $_getN(1);
  @$pb.TagNumber(2)
  set messageToSign($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessageToSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageToSign() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get usedKeyIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set usedKeyIndex($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUsedKeyIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsedKeyIndex() => $_clearField(3);
}

class SignStep2Request extends $pb.GeneratedMessage {
  factory SignStep2Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.List<$core.int>? signatureShare,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (signatureShare != null) result.signatureShare = signatureShare;
    return result;
  }

  SignStep2Request._();

  factory SignStep2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignStep2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignStep2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signatureShare', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep2Request copyWith(void Function(SignStep2Request) updates) =>
      super.copyWith((message) => updates(message as SignStep2Request))
          as SignStep2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep2Request create() => SignStep2Request._();
  @$core.override
  SignStep2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignStep2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignStep2Request>(create);
  static SignStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signatureShare => $_getN(2);
  @$pb.TagNumber(3)
  set signatureShare($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignatureShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignatureShare() => $_clearField(3);
}

class SignStep2Response extends $pb.GeneratedMessage {
  factory SignStep2Response({
    $core.List<$core.int>? rPoint,
    $core.List<$core.int>? zScalar,
  }) {
    final result = create();
    if (rPoint != null) result.rPoint = rPoint;
    if (zScalar != null) result.zScalar = zScalar;
    return result;
  }

  SignStep2Response._();

  factory SignStep2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignStep2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignStep2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'rPoint', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'zScalar', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignStep2Response copyWith(void Function(SignStep2Response) updates) =>
      super.copyWith((message) => updates(message as SignStep2Response))
          as SignStep2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignStep2Response create() => SignStep2Response._();
  @$core.override
  SignStep2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignStep2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignStep2Response>(create);
  static SignStep2Response? _defaultInstance;

  /// Final aggregated signature
  /// (R, z)
  @$pb.TagNumber(1)
  $core.List<$core.int> get rPoint => $_getN(0);
  @$pb.TagNumber(1)
  set rPoint($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearRPoint() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get zScalar => $_getN(1);
  @$pb.TagNumber(2)
  set zScalar($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasZScalar() => $_has(1);
  @$pb.TagNumber(2)
  void clearZScalar() => $_clearField(2);
}

class RefreshStep1Request extends $pb.GeneratedMessage {
  factory RefreshStep1Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
    $fixnum.Int64? thresholdAmount,
    $fixnum.Int64? interval,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round1Package != null) result.round1Package = round1Package;
    if (thresholdAmount != null) result.thresholdAmount = thresholdAmount;
    if (interval != null) result.interval = interval;
    return result;
  }

  RefreshStep1Request._();

  factory RefreshStep1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..aInt64(4, _omitFieldNames ? '' : 'thresholdAmount')
    ..aInt64(5, _omitFieldNames ? '' : 'interval')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep1Request copyWith(void Function(RefreshStep1Request) updates) =>
      super.copyWith((message) => updates(message as RefreshStep1Request))
          as RefreshStep1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep1Request create() => RefreshStep1Request._();
  @$core.override
  RefreshStep1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep1Request>(create);
  static RefreshStep1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get thresholdAmount => $_getI64(3);
  @$pb.TagNumber(4)
  set thresholdAmount($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasThresholdAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearThresholdAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get interval => $_getI64(4);
  @$pb.TagNumber(5)
  set interval($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInterval() => $_has(4);
  @$pb.TagNumber(5)
  void clearInterval() => $_clearField(5);
}

class RefreshStep1Response extends $pb.GeneratedMessage {
  factory RefreshStep1Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? round1Packages,
    $core.String? policyId,
    $fixnum.Int64? startTime,
  }) {
    final result = create();
    if (round1Packages != null)
      result.round1Packages.addEntries(round1Packages);
    if (policyId != null) result.policyId = policyId;
    if (startTime != null) result.startTime = startTime;
    return result;
  }

  RefreshStep1Response._();

  factory RefreshStep1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'round1Packages',
        entryClassName: 'RefreshStep1Response.Round1PackagesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..aOS(2, _omitFieldNames ? '' : 'policyId')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep1Response copyWith(void Function(RefreshStep1Response) updates) =>
      super.copyWith((message) => updates(message as RefreshStep1Response))
          as RefreshStep1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep1Response create() => RefreshStep1Response._();
  @$core.override
  RefreshStep1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep1Response>(create);
  static RefreshStep1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round1Packages => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get policyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set policyId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPolicyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPolicyId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);
}

class RefreshStep2Request extends $pb.GeneratedMessage {
  factory RefreshStep2Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.String? round1Package,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round1Package != null) result.round1Package = round1Package;
    return result;
  }

  RefreshStep2Request._();

  factory RefreshStep2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'round1Package')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep2Request copyWith(void Function(RefreshStep2Request) updates) =>
      super.copyWith((message) => updates(message as RefreshStep2Request))
          as RefreshStep2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep2Request create() => RefreshStep2Request._();
  @$core.override
  RefreshStep2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep2Request>(create);
  static RefreshStep2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  /// In DKG Step 2 we sent round1_package again, but strict state management
  /// might not need it if session is locked. We will mirror DKG for consistency.
  @$pb.TagNumber(3)
  $core.String get round1Package => $_getSZ(2);
  @$pb.TagNumber(3)
  set round1Package($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRound1Package() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound1Package() => $_clearField(3);
}

class RefreshStep2Response extends $pb.GeneratedMessage {
  factory RefreshStep2Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        allRound1Packages,
  }) {
    final result = create();
    if (allRound1Packages != null)
      result.allRound1Packages.addEntries(allRound1Packages);
    return result;
  }

  RefreshStep2Response._();

  factory RefreshStep2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1, _omitFieldNames ? '' : 'allRound1Packages',
        entryClassName: 'RefreshStep2Response.AllRound1PackagesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep2Response copyWith(void Function(RefreshStep2Response) updates) =>
      super.copyWith((message) => updates(message as RefreshStep2Response))
          as RefreshStep2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep2Response create() => RefreshStep2Response._();
  @$core.override
  RefreshStep2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep2Response>(create);
  static RefreshStep2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get allRound1Packages => $_getMap(0);
}

class RefreshStep3Request extends $pb.GeneratedMessage {
  factory RefreshStep3Request({
    $core.String? deviceId,
    $core.List<$core.int>? identifier,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        round2PackagesForOthers,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (identifier != null) result.identifier = identifier;
    if (round2PackagesForOthers != null)
      result.round2PackagesForOthers.addEntries(round2PackagesForOthers);
    return result;
  }

  RefreshStep3Request._();

  factory RefreshStep3Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep3Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep3Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OY)
    ..m<$core.String, $core.String>(
        3, _omitFieldNames ? '' : 'round2PackagesForOthers',
        entryClassName: 'RefreshStep3Request.Round2PackagesForOthersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep3Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep3Request copyWith(void Function(RefreshStep3Request) updates) =>
      super.copyWith((message) => updates(message as RefreshStep3Request))
          as RefreshStep3Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep3Request create() => RefreshStep3Request._();
  @$core.override
  RefreshStep3Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep3Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep3Request>(create);
  static RefreshStep3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identifier => $_getN(1);
  @$pb.TagNumber(2)
  set identifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForOthers =>
      $_getMap(2);
}

class RefreshStep3Response extends $pb.GeneratedMessage {
  factory RefreshStep3Response({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        round2PackagesForMe,
  }) {
    final result = create();
    if (round2PackagesForMe != null)
      result.round2PackagesForMe.addEntries(round2PackagesForMe);
    return result;
  }

  RefreshStep3Response._();

  factory RefreshStep3Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshStep3Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshStep3Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1, _omitFieldNames ? '' : 'round2PackagesForMe',
        entryClassName: 'RefreshStep3Response.Round2PackagesForMeEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('mpc_wallet'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep3Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshStep3Response copyWith(void Function(RefreshStep3Response) updates) =>
      super.copyWith((message) => updates(message as RefreshStep3Response))
          as RefreshStep3Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshStep3Response create() => RefreshStep3Response._();
  @$core.override
  RefreshStep3Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshStep3Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshStep3Response>(create);
  static RefreshStep3Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.String> get round2PackagesForMe => $_getMap(0);
}

class CreateSpendingPolicyRequest extends $pb.GeneratedMessage {
  factory CreateSpendingPolicyRequest({
    $core.String? deviceId,
    $fixnum.Int64? thresholdSats,
    $fixnum.Int64? startTime,
    $fixnum.Int64? intervalSeconds,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (thresholdSats != null) result.thresholdSats = thresholdSats;
    if (startTime != null) result.startTime = startTime;
    if (intervalSeconds != null) result.intervalSeconds = intervalSeconds;
    return result;
  }

  CreateSpendingPolicyRequest._();

  factory CreateSpendingPolicyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSpendingPolicyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSpendingPolicyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aInt64(2, _omitFieldNames ? '' : 'thresholdSats')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..aInt64(4, _omitFieldNames ? '' : 'intervalSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSpendingPolicyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSpendingPolicyRequest copyWith(
          void Function(CreateSpendingPolicyRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSpendingPolicyRequest))
          as CreateSpendingPolicyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyRequest create() =>
      CreateSpendingPolicyRequest._();
  @$core.override
  CreateSpendingPolicyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSpendingPolicyRequest>(create);
  static CreateSpendingPolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get thresholdSats => $_getI64(1);
  @$pb.TagNumber(2)
  set thresholdSats($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThresholdSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearThresholdSats() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get intervalSeconds => $_getI64(3);
  @$pb.TagNumber(4)
  set intervalSeconds($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIntervalSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntervalSeconds() => $_clearField(4);
}

class CreateSpendingPolicyResponse extends $pb.GeneratedMessage {
  factory CreateSpendingPolicyResponse({
    $core.String? policyId,
    $core.int? allocatedKeyIndex,
  }) {
    final result = create();
    if (policyId != null) result.policyId = policyId;
    if (allocatedKeyIndex != null) result.allocatedKeyIndex = allocatedKeyIndex;
    return result;
  }

  CreateSpendingPolicyResponse._();

  factory CreateSpendingPolicyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSpendingPolicyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSpendingPolicyResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..aI(2, _omitFieldNames ? '' : 'allocatedKeyIndex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSpendingPolicyResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSpendingPolicyResponse copyWith(
          void Function(CreateSpendingPolicyResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSpendingPolicyResponse))
          as CreateSpendingPolicyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyResponse create() =>
      CreateSpendingPolicyResponse._();
  @$core.override
  CreateSpendingPolicyResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSpendingPolicyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSpendingPolicyResponse>(create);
  static CreateSpendingPolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get allocatedKeyIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set allocatedKeyIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAllocatedKeyIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllocatedKeyIndex() => $_clearField(2);
}

class GetPolicyIdRequest extends $pb.GeneratedMessage {
  factory GetPolicyIdRequest({
    $core.String? deviceId,
    $core.List<$core.int>? txMessage,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (txMessage != null) result.txMessage = txMessage;
    return result;
  }

  GetPolicyIdRequest._();

  factory GetPolicyIdRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPolicyIdRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPolicyIdRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'txMessage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPolicyIdRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPolicyIdRequest copyWith(void Function(GetPolicyIdRequest) updates) =>
      super.copyWith((message) => updates(message as GetPolicyIdRequest))
          as GetPolicyIdRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPolicyIdRequest create() => GetPolicyIdRequest._();
  @$core.override
  GetPolicyIdRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPolicyIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPolicyIdRequest>(create);
  static GetPolicyIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txMessage => $_getN(1);
  @$pb.TagNumber(2)
  set txMessage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxMessage() => $_clearField(2);
}

class GetPolicyIdResponse extends $pb.GeneratedMessage {
  factory GetPolicyIdResponse({
    $core.String? policyId,
  }) {
    final result = create();
    if (policyId != null) result.policyId = policyId;
    return result;
  }

  GetPolicyIdResponse._();

  factory GetPolicyIdResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPolicyIdResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPolicyIdResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPolicyIdResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPolicyIdResponse copyWith(void Function(GetPolicyIdResponse) updates) =>
      super.copyWith((message) => updates(message as GetPolicyIdResponse))
          as GetPolicyIdResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPolicyIdResponse create() => GetPolicyIdResponse._();
  @$core.override
  GetPolicyIdResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPolicyIdResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPolicyIdResponse>(create);
  static GetPolicyIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);
}

class BroadcastTransactionRequest extends $pb.GeneratedMessage {
  factory BroadcastTransactionRequest({
    $core.String? deviceId,
    $core.String? txHex,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (txHex != null) result.txHex = txHex;
    return result;
  }

  BroadcastTransactionRequest._();

  factory BroadcastTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'txHex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionRequest copyWith(
          void Function(BroadcastTransactionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastTransactionRequest))
          as BroadcastTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest create() =>
      BroadcastTransactionRequest._();
  @$core.override
  BroadcastTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionRequest>(create);
  static BroadcastTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get txHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set txHex($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxHex() => $_clearField(2);
}

class BroadcastTransactionResponse extends $pb.GeneratedMessage {
  factory BroadcastTransactionResponse({
    $core.String? txId,
  }) {
    final result = create();
    if (txId != null) result.txId = txId;
    return result;
  }

  BroadcastTransactionResponse._();

  factory BroadcastTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionResponse copyWith(
          void Function(BroadcastTransactionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastTransactionResponse))
          as BroadcastTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse create() =>
      BroadcastTransactionResponse._();
  @$core.override
  BroadcastTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionResponse>(create);
  static BroadcastTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxId() => $_clearField(1);
}

class FetchHistoryRequest extends $pb.GeneratedMessage {
  factory FetchHistoryRequest({
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  FetchHistoryRequest._();

  factory FetchHistoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchHistoryRequest copyWith(void Function(FetchHistoryRequest) updates) =>
      super.copyWith((message) => updates(message as FetchHistoryRequest))
          as FetchHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchHistoryRequest create() => FetchHistoryRequest._();
  @$core.override
  FetchHistoryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FetchHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchHistoryRequest>(create);
  static FetchHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class FetchHistoryResponse extends $pb.GeneratedMessage {
  factory FetchHistoryResponse({
    $core.Iterable<UtxoInfo>? utxos,
  }) {
    final result = create();
    if (utxos != null) result.utxos.addAll(utxos);
    return result;
  }

  FetchHistoryResponse._();

  factory FetchHistoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..pPM<UtxoInfo>(1, _omitFieldNames ? '' : 'utxos',
        subBuilder: UtxoInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchHistoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchHistoryResponse copyWith(void Function(FetchHistoryResponse) updates) =>
      super.copyWith((message) => updates(message as FetchHistoryResponse))
          as FetchHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchHistoryResponse create() => FetchHistoryResponse._();
  @$core.override
  FetchHistoryResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FetchHistoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchHistoryResponse>(create);
  static FetchHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UtxoInfo> get utxos => $_getList(0);
}

class SubscribeToHistoryRequest extends $pb.GeneratedMessage {
  factory SubscribeToHistoryRequest({
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  SubscribeToHistoryRequest._();

  factory SubscribeToHistoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscribeToHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscribeToHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToHistoryRequest copyWith(
          void Function(SubscribeToHistoryRequest) updates) =>
      super.copyWith((message) => updates(message as SubscribeToHistoryRequest))
          as SubscribeToHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeToHistoryRequest create() => SubscribeToHistoryRequest._();
  @$core.override
  SubscribeToHistoryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubscribeToHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscribeToHistoryRequest>(create);
  static SubscribeToHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class TransactionNotification extends $pb.GeneratedMessage {
  factory TransactionNotification({
    $core.String? txHash,
    $core.int? height,
    $core.Iterable<UtxoInfo>? addedUtxos,
    $core.Iterable<UtxoInfo>? spentUtxos,
  }) {
    final result = create();
    if (txHash != null) result.txHash = txHash;
    if (height != null) result.height = height;
    if (addedUtxos != null) result.addedUtxos.addAll(addedUtxos);
    if (spentUtxos != null) result.spentUtxos.addAll(spentUtxos);
    return result;
  }

  TransactionNotification._();

  factory TransactionNotification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionNotification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionNotification',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mpc_wallet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHash')
    ..aI(2, _omitFieldNames ? '' : 'height')
    ..pPM<UtxoInfo>(3, _omitFieldNames ? '' : 'addedUtxos',
        subBuilder: UtxoInfo.create)
    ..pPM<UtxoInfo>(4, _omitFieldNames ? '' : 'spentUtxos',
        subBuilder: UtxoInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionNotification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionNotification copyWith(
          void Function(TransactionNotification) updates) =>
      super.copyWith((message) => updates(message as TransactionNotification))
          as TransactionNotification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionNotification create() => TransactionNotification._();
  @$core.override
  TransactionNotification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionNotification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionNotification>(create);
  static TransactionNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int value) => $_setSignedInt32(1, value);
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
