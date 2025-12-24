// This is a generated file - do not edit.
//
// Generated from mpc_wallet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dKGStep1RequestDescriptor instead')
const DKGStep1Request$json = {
  '1': 'DKGStep1Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {'1': 'round1_package', '3': 3, '4': 1, '5': 9, '10': 'round1Package'},
  ],
};

/// Descriptor for `DKGStep1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep1RequestDescriptor = $convert.base64Decode(
    'Cg9ES0dTdGVwMVJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIeCgppZGVudG'
    'lmaWVyGAIgASgMUgppZGVudGlmaWVyEiUKDnJvdW5kMV9wYWNrYWdlGAMgASgJUg1yb3VuZDFQ'
    'YWNrYWdl');

@$core.Deprecated('Use dKGStep1ResponseDescriptor instead')
const DKGStep1Response$json = {
  '1': 'DKGStep1Response',
  '2': [
    {
      '1': 'round1_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.DKGStep1Response.Round1PackagesEntry',
      '10': 'round1Packages'
    },
  ],
  '3': [DKGStep1Response_Round1PackagesEntry$json],
};

@$core.Deprecated('Use dKGStep1ResponseDescriptor instead')
const DKGStep1Response_Round1PackagesEntry$json = {
  '1': 'Round1PackagesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DKGStep1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep1ResponseDescriptor = $convert.base64Decode(
    'ChBES0dTdGVwMVJlc3BvbnNlElkKD3JvdW5kMV9wYWNrYWdlcxgBIAMoCzIwLm1wY193YWxsZX'
    'QuREtHU3RlcDFSZXNwb25zZS5Sb3VuZDFQYWNrYWdlc0VudHJ5Ug5yb3VuZDFQYWNrYWdlcxpB'
    'ChNSb3VuZDFQYWNrYWdlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUg'
    'V2YWx1ZToCOAE=');

@$core.Deprecated('Use dKGStep2RequestDescriptor instead')
const DKGStep2Request$json = {
  '1': 'DKGStep2Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {'1': 'round1_package', '3': 3, '4': 1, '5': 9, '10': 'round1Package'},
  ],
};

/// Descriptor for `DKGStep2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep2RequestDescriptor = $convert.base64Decode(
    'Cg9ES0dTdGVwMlJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIeCgppZGVudG'
    'lmaWVyGAIgASgMUgppZGVudGlmaWVyEiUKDnJvdW5kMV9wYWNrYWdlGAMgASgJUg1yb3VuZDFQ'
    'YWNrYWdl');

@$core.Deprecated('Use dKGStep2ResponseDescriptor instead')
const DKGStep2Response$json = {
  '1': 'DKGStep2Response',
  '2': [
    {
      '1': 'all_round1_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.DKGStep2Response.AllRound1PackagesEntry',
      '10': 'allRound1Packages'
    },
  ],
  '3': [DKGStep2Response_AllRound1PackagesEntry$json],
};

@$core.Deprecated('Use dKGStep2ResponseDescriptor instead')
const DKGStep2Response_AllRound1PackagesEntry$json = {
  '1': 'AllRound1PackagesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DKGStep2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep2ResponseDescriptor = $convert.base64Decode(
    'ChBES0dTdGVwMlJlc3BvbnNlEmMKE2FsbF9yb3VuZDFfcGFja2FnZXMYASADKAsyMy5tcGNfd2'
    'FsbGV0LkRLR1N0ZXAyUmVzcG9uc2UuQWxsUm91bmQxUGFja2FnZXNFbnRyeVIRYWxsUm91bmQx'
    'UGFja2FnZXMaRAoWQWxsUm91bmQxUGFja2FnZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCg'
    'V2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use dKGStep3RequestDescriptor instead')
const DKGStep3Request$json = {
  '1': 'DKGStep3Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {
      '1': 'round2_packages_for_others',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.DKGStep3Request.Round2PackagesForOthersEntry',
      '10': 'round2PackagesForOthers'
    },
  ],
  '3': [DKGStep3Request_Round2PackagesForOthersEntry$json],
};

