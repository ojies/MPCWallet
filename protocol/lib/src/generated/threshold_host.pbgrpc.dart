///
//  Generated code. Do not modify.
//  source: threshold_host.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'threshold_host.pb.dart' as $0;
export 'threshold_host.pb.dart';

class ThresholdServiceClient extends $grpc.Client {
  static final _$dkgPart1 =
      $grpc.ClientMethod<$0.DkgPart1Request, $0.DkgPart1Response>(
          '/threshold_host.ThresholdService/DkgPart1',
          ($0.DkgPart1Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgPart1Response.fromBuffer(value));
  static final _$dkgPart2 =
      $grpc.ClientMethod<$0.DkgPart2Request, $0.DkgPart2Response>(
          '/threshold_host.ThresholdService/DkgPart2',
          ($0.DkgPart2Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgPart2Response.fromBuffer(value));
  static final _$dkgPart3 =
      $grpc.ClientMethod<$0.DkgPart3Request, $0.DkgPart3Response>(
          '/threshold_host.ThresholdService/DkgPart3',
          ($0.DkgPart3Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgPart3Response.fromBuffer(value));
  static final _$dkgPart3Receive =
      $grpc.ClientMethod<$0.DkgPart3ReceiveRequest, $0.DkgPart3Response>(
          '/threshold_host.ThresholdService/DkgPart3Receive',
          ($0.DkgPart3ReceiveRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgPart3Response.fromBuffer(value));
  static final _$dkgRefreshPart1 =
      $grpc.ClientMethod<$0.DkgRefreshPart1Request, $0.DkgRefreshPart1Response>(
          '/threshold_host.ThresholdService/DkgRefreshPart1',
          ($0.DkgRefreshPart1Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgRefreshPart1Response.fromBuffer(value));
  static final _$dkgRefreshPart2 =
      $grpc.ClientMethod<$0.DkgRefreshPart2Request, $0.DkgRefreshPart2Response>(
          '/threshold_host.ThresholdService/DkgRefreshPart2',
          ($0.DkgRefreshPart2Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgRefreshPart2Response.fromBuffer(value));
  static final _$dkgRefreshPart3 =
      $grpc.ClientMethod<$0.DkgRefreshPart3Request, $0.DkgPart3Response>(
          '/threshold_host.ThresholdService/DkgRefreshPart3',
          ($0.DkgRefreshPart3Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DkgPart3Response.fromBuffer(value));
  static final _$newNonce =
      $grpc.ClientMethod<$0.NewNonceRequest, $0.NewNonceResponse>(
          '/threshold_host.ThresholdService/NewNonce',
          ($0.NewNonceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NewNonceResponse.fromBuffer(value));
  static final _$frostSign =
      $grpc.ClientMethod<$0.FrostSignRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/FrostSign',
          ($0.FrostSignRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$frostAggregate =
      $grpc.ClientMethod<$0.FrostAggregateRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/FrostAggregate',
          ($0.FrostAggregateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$keyPackageTweak =
      $grpc.ClientMethod<$0.KeyTweakRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/KeyPackageTweak',
          ($0.KeyTweakRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$pubKeyPackageTweak =
      $grpc.ClientMethod<$0.KeyTweakRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/PubKeyPackageTweak',
          ($0.KeyTweakRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$keyPackageIntoEvenY =
      $grpc.ClientMethod<$0.StringRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/KeyPackageIntoEvenY',
          ($0.StringRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$pubKeyPackageIntoEvenY =
      $grpc.ClientMethod<$0.StringRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/PubKeyPackageIntoEvenY',
          ($0.StringRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$authSignerCreate = $grpc.ClientMethod<
          $0.AuthSignerCreateRequest, $0.AuthSignerCreateResponse>(
      '/threshold_host.ThresholdService/AuthSignerCreate',
      ($0.AuthSignerCreateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.AuthSignerCreateResponse.fromBuffer(value));
  static final _$authSignerSign =
      $grpc.ClientMethod<$0.AuthSignerSignRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/AuthSignerSign',
          ($0.AuthSignerSignRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$authSignerPublicKey =
      $grpc.ClientMethod<$0.UserIdRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/AuthSignerPublicKey',
          ($0.UserIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$verifySchnorrSignature =
      $grpc.ClientMethod<$0.VerifySignatureRequest, $0.BoolResponse>(
          '/threshold_host.ThresholdService/VerifySchnorrSignature',
          ($0.VerifySignatureRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BoolResponse.fromBuffer(value));
  static final _$identifierDerive =
      $grpc.ClientMethod<$0.BytesRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/IdentifierDerive',
          ($0.BytesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$identifierFromBigint =
      $grpc.ClientMethod<$0.StringRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/IdentifierFromBigint',
          ($0.StringRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$generateCoefficients =
      $grpc.ClientMethod<$0.GenerateCoefficientsRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/GenerateCoefficients',
          ($0.GenerateCoefficientsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$evaluatePolynomial =
      $grpc.ClientMethod<$0.EvaluatePolynomialRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/EvaluatePolynomial',
          ($0.EvaluatePolynomialRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$modNRandom =
      $grpc.ClientMethod<$0.UserIdRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/ModNRandom',
          ($0.UserIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$elemBaseMul =
      $grpc.ClientMethod<$0.ElemBaseMulRequest, $0.StringResponse>(
          '/threshold_host.ThresholdService/ElemBaseMul',
          ($0.ElemBaseMulRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResponse.fromBuffer(value));
  static final _$destroyUser = $grpc.ClientMethod<$0.UserIdRequest, $0.Empty>(
      '/threshold_host.ThresholdService/DestroyUser',
      ($0.UserIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  ThresholdServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.DkgPart1Response> dkgPart1($0.DkgPart1Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgPart1, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgPart2Response> dkgPart2($0.DkgPart2Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgPart2, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgPart3Response> dkgPart3($0.DkgPart3Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgPart3, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgPart3Response> dkgPart3Receive(
      $0.DkgPart3ReceiveRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgPart3Receive, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgRefreshPart1Response> dkgRefreshPart1(
      $0.DkgRefreshPart1Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgRefreshPart1, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgRefreshPart2Response> dkgRefreshPart2(
      $0.DkgRefreshPart2Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgRefreshPart2, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgPart3Response> dkgRefreshPart3(
      $0.DkgRefreshPart3Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dkgRefreshPart3, request, options: options);
  }

  $grpc.ResponseFuture<$0.NewNonceResponse> newNonce($0.NewNonceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newNonce, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> frostSign($0.FrostSignRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$frostSign, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> frostAggregate(
      $0.FrostAggregateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$frostAggregate, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> keyPackageTweak(
      $0.KeyTweakRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$keyPackageTweak, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> pubKeyPackageTweak(
      $0.KeyTweakRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pubKeyPackageTweak, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> keyPackageIntoEvenY(
      $0.StringRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$keyPackageIntoEvenY, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> pubKeyPackageIntoEvenY(
      $0.StringRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pubKeyPackageIntoEvenY, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.AuthSignerCreateResponse> authSignerCreate(
      $0.AuthSignerCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authSignerCreate, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> authSignerSign(
      $0.AuthSignerSignRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authSignerSign, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> authSignerPublicKey(
      $0.UserIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authSignerPublicKey, request, options: options);
  }

  $grpc.ResponseFuture<$0.BoolResponse> verifySchnorrSignature(
      $0.VerifySignatureRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifySchnorrSignature, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> identifierDerive(
      $0.BytesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$identifierDerive, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> identifierFromBigint(
      $0.StringRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$identifierFromBigint, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> generateCoefficients(
      $0.GenerateCoefficientsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCoefficients, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> evaluatePolynomial(
      $0.EvaluatePolynomialRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$evaluatePolynomial, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> modNRandom($0.UserIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$modNRandom, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringResponse> elemBaseMul(
      $0.ElemBaseMulRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$elemBaseMul, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> destroyUser($0.UserIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$destroyUser, request, options: options);
  }
}

abstract class ThresholdServiceBase extends $grpc.Service {
  $core.String get $name => 'threshold_host.ThresholdService';

  ThresholdServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DkgPart1Request, $0.DkgPart1Response>(
        'DkgPart1',
        dkgPart1_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgPart1Request.fromBuffer(value),
        ($0.DkgPart1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgPart2Request, $0.DkgPart2Response>(
        'DkgPart2',
        dkgPart2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgPart2Request.fromBuffer(value),
        ($0.DkgPart2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgPart3Request, $0.DkgPart3Response>(
        'DkgPart3',
        dkgPart3_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgPart3Request.fromBuffer(value),
        ($0.DkgPart3Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DkgPart3ReceiveRequest, $0.DkgPart3Response>(
            'DkgPart3Receive',
            dkgPart3Receive_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DkgPart3ReceiveRequest.fromBuffer(value),
            ($0.DkgPart3Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgRefreshPart1Request,
            $0.DkgRefreshPart1Response>(
        'DkgRefreshPart1',
        dkgRefreshPart1_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DkgRefreshPart1Request.fromBuffer(value),
        ($0.DkgRefreshPart1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgRefreshPart2Request,
            $0.DkgRefreshPart2Response>(
        'DkgRefreshPart2',
        dkgRefreshPart2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DkgRefreshPart2Request.fromBuffer(value),
        ($0.DkgRefreshPart2Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DkgRefreshPart3Request, $0.DkgPart3Response>(
            'DkgRefreshPart3',
            dkgRefreshPart3_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DkgRefreshPart3Request.fromBuffer(value),
            ($0.DkgPart3Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewNonceRequest, $0.NewNonceResponse>(
        'NewNonce',
        newNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewNonceRequest.fromBuffer(value),
        ($0.NewNonceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrostSignRequest, $0.StringResponse>(
        'FrostSign',
        frostSign_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FrostSignRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrostAggregateRequest, $0.StringResponse>(
        'FrostAggregate',
        frostAggregate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FrostAggregateRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.KeyTweakRequest, $0.StringResponse>(
        'KeyPackageTweak',
        keyPackageTweak_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.KeyTweakRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.KeyTweakRequest, $0.StringResponse>(
        'PubKeyPackageTweak',
        pubKeyPackageTweak_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.KeyTweakRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StringRequest, $0.StringResponse>(
        'KeyPackageIntoEvenY',
        keyPackageIntoEvenY_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StringRequest, $0.StringResponse>(
        'PubKeyPackageIntoEvenY',
        pubKeyPackageIntoEvenY_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthSignerCreateRequest,
            $0.AuthSignerCreateResponse>(
        'AuthSignerCreate',
        authSignerCreate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AuthSignerCreateRequest.fromBuffer(value),
        ($0.AuthSignerCreateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthSignerSignRequest, $0.StringResponse>(
        'AuthSignerSign',
        authSignerSign_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AuthSignerSignRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserIdRequest, $0.StringResponse>(
        'AuthSignerPublicKey',
        authSignerPublicKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserIdRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifySignatureRequest, $0.BoolResponse>(
        'VerifySchnorrSignature',
        verifySchnorrSignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifySignatureRequest.fromBuffer(value),
        ($0.BoolResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BytesRequest, $0.StringResponse>(
        'IdentifierDerive',
        identifierDerive_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BytesRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StringRequest, $0.StringResponse>(
        'IdentifierFromBigint',
        identifierFromBigint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GenerateCoefficientsRequest, $0.StringResponse>(
            'GenerateCoefficients',
            generateCoefficients_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GenerateCoefficientsRequest.fromBuffer(value),
            ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.EvaluatePolynomialRequest, $0.StringResponse>(
            'EvaluatePolynomial',
            evaluatePolynomial_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.EvaluatePolynomialRequest.fromBuffer(value),
            ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserIdRequest, $0.StringResponse>(
        'ModNRandom',
        modNRandom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserIdRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ElemBaseMulRequest, $0.StringResponse>(
        'ElemBaseMul',
        elemBaseMul_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ElemBaseMulRequest.fromBuffer(value),
        ($0.StringResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserIdRequest, $0.Empty>(
        'DestroyUser',
        destroyUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserIdRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.DkgPart1Response> dkgPart1_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DkgPart1Request> request) async {
    return dkgPart1(call, await request);
  }

  $async.Future<$0.DkgPart2Response> dkgPart2_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DkgPart2Request> request) async {
    return dkgPart2(call, await request);
  }

  $async.Future<$0.DkgPart3Response> dkgPart3_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DkgPart3Request> request) async {
    return dkgPart3(call, await request);
  }

  $async.Future<$0.DkgPart3Response> dkgPart3Receive_Pre($grpc.ServiceCall call,
      $async.Future<$0.DkgPart3ReceiveRequest> request) async {
    return dkgPart3Receive(call, await request);
  }

  $async.Future<$0.DkgRefreshPart1Response> dkgRefreshPart1_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DkgRefreshPart1Request> request) async {
    return dkgRefreshPart1(call, await request);
  }

  $async.Future<$0.DkgRefreshPart2Response> dkgRefreshPart2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DkgRefreshPart2Request> request) async {
    return dkgRefreshPart2(call, await request);
  }

  $async.Future<$0.DkgPart3Response> dkgRefreshPart3_Pre($grpc.ServiceCall call,
      $async.Future<$0.DkgRefreshPart3Request> request) async {
    return dkgRefreshPart3(call, await request);
  }

  $async.Future<$0.NewNonceResponse> newNonce_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NewNonceRequest> request) async {
    return newNonce(call, await request);
  }

  $async.Future<$0.StringResponse> frostSign_Pre($grpc.ServiceCall call,
      $async.Future<$0.FrostSignRequest> request) async {
    return frostSign(call, await request);
  }

  $async.Future<$0.StringResponse> frostAggregate_Pre($grpc.ServiceCall call,
      $async.Future<$0.FrostAggregateRequest> request) async {
    return frostAggregate(call, await request);
  }

  $async.Future<$0.StringResponse> keyPackageTweak_Pre(
      $grpc.ServiceCall call, $async.Future<$0.KeyTweakRequest> request) async {
    return keyPackageTweak(call, await request);
  }

  $async.Future<$0.StringResponse> pubKeyPackageTweak_Pre(
      $grpc.ServiceCall call, $async.Future<$0.KeyTweakRequest> request) async {
    return pubKeyPackageTweak(call, await request);
  }

  $async.Future<$0.StringResponse> keyPackageIntoEvenY_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringRequest> request) async {
    return keyPackageIntoEvenY(call, await request);
  }

  $async.Future<$0.StringResponse> pubKeyPackageIntoEvenY_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringRequest> request) async {
    return pubKeyPackageIntoEvenY(call, await request);
  }

  $async.Future<$0.AuthSignerCreateResponse> authSignerCreate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AuthSignerCreateRequest> request) async {
    return authSignerCreate(call, await request);
  }

  $async.Future<$0.StringResponse> authSignerSign_Pre($grpc.ServiceCall call,
      $async.Future<$0.AuthSignerSignRequest> request) async {
    return authSignerSign(call, await request);
  }

  $async.Future<$0.StringResponse> authSignerPublicKey_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserIdRequest> request) async {
    return authSignerPublicKey(call, await request);
  }

  $async.Future<$0.BoolResponse> verifySchnorrSignature_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerifySignatureRequest> request) async {
    return verifySchnorrSignature(call, await request);
  }

  $async.Future<$0.StringResponse> identifierDerive_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BytesRequest> request) async {
    return identifierDerive(call, await request);
  }

  $async.Future<$0.StringResponse> identifierFromBigint_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringRequest> request) async {
    return identifierFromBigint(call, await request);
  }

  $async.Future<$0.StringResponse> generateCoefficients_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GenerateCoefficientsRequest> request) async {
    return generateCoefficients(call, await request);
  }

  $async.Future<$0.StringResponse> evaluatePolynomial_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.EvaluatePolynomialRequest> request) async {
    return evaluatePolynomial(call, await request);
  }

  $async.Future<$0.StringResponse> modNRandom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserIdRequest> request) async {
    return modNRandom(call, await request);
  }

  $async.Future<$0.StringResponse> elemBaseMul_Pre($grpc.ServiceCall call,
      $async.Future<$0.ElemBaseMulRequest> request) async {
    return elemBaseMul(call, await request);
  }

  $async.Future<$0.Empty> destroyUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserIdRequest> request) async {
    return destroyUser(call, await request);
  }

  $async.Future<$0.DkgPart1Response> dkgPart1(
      $grpc.ServiceCall call, $0.DkgPart1Request request);
  $async.Future<$0.DkgPart2Response> dkgPart2(
      $grpc.ServiceCall call, $0.DkgPart2Request request);
  $async.Future<$0.DkgPart3Response> dkgPart3(
      $grpc.ServiceCall call, $0.DkgPart3Request request);
  $async.Future<$0.DkgPart3Response> dkgPart3Receive(
      $grpc.ServiceCall call, $0.DkgPart3ReceiveRequest request);
  $async.Future<$0.DkgRefreshPart1Response> dkgRefreshPart1(
      $grpc.ServiceCall call, $0.DkgRefreshPart1Request request);
  $async.Future<$0.DkgRefreshPart2Response> dkgRefreshPart2(
      $grpc.ServiceCall call, $0.DkgRefreshPart2Request request);
  $async.Future<$0.DkgPart3Response> dkgRefreshPart3(
      $grpc.ServiceCall call, $0.DkgRefreshPart3Request request);
  $async.Future<$0.NewNonceResponse> newNonce(
      $grpc.ServiceCall call, $0.NewNonceRequest request);
  $async.Future<$0.StringResponse> frostSign(
      $grpc.ServiceCall call, $0.FrostSignRequest request);
  $async.Future<$0.StringResponse> frostAggregate(
      $grpc.ServiceCall call, $0.FrostAggregateRequest request);
  $async.Future<$0.StringResponse> keyPackageTweak(
      $grpc.ServiceCall call, $0.KeyTweakRequest request);
  $async.Future<$0.StringResponse> pubKeyPackageTweak(
      $grpc.ServiceCall call, $0.KeyTweakRequest request);
  $async.Future<$0.StringResponse> keyPackageIntoEvenY(
      $grpc.ServiceCall call, $0.StringRequest request);
  $async.Future<$0.StringResponse> pubKeyPackageIntoEvenY(
      $grpc.ServiceCall call, $0.StringRequest request);
  $async.Future<$0.AuthSignerCreateResponse> authSignerCreate(
      $grpc.ServiceCall call, $0.AuthSignerCreateRequest request);
  $async.Future<$0.StringResponse> authSignerSign(
      $grpc.ServiceCall call, $0.AuthSignerSignRequest request);
  $async.Future<$0.StringResponse> authSignerPublicKey(
      $grpc.ServiceCall call, $0.UserIdRequest request);
  $async.Future<$0.BoolResponse> verifySchnorrSignature(
      $grpc.ServiceCall call, $0.VerifySignatureRequest request);
  $async.Future<$0.StringResponse> identifierDerive(
      $grpc.ServiceCall call, $0.BytesRequest request);
  $async.Future<$0.StringResponse> identifierFromBigint(
      $grpc.ServiceCall call, $0.StringRequest request);
  $async.Future<$0.StringResponse> generateCoefficients(
      $grpc.ServiceCall call, $0.GenerateCoefficientsRequest request);
  $async.Future<$0.StringResponse> evaluatePolynomial(
      $grpc.ServiceCall call, $0.EvaluatePolynomialRequest request);
  $async.Future<$0.StringResponse> modNRandom(
      $grpc.ServiceCall call, $0.UserIdRequest request);
  $async.Future<$0.StringResponse> elemBaseMul(
      $grpc.ServiceCall call, $0.ElemBaseMulRequest request);
  $async.Future<$0.Empty> destroyUser(
      $grpc.ServiceCall call, $0.UserIdRequest request);
}
