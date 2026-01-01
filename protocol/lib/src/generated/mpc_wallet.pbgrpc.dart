//
//  Generated code. Do not modify.
//  source: mpc_wallet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'mpc_wallet.pb.dart' as $0;

export 'mpc_wallet.pb.dart';

@$pb.GrpcServiceName('mpc_wallet.MPCWallet')
class MPCWalletClient extends $grpc.Client {
  static final _$dKGStep1 = $grpc.ClientMethod<$0.DKGStep1Request, $0.DKGStep1Response>(
      '/mpc_wallet.MPCWallet/DKGStep1',
      ($0.DKGStep1Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DKGStep1Response.fromBuffer(value));
  static final _$dKGStep2 = $grpc.ClientMethod<$0.DKGStep2Request, $0.DKGStep2Response>(
      '/mpc_wallet.MPCWallet/DKGStep2',
      ($0.DKGStep2Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DKGStep2Response.fromBuffer(value));
  static final _$dKGStep3 = $grpc.ClientMethod<$0.DKGStep3Request, $0.DKGStep3Response>(
      '/mpc_wallet.MPCWallet/DKGStep3',
      ($0.DKGStep3Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DKGStep3Response.fromBuffer(value));
  static final _$signStep1 = $grpc.ClientMethod<$0.SignStep1Request, $0.SignStep1Response>(
      '/mpc_wallet.MPCWallet/SignStep1',
      ($0.SignStep1Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignStep1Response.fromBuffer(value));
  static final _$signStep2 = $grpc.ClientMethod<$0.SignStep2Request, $0.SignStep2Response>(
      '/mpc_wallet.MPCWallet/SignStep2',
      ($0.SignStep2Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignStep2Response.fromBuffer(value));
  static final _$refreshStep1 = $grpc.ClientMethod<$0.RefreshStep1Request, $0.RefreshStep1Response>(
      '/mpc_wallet.MPCWallet/RefreshStep1',
      ($0.RefreshStep1Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RefreshStep1Response.fromBuffer(value));
  static final _$refreshStep2 = $grpc.ClientMethod<$0.RefreshStep2Request, $0.RefreshStep2Response>(
      '/mpc_wallet.MPCWallet/RefreshStep2',
      ($0.RefreshStep2Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RefreshStep2Response.fromBuffer(value));
  static final _$refreshStep3 = $grpc.ClientMethod<$0.RefreshStep3Request, $0.RefreshStep3Response>(
      '/mpc_wallet.MPCWallet/RefreshStep3',
      ($0.RefreshStep3Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RefreshStep3Response.fromBuffer(value));
  static final _$createSpendingPolicy = $grpc.ClientMethod<$0.CreateSpendingPolicyRequest, $0.CreateSpendingPolicyResponse>(
      '/mpc_wallet.MPCWallet/CreateSpendingPolicy',
      ($0.CreateSpendingPolicyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateSpendingPolicyResponse.fromBuffer(value));
  static final _$getPolicyId = $grpc.ClientMethod<$0.GetPolicyIdRequest, $0.GetPolicyIdResponse>(
      '/mpc_wallet.MPCWallet/GetPolicyId',
      ($0.GetPolicyIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPolicyIdResponse.fromBuffer(value));
  static final _$broadcastTransaction = $grpc.ClientMethod<$0.BroadcastTransactionRequest, $0.BroadcastTransactionResponse>(
      '/mpc_wallet.MPCWallet/BroadcastTransaction',
      ($0.BroadcastTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BroadcastTransactionResponse.fromBuffer(value));
  static final _$fetchHistory = $grpc.ClientMethod<$0.FetchHistoryRequest, $0.FetchHistoryResponse>(
      '/mpc_wallet.MPCWallet/FetchHistory',
      ($0.FetchHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FetchHistoryResponse.fromBuffer(value));
  static final _$fetchRecentTransactions = $grpc.ClientMethod<$0.FetchRecentTransactionsRequest, $0.FetchRecentTransactionsResponse>(
      '/mpc_wallet.MPCWallet/FetchRecentTransactions',
      ($0.FetchRecentTransactionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FetchRecentTransactionsResponse.fromBuffer(value));
  static final _$subscribeToHistory = $grpc.ClientMethod<$0.SubscribeToHistoryRequest, $0.TransactionNotification>(
      '/mpc_wallet.MPCWallet/SubscribeToHistory',
      ($0.SubscribeToHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransactionNotification.fromBuffer(value));

  MPCWalletClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.DKGStep1Response> dKGStep1($0.DKGStep1Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dKGStep1, request, options: options);
  }

  $grpc.ResponseFuture<$0.DKGStep2Response> dKGStep2($0.DKGStep2Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dKGStep2, request, options: options);
  }

  $grpc.ResponseFuture<$0.DKGStep3Response> dKGStep3($0.DKGStep3Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dKGStep3, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignStep1Response> signStep1($0.SignStep1Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signStep1, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignStep2Response> signStep2($0.SignStep2Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signStep2, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshStep1Response> refreshStep1($0.RefreshStep1Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshStep1, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshStep2Response> refreshStep2($0.RefreshStep2Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshStep2, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshStep3Response> refreshStep3($0.RefreshStep3Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshStep3, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateSpendingPolicyResponse> createSpendingPolicy($0.CreateSpendingPolicyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSpendingPolicy, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPolicyIdResponse> getPolicyId($0.GetPolicyIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPolicyId, request, options: options);
  }

  $grpc.ResponseFuture<$0.BroadcastTransactionResponse> broadcastTransaction($0.BroadcastTransactionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchHistoryResponse> fetchHistory($0.FetchHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchHistory, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchRecentTransactionsResponse> fetchRecentTransactions($0.FetchRecentTransactionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchRecentTransactions, request, options: options);
  }

  $grpc.ResponseStream<$0.TransactionNotification> subscribeToHistory($0.SubscribeToHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToHistory, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('mpc_wallet.MPCWallet')
abstract class MPCWalletServiceBase extends $grpc.Service {
  $core.String get $name => 'mpc_wallet.MPCWallet';

  MPCWalletServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DKGStep1Request, $0.DKGStep1Response>(
        'DKGStep1',
        dKGStep1_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DKGStep1Request.fromBuffer(value),
        ($0.DKGStep1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DKGStep2Request, $0.DKGStep2Response>(
        'DKGStep2',
        dKGStep2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DKGStep2Request.fromBuffer(value),
        ($0.DKGStep2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DKGStep3Request, $0.DKGStep3Response>(
        'DKGStep3',
        dKGStep3_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DKGStep3Request.fromBuffer(value),
        ($0.DKGStep3Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignStep1Request, $0.SignStep1Response>(
        'SignStep1',
        signStep1_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignStep1Request.fromBuffer(value),
        ($0.SignStep1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignStep2Request, $0.SignStep2Response>(
        'SignStep2',
        signStep2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignStep2Request.fromBuffer(value),
        ($0.SignStep2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshStep1Request, $0.RefreshStep1Response>(
        'RefreshStep1',
        refreshStep1_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshStep1Request.fromBuffer(value),
        ($0.RefreshStep1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshStep2Request, $0.RefreshStep2Response>(
        'RefreshStep2',
        refreshStep2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshStep2Request.fromBuffer(value),
        ($0.RefreshStep2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshStep3Request, $0.RefreshStep3Response>(
        'RefreshStep3',
        refreshStep3_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshStep3Request.fromBuffer(value),
        ($0.RefreshStep3Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSpendingPolicyRequest, $0.CreateSpendingPolicyResponse>(
        'CreateSpendingPolicy',
        createSpendingPolicy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateSpendingPolicyRequest.fromBuffer(value),
        ($0.CreateSpendingPolicyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPolicyIdRequest, $0.GetPolicyIdResponse>(
        'GetPolicyId',
        getPolicyId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPolicyIdRequest.fromBuffer(value),
        ($0.GetPolicyIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BroadcastTransactionRequest, $0.BroadcastTransactionResponse>(
        'BroadcastTransaction',
        broadcastTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BroadcastTransactionRequest.fromBuffer(value),
        ($0.BroadcastTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchHistoryRequest, $0.FetchHistoryResponse>(
        'FetchHistory',
        fetchHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchHistoryRequest.fromBuffer(value),
        ($0.FetchHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchRecentTransactionsRequest, $0.FetchRecentTransactionsResponse>(
        'FetchRecentTransactions',
        fetchRecentTransactions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchRecentTransactionsRequest.fromBuffer(value),
        ($0.FetchRecentTransactionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubscribeToHistoryRequest, $0.TransactionNotification>(
        'SubscribeToHistory',
        subscribeToHistory_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeToHistoryRequest.fromBuffer(value),
        ($0.TransactionNotification value) => value.writeToBuffer()));
  }

  $async.Future<$0.DKGStep1Response> dKGStep1_Pre($grpc.ServiceCall call, $async.Future<$0.DKGStep1Request> request) async {
    return dKGStep1(call, await request);
  }

  $async.Future<$0.DKGStep2Response> dKGStep2_Pre($grpc.ServiceCall call, $async.Future<$0.DKGStep2Request> request) async {
    return dKGStep2(call, await request);
  }

  $async.Future<$0.DKGStep3Response> dKGStep3_Pre($grpc.ServiceCall call, $async.Future<$0.DKGStep3Request> request) async {
    return dKGStep3(call, await request);
  }

  $async.Future<$0.SignStep1Response> signStep1_Pre($grpc.ServiceCall call, $async.Future<$0.SignStep1Request> request) async {
    return signStep1(call, await request);
  }

  $async.Future<$0.SignStep2Response> signStep2_Pre($grpc.ServiceCall call, $async.Future<$0.SignStep2Request> request) async {
    return signStep2(call, await request);
  }

  $async.Future<$0.RefreshStep1Response> refreshStep1_Pre($grpc.ServiceCall call, $async.Future<$0.RefreshStep1Request> request) async {
    return refreshStep1(call, await request);
  }

  $async.Future<$0.RefreshStep2Response> refreshStep2_Pre($grpc.ServiceCall call, $async.Future<$0.RefreshStep2Request> request) async {
    return refreshStep2(call, await request);
  }

  $async.Future<$0.RefreshStep3Response> refreshStep3_Pre($grpc.ServiceCall call, $async.Future<$0.RefreshStep3Request> request) async {
    return refreshStep3(call, await request);
  }

  $async.Future<$0.CreateSpendingPolicyResponse> createSpendingPolicy_Pre($grpc.ServiceCall call, $async.Future<$0.CreateSpendingPolicyRequest> request) async {
    return createSpendingPolicy(call, await request);
  }

  $async.Future<$0.GetPolicyIdResponse> getPolicyId_Pre($grpc.ServiceCall call, $async.Future<$0.GetPolicyIdRequest> request) async {
    return getPolicyId(call, await request);
  }

  $async.Future<$0.BroadcastTransactionResponse> broadcastTransaction_Pre($grpc.ServiceCall call, $async.Future<$0.BroadcastTransactionRequest> request) async {
    return broadcastTransaction(call, await request);
  }

  $async.Future<$0.FetchHistoryResponse> fetchHistory_Pre($grpc.ServiceCall call, $async.Future<$0.FetchHistoryRequest> request) async {
    return fetchHistory(call, await request);
  }

  $async.Future<$0.FetchRecentTransactionsResponse> fetchRecentTransactions_Pre($grpc.ServiceCall call, $async.Future<$0.FetchRecentTransactionsRequest> request) async {
    return fetchRecentTransactions(call, await request);
  }

  $async.Stream<$0.TransactionNotification> subscribeToHistory_Pre($grpc.ServiceCall call, $async.Future<$0.SubscribeToHistoryRequest> request) async* {
    yield* subscribeToHistory(call, await request);
  }

  $async.Future<$0.DKGStep1Response> dKGStep1($grpc.ServiceCall call, $0.DKGStep1Request request);
  $async.Future<$0.DKGStep2Response> dKGStep2($grpc.ServiceCall call, $0.DKGStep2Request request);
  $async.Future<$0.DKGStep3Response> dKGStep3($grpc.ServiceCall call, $0.DKGStep3Request request);
  $async.Future<$0.SignStep1Response> signStep1($grpc.ServiceCall call, $0.SignStep1Request request);
  $async.Future<$0.SignStep2Response> signStep2($grpc.ServiceCall call, $0.SignStep2Request request);
  $async.Future<$0.RefreshStep1Response> refreshStep1($grpc.ServiceCall call, $0.RefreshStep1Request request);
  $async.Future<$0.RefreshStep2Response> refreshStep2($grpc.ServiceCall call, $0.RefreshStep2Request request);
  $async.Future<$0.RefreshStep3Response> refreshStep3($grpc.ServiceCall call, $0.RefreshStep3Request request);
  $async.Future<$0.CreateSpendingPolicyResponse> createSpendingPolicy($grpc.ServiceCall call, $0.CreateSpendingPolicyRequest request);
  $async.Future<$0.GetPolicyIdResponse> getPolicyId($grpc.ServiceCall call, $0.GetPolicyIdRequest request);
  $async.Future<$0.BroadcastTransactionResponse> broadcastTransaction($grpc.ServiceCall call, $0.BroadcastTransactionRequest request);
  $async.Future<$0.FetchHistoryResponse> fetchHistory($grpc.ServiceCall call, $0.FetchHistoryRequest request);
  $async.Future<$0.FetchRecentTransactionsResponse> fetchRecentTransactions($grpc.ServiceCall call, $0.FetchRecentTransactionsRequest request);
  $async.Stream<$0.TransactionNotification> subscribeToHistory($grpc.ServiceCall call, $0.SubscribeToHistoryRequest request);
}