@$core.Deprecated('Use dKGStep3RequestDescriptor instead')
const DKGStep3Request_Round2PackagesForOthersEntry$json = {
  '1': 'Round2PackagesForOthersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DKGStep3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep3RequestDescriptor = $convert.base64Decode(
    'Cg9ES0dTdGVwM1JlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIeCgppZGVudG'
    'lmaWVyGAIgASgMUgppZGVudGlmaWVyEnUKGnJvdW5kMl9wYWNrYWdlc19mb3Jfb3RoZXJzGAMg'
    'AygLMjgubXBjX3dhbGxldC5ES0dTdGVwM1JlcXVlc3QuUm91bmQyUGFja2FnZXNGb3JPdGhlcn'
    'NFbnRyeVIXcm91bmQyUGFja2FnZXNGb3JPdGhlcnMaSgocUm91bmQyUGFja2FnZXNGb3JPdGhl'
    'cnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use dKGStep3ResponseDescriptor instead')
const DKGStep3Response$json = {
  '1': 'DKGStep3Response',
  '2': [
    {
      '1': 'round2_packages_for_me',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.DKGStep3Response.Round2PackagesForMeEntry',
      '10': 'round2PackagesForMe'
    },
  ],
  '3': [DKGStep3Response_Round2PackagesForMeEntry$json],
};

@$core.Deprecated('Use dKGStep3ResponseDescriptor instead')
const DKGStep3Response_Round2PackagesForMeEntry$json = {
  '1': 'Round2PackagesForMeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DKGStep3Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dKGStep3ResponseDescriptor = $convert.base64Decode(
    'ChBES0dTdGVwM1Jlc3BvbnNlEmoKFnJvdW5kMl9wYWNrYWdlc19mb3JfbWUYASADKAsyNS5tcG'
    'Nfd2FsbGV0LkRLR1N0ZXAzUmVzcG9uc2UuUm91bmQyUGFja2FnZXNGb3JNZUVudHJ5UhNyb3Vu'
    'ZDJQYWNrYWdlc0Zvck1lGkYKGFJvdW5kMlBhY2thZ2VzRm9yTWVFbnRyeRIQCgNrZXkYASABKA'
    'lSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use signStep1RequestDescriptor instead')
const SignStep1Request$json = {
  '1': 'SignStep1Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {
      '1': 'hiding_commitment',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'hidingCommitment'
    },
    {
      '1': 'binding_commitment',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'bindingCommitment'
    },
    {'1': 'message_to_sign', '3': 5, '4': 1, '5': 12, '10': 'messageToSign'},
    {'1': 'full_transaction', '3': 6, '4': 1, '5': 12, '10': 'fullTransaction'},
    {
      '1': 'input_utxos',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.UtxoInfo',
      '10': 'inputUtxos'
    },
  ],
};

/// Descriptor for `SignStep1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signStep1RequestDescriptor = $convert.base64Decode(
    'ChBTaWduU3RlcDFSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHgoKaWRlbn'
    'RpZmllchgCIAEoDFIKaWRlbnRpZmllchIrChFoaWRpbmdfY29tbWl0bWVudBgDIAEoDFIQaGlk'
    'aW5nQ29tbWl0bWVudBItChJiaW5kaW5nX2NvbW1pdG1lbnQYBCABKAxSEWJpbmRpbmdDb21taX'
    'RtZW50EiYKD21lc3NhZ2VfdG9fc2lnbhgFIAEoDFINbWVzc2FnZVRvU2lnbhIpChBmdWxsX3Ry'
    'YW5zYWN0aW9uGAYgASgMUg9mdWxsVHJhbnNhY3Rpb24SNQoLaW5wdXRfdXR4b3MYByADKAsyFC'
    '5tcGNfd2FsbGV0LlV0eG9JbmZvUgppbnB1dFV0eG9z');

