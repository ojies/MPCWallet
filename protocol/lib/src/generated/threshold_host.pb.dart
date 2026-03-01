///
//  Generated code. Do not modify.
//  source: threshold_host.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class UserIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserIdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  UserIdRequest._() : super();
  factory UserIdRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory UserIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserIdRequest clone() => UserIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserIdRequest copyWith(void Function(UserIdRequest) updates) => super.copyWith((message) => updates(message as UserIdRequest)) as UserIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserIdRequest create() => UserIdRequest._();
  UserIdRequest createEmptyInstance() => create();
  static $pb.PbList<UserIdRequest> createRepeated() => $pb.PbList<UserIdRequest>();
  @$core.pragma('dart2js:noInline')
  static UserIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserIdRequest>(create);
  static UserIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class StringRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StringRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  StringRequest._() : super();
  factory StringRequest({
    $core.String? userId,
    $core.String? data,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory StringRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StringRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StringRequest clone() => StringRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StringRequest copyWith(void Function(StringRequest) updates) => super.copyWith((message) => updates(message as StringRequest)) as StringRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StringRequest create() => StringRequest._();
  StringRequest createEmptyInstance() => create();
  static $pb.PbList<StringRequest> createRepeated() => $pb.PbList<StringRequest>();
  @$core.pragma('dart2js:noInline')
  static StringRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StringRequest>(create);
  static StringRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class BytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BytesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BytesRequest._() : super();
  factory BytesRequest({
    $core.String? userId,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory BytesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BytesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BytesRequest clone() => BytesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BytesRequest copyWith(void Function(BytesRequest) updates) => super.copyWith((message) => updates(message as BytesRequest)) as BytesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BytesRequest create() => BytesRequest._();
  BytesRequest createEmptyInstance() => create();
  static $pb.PbList<BytesRequest> createRepeated() => $pb.PbList<BytesRequest>();
  @$core.pragma('dart2js:noInline')
  static BytesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BytesRequest>(create);
  static BytesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class StringResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StringResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  StringResponse._() : super();
  factory StringResponse({
    $core.String? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory StringResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StringResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StringResponse clone() => StringResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StringResponse copyWith(void Function(StringResponse) updates) => super.copyWith((message) => updates(message as StringResponse)) as StringResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StringResponse create() => StringResponse._();
  StringResponse createEmptyInstance() => create();
  static $pb.PbList<StringResponse> createRepeated() => $pb.PbList<StringResponse>();
  @$core.pragma('dart2js:noInline')
  static StringResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StringResponse>(create);
  static StringResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class BoolResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BoolResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  BoolResponse._() : super();
  factory BoolResponse({
    $core.bool? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory BoolResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoolResponse clone() => BoolResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoolResponse copyWith(void Function(BoolResponse) updates) => super.copyWith((message) => updates(message as BoolResponse)) as BoolResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoolResponse create() => BoolResponse._();
  BoolResponse createEmptyInstance() => create();
  static $pb.PbList<BoolResponse> createRepeated() => $pb.PbList<BoolResponse>();
  @$core.pragma('dart2js:noInline')
  static BoolResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolResponse>(create);
  static BoolResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class DkgPart1Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart1Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSigners', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minSigners', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretHex')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coefficientsJson')
    ..hasRequiredFields = false
  ;

  DkgPart1Request._() : super();
  factory DkgPart1Request({
    $core.String? userId,
    $core.int? maxSigners,
    $core.int? minSigners,
    $core.String? secretHex,
    $core.String? coefficientsJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (maxSigners != null) {
      _result.maxSigners = maxSigners;
    }
    if (minSigners != null) {
      _result.minSigners = minSigners;
    }
    if (secretHex != null) {
      _result.secretHex = secretHex;
    }
    if (coefficientsJson != null) {
      _result.coefficientsJson = coefficientsJson;
    }
    return _result;
  }
  factory DkgPart1Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart1Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart1Request clone() => DkgPart1Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart1Request copyWith(void Function(DkgPart1Request) updates) => super.copyWith((message) => updates(message as DkgPart1Request)) as DkgPart1Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart1Request create() => DkgPart1Request._();
  DkgPart1Request createEmptyInstance() => create();
  static $pb.PbList<DkgPart1Request> createRepeated() => $pb.PbList<DkgPart1Request>();
  @$core.pragma('dart2js:noInline')
  static DkgPart1Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart1Request>(create);
  static DkgPart1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxSigners => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxSigners($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxSigners() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxSigners() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get minSigners => $_getIZ(2);
  @$pb.TagNumber(3)
  set minSigners($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMinSigners() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinSigners() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secretHex => $_getSZ(3);
  @$pb.TagNumber(4)
  set secretHex($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecretHex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecretHex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get coefficientsJson => $_getSZ(4);
  @$pb.TagNumber(5)
  set coefficientsJson($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCoefficientsJson() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoefficientsJson() => clearField(5);
}

class DkgPart1Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart1Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackageJson')
    ..hasRequiredFields = false
  ;

  DkgPart1Response._() : super();
  factory DkgPart1Response({
    $core.String? round1PackageJson,
  }) {
    final _result = create();
    if (round1PackageJson != null) {
      _result.round1PackageJson = round1PackageJson;
    }
    return _result;
  }
  factory DkgPart1Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart1Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart1Response clone() => DkgPart1Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart1Response copyWith(void Function(DkgPart1Response) updates) => super.copyWith((message) => updates(message as DkgPart1Response)) as DkgPart1Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart1Response create() => DkgPart1Response._();
  DkgPart1Response createEmptyInstance() => create();
  static $pb.PbList<DkgPart1Response> createRepeated() => $pb.PbList<DkgPart1Response>();
  @$core.pragma('dart2js:noInline')
  static DkgPart1Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart1Response>(create);
  static DkgPart1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get round1PackageJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set round1PackageJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRound1PackageJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound1PackageJson() => clearField(1);
}

class DkgPart2Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart2Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackagesJson')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverIdsJson')
    ..hasRequiredFields = false
  ;

  DkgPart2Request._() : super();
  factory DkgPart2Request({
    $core.String? userId,
    $core.String? round1PackagesJson,
    $core.String? receiverIdsJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (round1PackagesJson != null) {
      _result.round1PackagesJson = round1PackagesJson;
    }
    if (receiverIdsJson != null) {
      _result.receiverIdsJson = receiverIdsJson;
    }
    return _result;
  }
  factory DkgPart2Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart2Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart2Request clone() => DkgPart2Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart2Request copyWith(void Function(DkgPart2Request) updates) => super.copyWith((message) => updates(message as DkgPart2Request)) as DkgPart2Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart2Request create() => DkgPart2Request._();
  DkgPart2Request createEmptyInstance() => create();
  static $pb.PbList<DkgPart2Request> createRepeated() => $pb.PbList<DkgPart2Request>();
  @$core.pragma('dart2js:noInline')
  static DkgPart2Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart2Request>(create);
  static DkgPart2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get round1PackagesJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set round1PackagesJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRound1PackagesJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound1PackagesJson() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get receiverIdsJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiverIdsJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiverIdsJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverIdsJson() => clearField(3);
}

class DkgPart2Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart2Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round2PackagesJson')
    ..hasRequiredFields = false
  ;

  DkgPart2Response._() : super();
  factory DkgPart2Response({
    $core.String? round2PackagesJson,
  }) {
    final _result = create();
    if (round2PackagesJson != null) {
      _result.round2PackagesJson = round2PackagesJson;
    }
    return _result;
  }
  factory DkgPart2Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart2Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart2Response clone() => DkgPart2Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart2Response copyWith(void Function(DkgPart2Response) updates) => super.copyWith((message) => updates(message as DkgPart2Response)) as DkgPart2Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart2Response create() => DkgPart2Response._();
  DkgPart2Response createEmptyInstance() => create();
  static $pb.PbList<DkgPart2Response> createRepeated() => $pb.PbList<DkgPart2Response>();
  @$core.pragma('dart2js:noInline')
  static DkgPart2Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart2Response>(create);
  static DkgPart2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get round2PackagesJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set round2PackagesJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRound2PackagesJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound2PackagesJson() => clearField(1);
}

class DkgPart3Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart3Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackagesJson')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round2PackagesJson')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverIdsJson')
    ..hasRequiredFields = false
  ;

  DkgPart3Request._() : super();
  factory DkgPart3Request({
    $core.String? userId,
    $core.String? round1PackagesJson,
    $core.String? round2PackagesJson,
    $core.String? receiverIdsJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (round1PackagesJson != null) {
      _result.round1PackagesJson = round1PackagesJson;
    }
    if (round2PackagesJson != null) {
      _result.round2PackagesJson = round2PackagesJson;
    }
    if (receiverIdsJson != null) {
      _result.receiverIdsJson = receiverIdsJson;
    }
    return _result;
  }
  factory DkgPart3Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart3Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart3Request clone() => DkgPart3Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart3Request copyWith(void Function(DkgPart3Request) updates) => super.copyWith((message) => updates(message as DkgPart3Request)) as DkgPart3Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart3Request create() => DkgPart3Request._();
  DkgPart3Request createEmptyInstance() => create();
  static $pb.PbList<DkgPart3Request> createRepeated() => $pb.PbList<DkgPart3Request>();
  @$core.pragma('dart2js:noInline')
  static DkgPart3Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart3Request>(create);
  static DkgPart3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get round1PackagesJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set round1PackagesJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRound1PackagesJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound1PackagesJson() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get round2PackagesJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set round2PackagesJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound2PackagesJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound2PackagesJson() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get receiverIdsJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiverIdsJson($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceiverIdsJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverIdsJson() => clearField(4);
}

class DkgPart3ReceiveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart3ReceiveRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'myIdHex')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dealerR1Json')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sharesJson')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minSigners', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSigners', $pb.PbFieldType.OU3)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allIdsJson')
    ..hasRequiredFields = false
  ;

  DkgPart3ReceiveRequest._() : super();
  factory DkgPart3ReceiveRequest({
    $core.String? userId,
    $core.String? myIdHex,
    $core.String? dealerR1Json,
    $core.String? sharesJson,
    $core.int? minSigners,
    $core.int? maxSigners,
    $core.String? allIdsJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (myIdHex != null) {
      _result.myIdHex = myIdHex;
    }
    if (dealerR1Json != null) {
      _result.dealerR1Json = dealerR1Json;
    }
    if (sharesJson != null) {
      _result.sharesJson = sharesJson;
    }
    if (minSigners != null) {
      _result.minSigners = minSigners;
    }
    if (maxSigners != null) {
      _result.maxSigners = maxSigners;
    }
    if (allIdsJson != null) {
      _result.allIdsJson = allIdsJson;
    }
    return _result;
  }
  factory DkgPart3ReceiveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart3ReceiveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart3ReceiveRequest clone() => DkgPart3ReceiveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart3ReceiveRequest copyWith(void Function(DkgPart3ReceiveRequest) updates) => super.copyWith((message) => updates(message as DkgPart3ReceiveRequest)) as DkgPart3ReceiveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart3ReceiveRequest create() => DkgPart3ReceiveRequest._();
  DkgPart3ReceiveRequest createEmptyInstance() => create();
  static $pb.PbList<DkgPart3ReceiveRequest> createRepeated() => $pb.PbList<DkgPart3ReceiveRequest>();
  @$core.pragma('dart2js:noInline')
  static DkgPart3ReceiveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart3ReceiveRequest>(create);
  static DkgPart3ReceiveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get myIdHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set myIdHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMyIdHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyIdHex() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dealerR1Json => $_getSZ(2);
  @$pb.TagNumber(3)
  set dealerR1Json($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDealerR1Json() => $_has(2);
  @$pb.TagNumber(3)
  void clearDealerR1Json() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sharesJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set sharesJson($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSharesJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearSharesJson() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get minSigners => $_getIZ(4);
  @$pb.TagNumber(5)
  set minSigners($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinSigners() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinSigners() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxSigners => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxSigners($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxSigners() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxSigners() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get allIdsJson => $_getSZ(6);
  @$pb.TagNumber(7)
  set allIdsJson($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAllIdsJson() => $_has(6);
  @$pb.TagNumber(7)
  void clearAllIdsJson() => clearField(7);
}

class DkgPart3Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgPart3Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyPackageJson')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKeyPackageJson')
    ..hasRequiredFields = false
  ;

  DkgPart3Response._() : super();
  factory DkgPart3Response({
    $core.String? keyPackageJson,
    $core.String? publicKeyPackageJson,
  }) {
    final _result = create();
    if (keyPackageJson != null) {
      _result.keyPackageJson = keyPackageJson;
    }
    if (publicKeyPackageJson != null) {
      _result.publicKeyPackageJson = publicKeyPackageJson;
    }
    return _result;
  }
  factory DkgPart3Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgPart3Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgPart3Response clone() => DkgPart3Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgPart3Response copyWith(void Function(DkgPart3Response) updates) => super.copyWith((message) => updates(message as DkgPart3Response)) as DkgPart3Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgPart3Response create() => DkgPart3Response._();
  DkgPart3Response createEmptyInstance() => create();
  static $pb.PbList<DkgPart3Response> createRepeated() => $pb.PbList<DkgPart3Response>();
  @$core.pragma('dart2js:noInline')
  static DkgPart3Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgPart3Response>(create);
  static DkgPart3Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyPackageJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyPackageJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKeyPackageJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyPackageJson() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKeyPackageJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKeyPackageJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKeyPackageJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKeyPackageJson() => clearField(2);
}

class DkgRefreshPart1Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgRefreshPart1Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idHex')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSigners', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minSigners', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seed', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DkgRefreshPart1Request._() : super();
  factory DkgRefreshPart1Request({
    $core.String? userId,
    $core.String? idHex,
    $core.int? maxSigners,
    $core.int? minSigners,
    $core.List<$core.int>? seed,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (idHex != null) {
      _result.idHex = idHex;
    }
    if (maxSigners != null) {
      _result.maxSigners = maxSigners;
    }
    if (minSigners != null) {
      _result.minSigners = minSigners;
    }
    if (seed != null) {
      _result.seed = seed;
    }
    return _result;
  }
  factory DkgRefreshPart1Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgRefreshPart1Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgRefreshPart1Request clone() => DkgRefreshPart1Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgRefreshPart1Request copyWith(void Function(DkgRefreshPart1Request) updates) => super.copyWith((message) => updates(message as DkgRefreshPart1Request)) as DkgRefreshPart1Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart1Request create() => DkgRefreshPart1Request._();
  DkgRefreshPart1Request createEmptyInstance() => create();
  static $pb.PbList<DkgRefreshPart1Request> createRepeated() => $pb.PbList<DkgRefreshPart1Request>();
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart1Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgRefreshPart1Request>(create);
  static DkgRefreshPart1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get idHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set idHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdHex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxSigners => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxSigners($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxSigners() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxSigners() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get minSigners => $_getIZ(3);
  @$pb.TagNumber(4)
  set minSigners($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinSigners() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinSigners() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get seed => $_getN(4);
  @$pb.TagNumber(5)
  set seed($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSeed() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeed() => clearField(5);
}

class DkgRefreshPart1Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgRefreshPart1Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackageJson')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coefficientsJson')
    ..hasRequiredFields = false
  ;

  DkgRefreshPart1Response._() : super();
  factory DkgRefreshPart1Response({
    $core.String? round1PackageJson,
    $core.String? coefficientsJson,
  }) {
    final _result = create();
    if (round1PackageJson != null) {
      _result.round1PackageJson = round1PackageJson;
    }
    if (coefficientsJson != null) {
      _result.coefficientsJson = coefficientsJson;
    }
    return _result;
  }
  factory DkgRefreshPart1Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgRefreshPart1Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgRefreshPart1Response clone() => DkgRefreshPart1Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgRefreshPart1Response copyWith(void Function(DkgRefreshPart1Response) updates) => super.copyWith((message) => updates(message as DkgRefreshPart1Response)) as DkgRefreshPart1Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart1Response create() => DkgRefreshPart1Response._();
  DkgRefreshPart1Response createEmptyInstance() => create();
  static $pb.PbList<DkgRefreshPart1Response> createRepeated() => $pb.PbList<DkgRefreshPart1Response>();
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart1Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgRefreshPart1Response>(create);
  static DkgRefreshPart1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get round1PackageJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set round1PackageJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRound1PackageJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound1PackageJson() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get coefficientsJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set coefficientsJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCoefficientsJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoefficientsJson() => clearField(2);
}

class DkgRefreshPart2Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgRefreshPart2Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackagesJson')
    ..hasRequiredFields = false
  ;

  DkgRefreshPart2Request._() : super();
  factory DkgRefreshPart2Request({
    $core.String? userId,
    $core.String? round1PackagesJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (round1PackagesJson != null) {
      _result.round1PackagesJson = round1PackagesJson;
    }
    return _result;
  }
  factory DkgRefreshPart2Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgRefreshPart2Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgRefreshPart2Request clone() => DkgRefreshPart2Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgRefreshPart2Request copyWith(void Function(DkgRefreshPart2Request) updates) => super.copyWith((message) => updates(message as DkgRefreshPart2Request)) as DkgRefreshPart2Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart2Request create() => DkgRefreshPart2Request._();
  DkgRefreshPart2Request createEmptyInstance() => create();
  static $pb.PbList<DkgRefreshPart2Request> createRepeated() => $pb.PbList<DkgRefreshPart2Request>();
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart2Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgRefreshPart2Request>(create);
  static DkgRefreshPart2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get round1PackagesJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set round1PackagesJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRound1PackagesJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound1PackagesJson() => clearField(2);
}

class DkgRefreshPart2Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgRefreshPart2Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round2PackagesJson')
    ..hasRequiredFields = false
  ;

  DkgRefreshPart2Response._() : super();
  factory DkgRefreshPart2Response({
    $core.String? round2PackagesJson,
  }) {
    final _result = create();
    if (round2PackagesJson != null) {
      _result.round2PackagesJson = round2PackagesJson;
    }
    return _result;
  }
  factory DkgRefreshPart2Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgRefreshPart2Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgRefreshPart2Response clone() => DkgRefreshPart2Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgRefreshPart2Response copyWith(void Function(DkgRefreshPart2Response) updates) => super.copyWith((message) => updates(message as DkgRefreshPart2Response)) as DkgRefreshPart2Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart2Response create() => DkgRefreshPart2Response._();
  DkgRefreshPart2Response createEmptyInstance() => create();
  static $pb.PbList<DkgRefreshPart2Response> createRepeated() => $pb.PbList<DkgRefreshPart2Response>();
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart2Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgRefreshPart2Response>(create);
  static DkgRefreshPart2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get round2PackagesJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set round2PackagesJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRound2PackagesJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound2PackagesJson() => clearField(1);
}

class DkgRefreshPart3Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DkgRefreshPart3Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round1PackagesJson')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round2PackagesJson')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldPkpJson')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldKpJson')
    ..hasRequiredFields = false
  ;

  DkgRefreshPart3Request._() : super();
  factory DkgRefreshPart3Request({
    $core.String? userId,
    $core.String? round1PackagesJson,
    $core.String? round2PackagesJson,
    $core.String? oldPkpJson,
    $core.String? oldKpJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (round1PackagesJson != null) {
      _result.round1PackagesJson = round1PackagesJson;
    }
    if (round2PackagesJson != null) {
      _result.round2PackagesJson = round2PackagesJson;
    }
    if (oldPkpJson != null) {
      _result.oldPkpJson = oldPkpJson;
    }
    if (oldKpJson != null) {
      _result.oldKpJson = oldKpJson;
    }
    return _result;
  }
  factory DkgRefreshPart3Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DkgRefreshPart3Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DkgRefreshPart3Request clone() => DkgRefreshPart3Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DkgRefreshPart3Request copyWith(void Function(DkgRefreshPart3Request) updates) => super.copyWith((message) => updates(message as DkgRefreshPart3Request)) as DkgRefreshPart3Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart3Request create() => DkgRefreshPart3Request._();
  DkgRefreshPart3Request createEmptyInstance() => create();
  static $pb.PbList<DkgRefreshPart3Request> createRepeated() => $pb.PbList<DkgRefreshPart3Request>();
  @$core.pragma('dart2js:noInline')
  static DkgRefreshPart3Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DkgRefreshPart3Request>(create);
  static DkgRefreshPart3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get round1PackagesJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set round1PackagesJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRound1PackagesJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound1PackagesJson() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get round2PackagesJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set round2PackagesJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRound2PackagesJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound2PackagesJson() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get oldPkpJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set oldPkpJson($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOldPkpJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearOldPkpJson() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get oldKpJson => $_getSZ(4);
  @$pb.TagNumber(5)
  set oldKpJson($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOldKpJson() => $_has(4);
  @$pb.TagNumber(5)
  void clearOldKpJson() => clearField(5);
}

class NewNonceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewNonceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretHex')
    ..hasRequiredFields = false
  ;

  NewNonceRequest._() : super();
  factory NewNonceRequest({
    $core.String? userId,
    $core.String? secretHex,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (secretHex != null) {
      _result.secretHex = secretHex;
    }
    return _result;
  }
  factory NewNonceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewNonceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewNonceRequest clone() => NewNonceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewNonceRequest copyWith(void Function(NewNonceRequest) updates) => super.copyWith((message) => updates(message as NewNonceRequest)) as NewNonceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewNonceRequest create() => NewNonceRequest._();
  NewNonceRequest createEmptyInstance() => create();
  static $pb.PbList<NewNonceRequest> createRepeated() => $pb.PbList<NewNonceRequest>();
  @$core.pragma('dart2js:noInline')
  static NewNonceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewNonceRequest>(create);
  static NewNonceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secretHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set secretHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecretHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretHex() => clearField(2);
}

class NewNonceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewNonceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commitmentsJson')
    ..hasRequiredFields = false
  ;

  NewNonceResponse._() : super();
  factory NewNonceResponse({
    $core.String? commitmentsJson,
  }) {
    final _result = create();
    if (commitmentsJson != null) {
      _result.commitmentsJson = commitmentsJson;
    }
    return _result;
  }
  factory NewNonceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewNonceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewNonceResponse clone() => NewNonceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewNonceResponse copyWith(void Function(NewNonceResponse) updates) => super.copyWith((message) => updates(message as NewNonceResponse)) as NewNonceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewNonceResponse create() => NewNonceResponse._();
  NewNonceResponse createEmptyInstance() => create();
  static $pb.PbList<NewNonceResponse> createRepeated() => $pb.PbList<NewNonceResponse>();
  @$core.pragma('dart2js:noInline')
  static NewNonceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewNonceResponse>(create);
  static NewNonceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commitmentsJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set commitmentsJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommitmentsJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommitmentsJson() => clearField(1);
}

class FrostSignRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FrostSignRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signingPackageJson')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyPackageJson')
    ..hasRequiredFields = false
  ;

  FrostSignRequest._() : super();
  factory FrostSignRequest({
    $core.String? userId,
    $core.String? signingPackageJson,
    $core.String? keyPackageJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (signingPackageJson != null) {
      _result.signingPackageJson = signingPackageJson;
    }
    if (keyPackageJson != null) {
      _result.keyPackageJson = keyPackageJson;
    }
    return _result;
  }
  factory FrostSignRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FrostSignRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FrostSignRequest clone() => FrostSignRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FrostSignRequest copyWith(void Function(FrostSignRequest) updates) => super.copyWith((message) => updates(message as FrostSignRequest)) as FrostSignRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FrostSignRequest create() => FrostSignRequest._();
  FrostSignRequest createEmptyInstance() => create();
  static $pb.PbList<FrostSignRequest> createRepeated() => $pb.PbList<FrostSignRequest>();
  @$core.pragma('dart2js:noInline')
  static FrostSignRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrostSignRequest>(create);
  static FrostSignRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signingPackageJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set signingPackageJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSigningPackageJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningPackageJson() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get keyPackageJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set keyPackageJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKeyPackageJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyPackageJson() => clearField(3);
}

class FrostAggregateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FrostAggregateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signingPackageJson')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sharesJson')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKeyPackageJson')
    ..hasRequiredFields = false
  ;

  FrostAggregateRequest._() : super();
  factory FrostAggregateRequest({
    $core.String? userId,
    $core.String? signingPackageJson,
    $core.String? sharesJson,
    $core.String? publicKeyPackageJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (signingPackageJson != null) {
      _result.signingPackageJson = signingPackageJson;
    }
    if (sharesJson != null) {
      _result.sharesJson = sharesJson;
    }
    if (publicKeyPackageJson != null) {
      _result.publicKeyPackageJson = publicKeyPackageJson;
    }
    return _result;
  }
  factory FrostAggregateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FrostAggregateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FrostAggregateRequest clone() => FrostAggregateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FrostAggregateRequest copyWith(void Function(FrostAggregateRequest) updates) => super.copyWith((message) => updates(message as FrostAggregateRequest)) as FrostAggregateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FrostAggregateRequest create() => FrostAggregateRequest._();
  FrostAggregateRequest createEmptyInstance() => create();
  static $pb.PbList<FrostAggregateRequest> createRepeated() => $pb.PbList<FrostAggregateRequest>();
  @$core.pragma('dart2js:noInline')
  static FrostAggregateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrostAggregateRequest>(create);
  static FrostAggregateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signingPackageJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set signingPackageJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSigningPackageJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningPackageJson() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sharesJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set sharesJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSharesJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearSharesJson() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publicKeyPackageJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicKeyPackageJson($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublicKeyPackageJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKeyPackageJson() => clearField(4);
}

class KeyTweakRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeyTweakRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jsonData')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'merkleRoot', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  KeyTweakRequest._() : super();
  factory KeyTweakRequest({
    $core.String? userId,
    $core.String? jsonData,
    $core.List<$core.int>? merkleRoot,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (jsonData != null) {
      _result.jsonData = jsonData;
    }
    if (merkleRoot != null) {
      _result.merkleRoot = merkleRoot;
    }
    return _result;
  }
  factory KeyTweakRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyTweakRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyTweakRequest clone() => KeyTweakRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyTweakRequest copyWith(void Function(KeyTweakRequest) updates) => super.copyWith((message) => updates(message as KeyTweakRequest)) as KeyTweakRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyTweakRequest create() => KeyTweakRequest._();
  KeyTweakRequest createEmptyInstance() => create();
  static $pb.PbList<KeyTweakRequest> createRepeated() => $pb.PbList<KeyTweakRequest>();
  @$core.pragma('dart2js:noInline')
  static KeyTweakRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyTweakRequest>(create);
  static KeyTweakRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get jsonData => $_getSZ(1);
  @$pb.TagNumber(2)
  set jsonData($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJsonData() => $_has(1);
  @$pb.TagNumber(2)
  void clearJsonData() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get merkleRoot => $_getN(2);
  @$pb.TagNumber(3)
  set merkleRoot($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMerkleRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearMerkleRoot() => clearField(3);
}

class AuthSignerCreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthSignerCreateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretHex')
    ..hasRequiredFields = false
  ;

  AuthSignerCreateRequest._() : super();
  factory AuthSignerCreateRequest({
    $core.String? userId,
    $core.String? secretHex,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (secretHex != null) {
      _result.secretHex = secretHex;
    }
    return _result;
  }
  factory AuthSignerCreateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSignerCreateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthSignerCreateRequest clone() => AuthSignerCreateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthSignerCreateRequest copyWith(void Function(AuthSignerCreateRequest) updates) => super.copyWith((message) => updates(message as AuthSignerCreateRequest)) as AuthSignerCreateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSignerCreateRequest create() => AuthSignerCreateRequest._();
  AuthSignerCreateRequest createEmptyInstance() => create();
  static $pb.PbList<AuthSignerCreateRequest> createRepeated() => $pb.PbList<AuthSignerCreateRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthSignerCreateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSignerCreateRequest>(create);
  static AuthSignerCreateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secretHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set secretHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecretHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretHex() => clearField(2);
}

class AuthSignerCreateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthSignerCreateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKeyHex')
    ..hasRequiredFields = false
  ;

  AuthSignerCreateResponse._() : super();
  factory AuthSignerCreateResponse({
    $core.String? publicKeyHex,
  }) {
    final _result = create();
    if (publicKeyHex != null) {
      _result.publicKeyHex = publicKeyHex;
    }
    return _result;
  }
  factory AuthSignerCreateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSignerCreateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthSignerCreateResponse clone() => AuthSignerCreateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthSignerCreateResponse copyWith(void Function(AuthSignerCreateResponse) updates) => super.copyWith((message) => updates(message as AuthSignerCreateResponse)) as AuthSignerCreateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSignerCreateResponse create() => AuthSignerCreateResponse._();
  AuthSignerCreateResponse createEmptyInstance() => create();
  static $pb.PbList<AuthSignerCreateResponse> createRepeated() => $pb.PbList<AuthSignerCreateResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthSignerCreateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSignerCreateResponse>(create);
  static AuthSignerCreateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKeyHex => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKeyHex($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKeyHex() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKeyHex() => clearField(1);
}

class AuthSignerSignRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthSignerSignRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AuthSignerSignRequest._() : super();
  factory AuthSignerSignRequest({
    $core.String? userId,
    $core.List<$core.int>? message,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory AuthSignerSignRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthSignerSignRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthSignerSignRequest clone() => AuthSignerSignRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthSignerSignRequest copyWith(void Function(AuthSignerSignRequest) updates) => super.copyWith((message) => updates(message as AuthSignerSignRequest)) as AuthSignerSignRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthSignerSignRequest create() => AuthSignerSignRequest._();
  AuthSignerSignRequest createEmptyInstance() => create();
  static $pb.PbList<AuthSignerSignRequest> createRepeated() => $pb.PbList<AuthSignerSignRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthSignerSignRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthSignerSignRequest>(create);
  static AuthSignerSignRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class VerifySignatureRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifySignatureRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pkHex')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', $pb.PbFieldType.OY)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sigHex')
    ..hasRequiredFields = false
  ;

  VerifySignatureRequest._() : super();
  factory VerifySignatureRequest({
    $core.String? userId,
    $core.String? pkHex,
    $core.List<$core.int>? message,
    $core.String? sigHex,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (pkHex != null) {
      _result.pkHex = pkHex;
    }
    if (message != null) {
      _result.message = message;
    }
    if (sigHex != null) {
      _result.sigHex = sigHex;
    }
    return _result;
  }
  factory VerifySignatureRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifySignatureRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifySignatureRequest clone() => VerifySignatureRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifySignatureRequest copyWith(void Function(VerifySignatureRequest) updates) => super.copyWith((message) => updates(message as VerifySignatureRequest)) as VerifySignatureRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifySignatureRequest create() => VerifySignatureRequest._();
  VerifySignatureRequest createEmptyInstance() => create();
  static $pb.PbList<VerifySignatureRequest> createRepeated() => $pb.PbList<VerifySignatureRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifySignatureRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifySignatureRequest>(create);
  static VerifySignatureRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pkHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set pkHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPkHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkHex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sigHex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sigHex($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSigHex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSigHex() => clearField(4);
}

class GenerateCoefficientsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenerateCoefficientsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seed', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GenerateCoefficientsRequest._() : super();
  factory GenerateCoefficientsRequest({
    $core.String? userId,
    $core.int? count,
    $core.List<$core.int>? seed,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (count != null) {
      _result.count = count;
    }
    if (seed != null) {
      _result.seed = seed;
    }
    return _result;
  }
  factory GenerateCoefficientsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateCoefficientsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateCoefficientsRequest clone() => GenerateCoefficientsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateCoefficientsRequest copyWith(void Function(GenerateCoefficientsRequest) updates) => super.copyWith((message) => updates(message as GenerateCoefficientsRequest)) as GenerateCoefficientsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateCoefficientsRequest create() => GenerateCoefficientsRequest._();
  GenerateCoefficientsRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateCoefficientsRequest> createRepeated() => $pb.PbList<GenerateCoefficientsRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateCoefficientsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateCoefficientsRequest>(create);
  static GenerateCoefficientsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get seed => $_getN(2);
  @$pb.TagNumber(3)
  set seed($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeed() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeed() => clearField(3);
}

class EvaluatePolynomialRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EvaluatePolynomialRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idHex')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coefficientsJson')
    ..hasRequiredFields = false
  ;

  EvaluatePolynomialRequest._() : super();
  factory EvaluatePolynomialRequest({
    $core.String? userId,
    $core.String? idHex,
    $core.String? coefficientsJson,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (idHex != null) {
      _result.idHex = idHex;
    }
    if (coefficientsJson != null) {
      _result.coefficientsJson = coefficientsJson;
    }
    return _result;
  }
  factory EvaluatePolynomialRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EvaluatePolynomialRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EvaluatePolynomialRequest clone() => EvaluatePolynomialRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EvaluatePolynomialRequest copyWith(void Function(EvaluatePolynomialRequest) updates) => super.copyWith((message) => updates(message as EvaluatePolynomialRequest)) as EvaluatePolynomialRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EvaluatePolynomialRequest create() => EvaluatePolynomialRequest._();
  EvaluatePolynomialRequest createEmptyInstance() => create();
  static $pb.PbList<EvaluatePolynomialRequest> createRepeated() => $pb.PbList<EvaluatePolynomialRequest>();
  @$core.pragma('dart2js:noInline')
  static EvaluatePolynomialRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EvaluatePolynomialRequest>(create);
  static EvaluatePolynomialRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get idHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set idHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdHex() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get coefficientsJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set coefficientsJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCoefficientsJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoefficientsJson() => clearField(3);
}

class ElemBaseMulRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ElemBaseMulRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'threshold_host'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scalarHex')
    ..hasRequiredFields = false
  ;

  ElemBaseMulRequest._() : super();
  factory ElemBaseMulRequest({
    $core.String? userId,
    $core.String? scalarHex,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (scalarHex != null) {
      _result.scalarHex = scalarHex;
    }
    return _result;
  }
  factory ElemBaseMulRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ElemBaseMulRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ElemBaseMulRequest clone() => ElemBaseMulRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ElemBaseMulRequest copyWith(void Function(ElemBaseMulRequest) updates) => super.copyWith((message) => updates(message as ElemBaseMulRequest)) as ElemBaseMulRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ElemBaseMulRequest create() => ElemBaseMulRequest._();
  ElemBaseMulRequest createEmptyInstance() => create();
  static $pb.PbList<ElemBaseMulRequest> createRepeated() => $pb.PbList<ElemBaseMulRequest>();
  @$core.pragma('dart2js:noInline')
  static ElemBaseMulRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ElemBaseMulRequest>(create);
  static ElemBaseMulRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get scalarHex => $_getSZ(1);
  @$pb.TagNumber(2)
  set scalarHex($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScalarHex() => $_has(1);
  @$pb.TagNumber(2)
  void clearScalarHex() => clearField(2);
}