@$core.Deprecated('Use utxoInfoDescriptor instead')
const UtxoInfo$json = {
  '1': 'UtxoInfo',
  '2': [
    {'1': 'tx_hash', '3': 1, '4': 1, '5': 9, '10': 'txHash'},
    {'1': 'vout', '3': 2, '4': 1, '5': 5, '10': 'vout'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `UtxoInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List utxoInfoDescriptor = $convert.base64Decode(
    'CghVdHhvSW5mbxIXCgd0eF9oYXNoGAEgASgJUgZ0eEhhc2gSEgoEdm91dBgCIAEoBVIEdm91dB'
    'IWCgZhbW91bnQYAyABKANSBmFtb3VudA==');

@$core.Deprecated('Use signStep1ResponseDescriptor instead')
const SignStep1Response$json = {
  '1': 'SignStep1Response',
  '2': [
    {
      '1': 'commitments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.SignStep1Response.CommitmentsEntry',
      '10': 'commitments'
    },
    {'1': 'message_to_sign', '3': 2, '4': 1, '5': 12, '10': 'messageToSign'},
    {'1': 'used_key_index', '3': 3, '4': 1, '5': 5, '10': 'usedKeyIndex'},
  ],
  '3': [
    SignStep1Response_Commitment$json,
    SignStep1Response_CommitmentsEntry$json
  ],
};

@$core.Deprecated('Use signStep1ResponseDescriptor instead')
const SignStep1Response_Commitment$json = {
  '1': 'Commitment',
  '2': [
    {'1': 'hiding', '3': 1, '4': 1, '5': 12, '10': 'hiding'},
    {'1': 'binding', '3': 2, '4': 1, '5': 12, '10': 'binding'},
  ],
};

@$core.Deprecated('Use signStep1ResponseDescriptor instead')
const SignStep1Response_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.mpc_wallet.SignStep1Response.Commitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `SignStep1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signStep1ResponseDescriptor = $convert.base64Decode(
    'ChFTaWduU3RlcDFSZXNwb25zZRJQCgtjb21taXRtZW50cxgBIAMoCzIuLm1wY193YWxsZXQuU2'
    'lnblN0ZXAxUmVzcG9uc2UuQ29tbWl0bWVudHNFbnRyeVILY29tbWl0bWVudHMSJgoPbWVzc2Fn'
    'ZV90b19zaWduGAIgASgMUg1tZXNzYWdlVG9TaWduEiQKDnVzZWRfa2V5X2luZGV4GAMgASgFUg'
    'x1c2VkS2V5SW5kZXgaPgoKQ29tbWl0bWVudBIWCgZoaWRpbmcYASABKAxSBmhpZGluZxIYCgdi'
    'aW5kaW5nGAIgASgMUgdiaW5kaW5nGmgKEENvbW1pdG1lbnRzRW50cnkSEAoDa2V5GAEgASgJUg'
    'NrZXkSPgoFdmFsdWUYAiABKAsyKC5tcGNfd2FsbGV0LlNpZ25TdGVwMVJlc3BvbnNlLkNvbW1p'
    'dG1lbnRSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use signStep2RequestDescriptor instead')
const SignStep2Request$json = {
  '1': 'SignStep2Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {'1': 'signature_share', '3': 3, '4': 1, '5': 12, '10': 'signatureShare'},
  ],
};

/// Descriptor for `SignStep2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signStep2RequestDescriptor = $convert.base64Decode(
    'ChBTaWduU3RlcDJSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHgoKaWRlbn'
    'RpZmllchgCIAEoDFIKaWRlbnRpZmllchInCg9zaWduYXR1cmVfc2hhcmUYAyABKAxSDnNpZ25h'
    'dHVyZVNoYXJl');

@$core.Deprecated('Use signStep2ResponseDescriptor instead')
const SignStep2Response$json = {
  '1': 'SignStep2Response',
  '2': [
    {'1': 'r_point', '3': 1, '4': 1, '5': 12, '10': 'rPoint'},
    {'1': 'z_scalar', '3': 2, '4': 1, '5': 12, '10': 'zScalar'},
  ],
};

/// Descriptor for `SignStep2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signStep2ResponseDescriptor = $convert.base64Decode(
    'ChFTaWduU3RlcDJSZXNwb25zZRIXCgdyX3BvaW50GAEgASgMUgZyUG9pbnQSGQoIel9zY2FsYX'
    'IYAiABKAxSB3pTY2FsYXI=');

@$core.Deprecated('Use refreshStep1RequestDescriptor instead')
const RefreshStep1Request$json = {
  '1': 'RefreshStep1Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {'1': 'round1_package', '3': 3, '4': 1, '5': 9, '10': 'round1Package'},
    {'1': 'threshold_amount', '3': 4, '4': 1, '5': 3, '10': 'thresholdAmount'},
    {'1': 'interval', '3': 5, '4': 1, '5': 3, '10': 'interval'},
  ],
};

/// Descriptor for `RefreshStep1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep1RequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoU3RlcDFSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHgoKaW'
    'RlbnRpZmllchgCIAEoDFIKaWRlbnRpZmllchIlCg5yb3VuZDFfcGFja2FnZRgDIAEoCVINcm91'
    'bmQxUGFja2FnZRIpChB0aHJlc2hvbGRfYW1vdW50GAQgASgDUg90aHJlc2hvbGRBbW91bnQSGg'
    'oIaW50ZXJ2YWwYBSABKANSCGludGVydmFs');

@$core.Deprecated('Use refreshStep1ResponseDescriptor instead')
const RefreshStep1Response$json = {
  '1': 'RefreshStep1Response',
  '2': [
    {
      '1': 'round1_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.RefreshStep1Response.Round1PackagesEntry',
      '10': 'round1Packages'
    },
    {'1': 'policy_id', '3': 2, '4': 1, '5': 9, '10': 'policyId'},
    {'1': 'start_time', '3': 3, '4': 1, '5': 3, '10': 'startTime'},
  ],
  '3': [RefreshStep1Response_Round1PackagesEntry$json],
};

@$core.Deprecated('Use refreshStep1ResponseDescriptor instead')
const RefreshStep1Response_Round1PackagesEntry$json = {
  '1': 'Round1PackagesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RefreshStep1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep1ResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoU3RlcDFSZXNwb25zZRJdCg9yb3VuZDFfcGFja2FnZXMYASADKAsyNC5tcGNfd2'
    'FsbGV0LlJlZnJlc2hTdGVwMVJlc3BvbnNlLlJvdW5kMVBhY2thZ2VzRW50cnlSDnJvdW5kMVBh'
    'Y2thZ2VzEhsKCXBvbGljeV9pZBgCIAEoCVIIcG9saWN5SWQSHQoKc3RhcnRfdGltZRgDIAEoA1'
    'IJc3RhcnRUaW1lGkEKE1JvdW5kMVBhY2thZ2VzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoF'
    'dmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use refreshStep2RequestDescriptor instead')
const RefreshStep2Request$json = {
  '1': 'RefreshStep2Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {'1': 'round1_package', '3': 3, '4': 1, '5': 9, '10': 'round1Package'},
  ],
};

/// Descriptor for `RefreshStep2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep2RequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoU3RlcDJSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHgoKaW'
    'RlbnRpZmllchgCIAEoDFIKaWRlbnRpZmllchIlCg5yb3VuZDFfcGFja2FnZRgDIAEoCVINcm91'
    'bmQxUGFja2FnZQ==');

@$core.Deprecated('Use refreshStep2ResponseDescriptor instead')
const RefreshStep2Response$json = {
  '1': 'RefreshStep2Response',
  '2': [
    {
      '1': 'all_round1_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.RefreshStep2Response.AllRound1PackagesEntry',
      '10': 'allRound1Packages'
    },
  ],
  '3': [RefreshStep2Response_AllRound1PackagesEntry$json],
};

@$core.Deprecated('Use refreshStep2ResponseDescriptor instead')
const RefreshStep2Response_AllRound1PackagesEntry$json = {
  '1': 'AllRound1PackagesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RefreshStep2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep2ResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoU3RlcDJSZXNwb25zZRJnChNhbGxfcm91bmQxX3BhY2thZ2VzGAEgAygLMjcubX'
    'BjX3dhbGxldC5SZWZyZXNoU3RlcDJSZXNwb25zZS5BbGxSb3VuZDFQYWNrYWdlc0VudHJ5UhFh'
    'bGxSb3VuZDFQYWNrYWdlcxpEChZBbGxSb3VuZDFQYWNrYWdlc0VudHJ5EhAKA2tleRgBIAEoCV'
    'IDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use refreshStep3RequestDescriptor instead')
const RefreshStep3Request$json = {
  '1': 'RefreshStep3Request',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 12, '10': 'identifier'},
    {
      '1': 'round2_packages_for_others',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.RefreshStep3Request.Round2PackagesForOthersEntry',
      '10': 'round2PackagesForOthers'
    },
  ],
  '3': [RefreshStep3Request_Round2PackagesForOthersEntry$json],
};

@$core.Deprecated('Use refreshStep3RequestDescriptor instead')
const RefreshStep3Request_Round2PackagesForOthersEntry$json = {
  '1': 'Round2PackagesForOthersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RefreshStep3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep3RequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoU3RlcDNSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHgoKaW'
    'RlbnRpZmllchgCIAEoDFIKaWRlbnRpZmllchJ5Chpyb3VuZDJfcGFja2FnZXNfZm9yX290aGVy'
    'cxgDIAMoCzI8Lm1wY193YWxsZXQuUmVmcmVzaFN0ZXAzUmVxdWVzdC5Sb3VuZDJQYWNrYWdlc0'
    'Zvck90aGVyc0VudHJ5Uhdyb3VuZDJQYWNrYWdlc0Zvck90aGVycxpKChxSb3VuZDJQYWNrYWdl'
    'c0Zvck90aGVyc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZT'
    'oCOAE=');

@$core.Deprecated('Use refreshStep3ResponseDescriptor instead')
const RefreshStep3Response$json = {
  '1': 'RefreshStep3Response',
  '2': [
    {
      '1': 'round2_packages_for_me',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.RefreshStep3Response.Round2PackagesForMeEntry',
      '10': 'round2PackagesForMe'
    },
  ],
  '3': [RefreshStep3Response_Round2PackagesForMeEntry$json],
};

@$core.Deprecated('Use refreshStep3ResponseDescriptor instead')
const RefreshStep3Response_Round2PackagesForMeEntry$json = {
  '1': 'Round2PackagesForMeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RefreshStep3Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshStep3ResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoU3RlcDNSZXNwb25zZRJuChZyb3VuZDJfcGFja2FnZXNfZm9yX21lGAEgAygLMj'
    'kubXBjX3dhbGxldC5SZWZyZXNoU3RlcDNSZXNwb25zZS5Sb3VuZDJQYWNrYWdlc0Zvck1lRW50'
    'cnlSE3JvdW5kMlBhY2thZ2VzRm9yTWUaRgoYUm91bmQyUGFja2FnZXNGb3JNZUVudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use createSpendingPolicyRequestDescriptor instead')
const CreateSpendingPolicyRequest$json = {
  '1': 'CreateSpendingPolicyRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'threshold_sats', '3': 2, '4': 1, '5': 3, '10': 'thresholdSats'},
    {'1': 'start_time', '3': 3, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'interval_seconds', '3': 4, '4': 1, '5': 3, '10': 'intervalSeconds'},
  ],
};

/// Descriptor for `CreateSpendingPolicyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSpendingPolicyRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVTcGVuZGluZ1BvbGljeVJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2'
    'VJZBIlCg50aHJlc2hvbGRfc2F0cxgCIAEoA1INdGhyZXNob2xkU2F0cxIdCgpzdGFydF90aW1l'
    'GAMgASgDUglzdGFydFRpbWUSKQoQaW50ZXJ2YWxfc2Vjb25kcxgEIAEoA1IPaW50ZXJ2YWxTZW'
    'NvbmRz');

@$core.Deprecated('Use createSpendingPolicyResponseDescriptor instead')
const CreateSpendingPolicyResponse$json = {
  '1': 'CreateSpendingPolicyResponse',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 9, '10': 'policyId'},
    {
      '1': 'allocated_key_index',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'allocatedKeyIndex'
    },
  ],
};

/// Descriptor for `CreateSpendingPolicyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSpendingPolicyResponseDescriptor =
    $convert.base64Decode(
        'ChxDcmVhdGVTcGVuZGluZ1BvbGljeVJlc3BvbnNlEhsKCXBvbGljeV9pZBgBIAEoCVIIcG9saW'
        'N5SWQSLgoTYWxsb2NhdGVkX2tleV9pbmRleBgCIAEoBVIRYWxsb2NhdGVkS2V5SW5kZXg=');

@$core.Deprecated('Use getPolicyIdRequestDescriptor instead')
const GetPolicyIdRequest$json = {
  '1': 'GetPolicyIdRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'tx_message', '3': 2, '4': 1, '5': 12, '10': 'txMessage'},
  ],
};

/// Descriptor for `GetPolicyIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPolicyIdRequestDescriptor = $convert.base64Decode(
    'ChJHZXRQb2xpY3lJZFJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIdCgp0eF'
    '9tZXNzYWdlGAIgASgMUgl0eE1lc3NhZ2U=');

@$core.Deprecated('Use getPolicyIdResponseDescriptor instead')
const GetPolicyIdResponse$json = {
  '1': 'GetPolicyIdResponse',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 9, '10': 'policyId'},
  ],
};

/// Descriptor for `GetPolicyIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPolicyIdResponseDescriptor =
    $convert.base64Decode(
        'ChNHZXRQb2xpY3lJZFJlc3BvbnNlEhsKCXBvbGljeV9pZBgBIAEoCVIIcG9saWN5SWQ=');

@$core.Deprecated('Use broadcastTransactionRequestDescriptor instead')
const BroadcastTransactionRequest$json = {
  '1': 'BroadcastTransactionRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'tx_hex', '3': 2, '4': 1, '5': 9, '10': 'txHex'},
  ],
};

/// Descriptor for `BroadcastTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionRequestDescriptor =
    $convert.base64Decode(
        'ChtCcm9hZGNhc3RUcmFuc2FjdGlvblJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2'
        'VJZBIVCgZ0eF9oZXgYAiABKAlSBXR4SGV4');

@$core.Deprecated('Use broadcastTransactionResponseDescriptor instead')
const BroadcastTransactionResponse$json = {
  '1': 'BroadcastTransactionResponse',
  '2': [
    {'1': 'tx_id', '3': 1, '4': 1, '5': 9, '10': 'txId'},
  ],
};

/// Descriptor for `BroadcastTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChxCcm9hZGNhc3RUcmFuc2FjdGlvblJlc3BvbnNlEhMKBXR4X2lkGAEgASgJUgR0eElk');

@$core.Deprecated('Use fetchHistoryRequestDescriptor instead')
const FetchHistoryRequest$json = {
  '1': 'FetchHistoryRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `FetchHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchHistoryRequestDescriptor =
    $convert.base64Decode(
        'ChNGZXRjaEhpc3RvcnlSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use fetchHistoryResponseDescriptor instead')
const FetchHistoryResponse$json = {
  '1': 'FetchHistoryResponse',
  '2': [
    {
      '1': 'utxos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.UtxoInfo',
      '10': 'utxos'
    },
  ],
};

/// Descriptor for `FetchHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchHistoryResponseDescriptor = $convert.base64Decode(
    'ChRGZXRjaEhpc3RvcnlSZXNwb25zZRIqCgV1dHhvcxgBIAMoCzIULm1wY193YWxsZXQuVXR4b0'
    'luZm9SBXV0eG9z');

@$core.Deprecated('Use subscribeToHistoryRequestDescriptor instead')
const SubscribeToHistoryRequest$json = {
  '1': 'SubscribeToHistoryRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `SubscribeToHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToHistoryRequestDescriptor =
    $convert.base64Decode(
        'ChlTdWJzY3JpYmVUb0hpc3RvcnlSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSW'
        'Q=');

@$core.Deprecated('Use transactionNotificationDescriptor instead')
const TransactionNotification$json = {
  '1': 'TransactionNotification',
  '2': [
    {'1': 'tx_hash', '3': 1, '4': 1, '5': 9, '10': 'txHash'},
    {'1': 'height', '3': 2, '4': 1, '5': 5, '10': 'height'},
    {
      '1': 'added_utxos',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.UtxoInfo',
      '10': 'addedUtxos'
    },
    {
      '1': 'spent_utxos',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.mpc_wallet.UtxoInfo',
      '10': 'spentUtxos'
    },
  ],
};

/// Descriptor for `TransactionNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionNotificationDescriptor = $convert.base64Decode(
    'ChdUcmFuc2FjdGlvbk5vdGlmaWNhdGlvbhIXCgd0eF9oYXNoGAEgASgJUgZ0eEhhc2gSFgoGaG'
    'VpZ2h0GAIgASgFUgZoZWlnaHQSNQoLYWRkZWRfdXR4b3MYAyADKAsyFC5tcGNfd2FsbGV0LlV0'
    'eG9JbmZvUgphZGRlZFV0eG9zEjUKC3NwZW50X3V0eG9zGAQgAygLMhQubXBjX3dhbGxldC5VdH'
    'hvSW5mb1IKc3BlbnRVdHhvcw==');
