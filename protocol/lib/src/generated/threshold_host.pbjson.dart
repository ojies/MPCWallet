///
//  Generated code. Do not modify.
//  source: threshold_host.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use userIdRequestDescriptor instead')
const UserIdRequest$json = const {
  '1': 'UserIdRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `UserIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userIdRequestDescriptor = $convert.base64Decode('Cg1Vc2VySWRSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use stringRequestDescriptor instead')
const StringRequest$json = const {
  '1': 'StringRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `StringRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringRequestDescriptor = $convert.base64Decode('Cg1TdHJpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBISCgRkYXRhGAIgASgJUgRkYXRh');
@$core.Deprecated('Use bytesRequestDescriptor instead')
const BytesRequest$json = const {
  '1': 'BytesRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `BytesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bytesRequestDescriptor = $convert.base64Decode('CgxCeXRlc1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhIKBGRhdGEYAiABKAxSBGRhdGE=');
@$core.Deprecated('Use stringResponseDescriptor instead')
const StringResponse$json = const {
  '1': 'StringResponse',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `StringResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringResponseDescriptor = $convert.base64Decode('Cg5TdHJpbmdSZXNwb25zZRISCgRkYXRhGAEgASgJUgRkYXRh');
@$core.Deprecated('Use boolResponseDescriptor instead')
const BoolResponse$json = const {
  '1': 'BoolResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
  ],
};

/// Descriptor for `BoolResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boolResponseDescriptor = $convert.base64Decode('CgxCb29sUmVzcG9uc2USFgoGcmVzdWx0GAEgASgIUgZyZXN1bHQ=');
@$core.Deprecated('Use dkgPart1RequestDescriptor instead')
const DkgPart1Request$json = const {
  '1': 'DkgPart1Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'max_signers', '3': 2, '4': 1, '5': 13, '10': 'maxSigners'},
    const {'1': 'min_signers', '3': 3, '4': 1, '5': 13, '10': 'minSigners'},
    const {'1': 'secret_hex', '3': 4, '4': 1, '5': 9, '10': 'secretHex'},
    const {'1': 'coefficients_json', '3': 5, '4': 1, '5': 9, '10': 'coefficientsJson'},
  ],
};

/// Descriptor for `DkgPart1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart1RequestDescriptor = $convert.base64Decode('Cg9Ea2dQYXJ0MVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh8KC21heF9zaWduZXJzGAIgASgNUgptYXhTaWduZXJzEh8KC21pbl9zaWduZXJzGAMgASgNUgptaW5TaWduZXJzEh0KCnNlY3JldF9oZXgYBCABKAlSCXNlY3JldEhleBIrChFjb2VmZmljaWVudHNfanNvbhgFIAEoCVIQY29lZmZpY2llbnRzSnNvbg==');
@$core.Deprecated('Use dkgPart1ResponseDescriptor instead')
const DkgPart1Response$json = const {
  '1': 'DkgPart1Response',
  '2': const [
    const {'1': 'round1_package_json', '3': 1, '4': 1, '5': 9, '10': 'round1PackageJson'},
  ],
};

/// Descriptor for `DkgPart1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart1ResponseDescriptor = $convert.base64Decode('ChBEa2dQYXJ0MVJlc3BvbnNlEi4KE3JvdW5kMV9wYWNrYWdlX2pzb24YASABKAlSEXJvdW5kMVBhY2thZ2VKc29u');
@$core.Deprecated('Use dkgPart2RequestDescriptor instead')
const DkgPart2Request$json = const {
  '1': 'DkgPart2Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'round1_packages_json', '3': 2, '4': 1, '5': 9, '10': 'round1PackagesJson'},
    const {'1': 'receiver_ids_json', '3': 3, '4': 1, '5': 9, '10': 'receiverIdsJson'},
  ],
};

/// Descriptor for `DkgPart2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart2RequestDescriptor = $convert.base64Decode('Cg9Ea2dQYXJ0MlJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEjAKFHJvdW5kMV9wYWNrYWdlc19qc29uGAIgASgJUhJyb3VuZDFQYWNrYWdlc0pzb24SKgoRcmVjZWl2ZXJfaWRzX2pzb24YAyABKAlSD3JlY2VpdmVySWRzSnNvbg==');
@$core.Deprecated('Use dkgPart2ResponseDescriptor instead')
const DkgPart2Response$json = const {
  '1': 'DkgPart2Response',
  '2': const [
    const {'1': 'round2_packages_json', '3': 1, '4': 1, '5': 9, '10': 'round2PackagesJson'},
  ],
};

/// Descriptor for `DkgPart2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart2ResponseDescriptor = $convert.base64Decode('ChBEa2dQYXJ0MlJlc3BvbnNlEjAKFHJvdW5kMl9wYWNrYWdlc19qc29uGAEgASgJUhJyb3VuZDJQYWNrYWdlc0pzb24=');
@$core.Deprecated('Use dkgPart3RequestDescriptor instead')
const DkgPart3Request$json = const {
  '1': 'DkgPart3Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'round1_packages_json', '3': 2, '4': 1, '5': 9, '10': 'round1PackagesJson'},
    const {'1': 'round2_packages_json', '3': 3, '4': 1, '5': 9, '10': 'round2PackagesJson'},
    const {'1': 'receiver_ids_json', '3': 4, '4': 1, '5': 9, '10': 'receiverIdsJson'},
  ],
};

/// Descriptor for `DkgPart3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart3RequestDescriptor = $convert.base64Decode('Cg9Ea2dQYXJ0M1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEjAKFHJvdW5kMV9wYWNrYWdlc19qc29uGAIgASgJUhJyb3VuZDFQYWNrYWdlc0pzb24SMAoUcm91bmQyX3BhY2thZ2VzX2pzb24YAyABKAlSEnJvdW5kMlBhY2thZ2VzSnNvbhIqChFyZWNlaXZlcl9pZHNfanNvbhgEIAEoCVIPcmVjZWl2ZXJJZHNKc29u');
@$core.Deprecated('Use dkgPart3ReceiveRequestDescriptor instead')
const DkgPart3ReceiveRequest$json = const {
  '1': 'DkgPart3ReceiveRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'my_id_hex', '3': 2, '4': 1, '5': 9, '10': 'myIdHex'},
    const {'1': 'dealer_r1_json', '3': 3, '4': 1, '5': 9, '10': 'dealerR1Json'},
    const {'1': 'shares_json', '3': 4, '4': 1, '5': 9, '10': 'sharesJson'},
    const {'1': 'min_signers', '3': 5, '4': 1, '5': 13, '10': 'minSigners'},
    const {'1': 'max_signers', '3': 6, '4': 1, '5': 13, '10': 'maxSigners'},
    const {'1': 'all_ids_json', '3': 7, '4': 1, '5': 9, '10': 'allIdsJson'},
  ],
};

/// Descriptor for `DkgPart3ReceiveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart3ReceiveRequestDescriptor = $convert.base64Decode('ChZEa2dQYXJ0M1JlY2VpdmVSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIaCglteV9pZF9oZXgYAiABKAlSB215SWRIZXgSJAoOZGVhbGVyX3IxX2pzb24YAyABKAlSDGRlYWxlclIxSnNvbhIfCgtzaGFyZXNfanNvbhgEIAEoCVIKc2hhcmVzSnNvbhIfCgttaW5fc2lnbmVycxgFIAEoDVIKbWluU2lnbmVycxIfCgttYXhfc2lnbmVycxgGIAEoDVIKbWF4U2lnbmVycxIgCgxhbGxfaWRzX2pzb24YByABKAlSCmFsbElkc0pzb24=');
@$core.Deprecated('Use dkgPart3ResponseDescriptor instead')
const DkgPart3Response$json = const {
  '1': 'DkgPart3Response',
  '2': const [
    const {'1': 'key_package_json', '3': 1, '4': 1, '5': 9, '10': 'keyPackageJson'},
    const {'1': 'public_key_package_json', '3': 2, '4': 1, '5': 9, '10': 'publicKeyPackageJson'},
  ],
};

/// Descriptor for `DkgPart3Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgPart3ResponseDescriptor = $convert.base64Decode('ChBEa2dQYXJ0M1Jlc3BvbnNlEigKEGtleV9wYWNrYWdlX2pzb24YASABKAlSDmtleVBhY2thZ2VKc29uEjUKF3B1YmxpY19rZXlfcGFja2FnZV9qc29uGAIgASgJUhRwdWJsaWNLZXlQYWNrYWdlSnNvbg==');
@$core.Deprecated('Use dkgRefreshPart1RequestDescriptor instead')
const DkgRefreshPart1Request$json = const {
  '1': 'DkgRefreshPart1Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'id_hex', '3': 2, '4': 1, '5': 9, '10': 'idHex'},
    const {'1': 'max_signers', '3': 3, '4': 1, '5': 13, '10': 'maxSigners'},
    const {'1': 'min_signers', '3': 4, '4': 1, '5': 13, '10': 'minSigners'},
    const {'1': 'seed', '3': 5, '4': 1, '5': 12, '10': 'seed'},
  ],
};

/// Descriptor for `DkgRefreshPart1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRefreshPart1RequestDescriptor = $convert.base64Decode('ChZEa2dSZWZyZXNoUGFydDFSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIVCgZpZF9oZXgYAiABKAlSBWlkSGV4Eh8KC21heF9zaWduZXJzGAMgASgNUgptYXhTaWduZXJzEh8KC21pbl9zaWduZXJzGAQgASgNUgptaW5TaWduZXJzEhIKBHNlZWQYBSABKAxSBHNlZWQ=');
@$core.Deprecated('Use dkgRefreshPart1ResponseDescriptor instead')
const DkgRefreshPart1Response$json = const {
  '1': 'DkgRefreshPart1Response',
  '2': const [
    const {'1': 'round1_package_json', '3': 1, '4': 1, '5': 9, '10': 'round1PackageJson'},
    const {'1': 'coefficients_json', '3': 2, '4': 1, '5': 9, '10': 'coefficientsJson'},
  ],
};

/// Descriptor for `DkgRefreshPart1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRefreshPart1ResponseDescriptor = $convert.base64Decode('ChdEa2dSZWZyZXNoUGFydDFSZXNwb25zZRIuChNyb3VuZDFfcGFja2FnZV9qc29uGAEgASgJUhFyb3VuZDFQYWNrYWdlSnNvbhIrChFjb2VmZmljaWVudHNfanNvbhgCIAEoCVIQY29lZmZpY2llbnRzSnNvbg==');
@$core.Deprecated('Use dkgRefreshPart2RequestDescriptor instead')
const DkgRefreshPart2Request$json = const {
  '1': 'DkgRefreshPart2Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'round1_packages_json', '3': 2, '4': 1, '5': 9, '10': 'round1PackagesJson'},
  ],
};

/// Descriptor for `DkgRefreshPart2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRefreshPart2RequestDescriptor = $convert.base64Decode('ChZEa2dSZWZyZXNoUGFydDJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIwChRyb3VuZDFfcGFja2FnZXNfanNvbhgCIAEoCVIScm91bmQxUGFja2FnZXNKc29u');
@$core.Deprecated('Use dkgRefreshPart2ResponseDescriptor instead')
const DkgRefreshPart2Response$json = const {
  '1': 'DkgRefreshPart2Response',
  '2': const [
    const {'1': 'round2_packages_json', '3': 1, '4': 1, '5': 9, '10': 'round2PackagesJson'},
  ],
};

/// Descriptor for `DkgRefreshPart2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRefreshPart2ResponseDescriptor = $convert.base64Decode('ChdEa2dSZWZyZXNoUGFydDJSZXNwb25zZRIwChRyb3VuZDJfcGFja2FnZXNfanNvbhgBIAEoCVIScm91bmQyUGFja2FnZXNKc29u');
@$core.Deprecated('Use dkgRefreshPart3RequestDescriptor instead')
const DkgRefreshPart3Request$json = const {
  '1': 'DkgRefreshPart3Request',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'round1_packages_json', '3': 2, '4': 1, '5': 9, '10': 'round1PackagesJson'},
    const {'1': 'round2_packages_json', '3': 3, '4': 1, '5': 9, '10': 'round2PackagesJson'},
    const {'1': 'old_pkp_json', '3': 4, '4': 1, '5': 9, '10': 'oldPkpJson'},
    const {'1': 'old_kp_json', '3': 5, '4': 1, '5': 9, '10': 'oldKpJson'},
  ],
};

/// Descriptor for `DkgRefreshPart3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRefreshPart3RequestDescriptor = $convert.base64Decode('ChZEa2dSZWZyZXNoUGFydDNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIwChRyb3VuZDFfcGFja2FnZXNfanNvbhgCIAEoCVIScm91bmQxUGFja2FnZXNKc29uEjAKFHJvdW5kMl9wYWNrYWdlc19qc29uGAMgASgJUhJyb3VuZDJQYWNrYWdlc0pzb24SIAoMb2xkX3BrcF9qc29uGAQgASgJUgpvbGRQa3BKc29uEh4KC29sZF9rcF9qc29uGAUgASgJUglvbGRLcEpzb24=');
@$core.Deprecated('Use newNonceRequestDescriptor instead')
const NewNonceRequest$json = const {
  '1': 'NewNonceRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'secret_hex', '3': 2, '4': 1, '5': 9, '10': 'secretHex'},
  ],
};

/// Descriptor for `NewNonceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newNonceRequestDescriptor = $convert.base64Decode('Cg9OZXdOb25jZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnNlY3JldF9oZXgYAiABKAlSCXNlY3JldEhleA==');
@$core.Deprecated('Use newNonceResponseDescriptor instead')
const NewNonceResponse$json = const {
  '1': 'NewNonceResponse',
  '2': const [
    const {'1': 'commitments_json', '3': 1, '4': 1, '5': 9, '10': 'commitmentsJson'},
  ],
};

/// Descriptor for `NewNonceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newNonceResponseDescriptor = $convert.base64Decode('ChBOZXdOb25jZVJlc3BvbnNlEikKEGNvbW1pdG1lbnRzX2pzb24YASABKAlSD2NvbW1pdG1lbnRzSnNvbg==');
@$core.Deprecated('Use frostSignRequestDescriptor instead')
const FrostSignRequest$json = const {
  '1': 'FrostSignRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'signing_package_json', '3': 2, '4': 1, '5': 9, '10': 'signingPackageJson'},
    const {'1': 'key_package_json', '3': 3, '4': 1, '5': 9, '10': 'keyPackageJson'},
  ],
};

/// Descriptor for `FrostSignRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostSignRequestDescriptor = $convert.base64Decode('ChBGcm9zdFNpZ25SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIwChRzaWduaW5nX3BhY2thZ2VfanNvbhgCIAEoCVISc2lnbmluZ1BhY2thZ2VKc29uEigKEGtleV9wYWNrYWdlX2pzb24YAyABKAlSDmtleVBhY2thZ2VKc29u');
@$core.Deprecated('Use frostAggregateRequestDescriptor instead')
const FrostAggregateRequest$json = const {
  '1': 'FrostAggregateRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'signing_package_json', '3': 2, '4': 1, '5': 9, '10': 'signingPackageJson'},
    const {'1': 'shares_json', '3': 3, '4': 1, '5': 9, '10': 'sharesJson'},
    const {'1': 'public_key_package_json', '3': 4, '4': 1, '5': 9, '10': 'publicKeyPackageJson'},
  ],
};

/// Descriptor for `FrostAggregateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostAggregateRequestDescriptor = $convert.base64Decode('ChVGcm9zdEFnZ3JlZ2F0ZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEjAKFHNpZ25pbmdfcGFja2FnZV9qc29uGAIgASgJUhJzaWduaW5nUGFja2FnZUpzb24SHwoLc2hhcmVzX2pzb24YAyABKAlSCnNoYXJlc0pzb24SNQoXcHVibGljX2tleV9wYWNrYWdlX2pzb24YBCABKAlSFHB1YmxpY0tleVBhY2thZ2VKc29u');
@$core.Deprecated('Use keyTweakRequestDescriptor instead')
const KeyTweakRequest$json = const {
  '1': 'KeyTweakRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'json_data', '3': 2, '4': 1, '5': 9, '10': 'jsonData'},
    const {'1': 'merkle_root', '3': 3, '4': 1, '5': 12, '10': 'merkleRoot'},
  ],
};

/// Descriptor for `KeyTweakRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyTweakRequestDescriptor = $convert.base64Decode('Cg9LZXlUd2Vha1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhsKCWpzb25fZGF0YRgCIAEoCVIIanNvbkRhdGESHwoLbWVya2xlX3Jvb3QYAyABKAxSCm1lcmtsZVJvb3Q=');
@$core.Deprecated('Use authSignerCreateRequestDescriptor instead')
const AuthSignerCreateRequest$json = const {
  '1': 'AuthSignerCreateRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'secret_hex', '3': 2, '4': 1, '5': 9, '10': 'secretHex'},
  ],
};

/// Descriptor for `AuthSignerCreateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authSignerCreateRequestDescriptor = $convert.base64Decode('ChdBdXRoU2lnbmVyQ3JlYXRlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHQoKc2VjcmV0X2hleBgCIAEoCVIJc2VjcmV0SGV4');
@$core.Deprecated('Use authSignerCreateResponseDescriptor instead')
const AuthSignerCreateResponse$json = const {
  '1': 'AuthSignerCreateResponse',
  '2': const [
    const {'1': 'public_key_hex', '3': 1, '4': 1, '5': 9, '10': 'publicKeyHex'},
  ],
};

/// Descriptor for `AuthSignerCreateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authSignerCreateResponseDescriptor = $convert.base64Decode('ChhBdXRoU2lnbmVyQ3JlYXRlUmVzcG9uc2USJAoOcHVibGljX2tleV9oZXgYASABKAlSDHB1YmxpY0tleUhleA==');
@$core.Deprecated('Use authSignerSignRequestDescriptor instead')
const AuthSignerSignRequest$json = const {
  '1': 'AuthSignerSignRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
  ],
};

/// Descriptor for `AuthSignerSignRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authSignerSignRequestDescriptor = $convert.base64Decode('ChVBdXRoU2lnbmVyU2lnblJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhgKB21lc3NhZ2UYAiABKAxSB21lc3NhZ2U=');
@$core.Deprecated('Use verifySignatureRequestDescriptor instead')
const VerifySignatureRequest$json = const {
  '1': 'VerifySignatureRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'pk_hex', '3': 2, '4': 1, '5': 9, '10': 'pkHex'},
    const {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
    const {'1': 'sig_hex', '3': 4, '4': 1, '5': 9, '10': 'sigHex'},
  ],
};

/// Descriptor for `VerifySignatureRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifySignatureRequestDescriptor = $convert.base64Decode('ChZWZXJpZnlTaWduYXR1cmVSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIVCgZwa19oZXgYAiABKAlSBXBrSGV4EhgKB21lc3NhZ2UYAyABKAxSB21lc3NhZ2USFwoHc2lnX2hleBgEIAEoCVIGc2lnSGV4');
@$core.Deprecated('Use generateCoefficientsRequestDescriptor instead')
const GenerateCoefficientsRequest$json = const {
  '1': 'GenerateCoefficientsRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
    const {'1': 'seed', '3': 3, '4': 1, '5': 12, '10': 'seed'},
  ],
};

/// Descriptor for `GenerateCoefficientsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateCoefficientsRequestDescriptor = $convert.base64Decode('ChtHZW5lcmF0ZUNvZWZmaWNpZW50c1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBWNvdW50GAIgASgNUgVjb3VudBISCgRzZWVkGAMgASgMUgRzZWVk');
@$core.Deprecated('Use evaluatePolynomialRequestDescriptor instead')
const EvaluatePolynomialRequest$json = const {
  '1': 'EvaluatePolynomialRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'id_hex', '3': 2, '4': 1, '5': 9, '10': 'idHex'},
    const {'1': 'coefficients_json', '3': 3, '4': 1, '5': 9, '10': 'coefficientsJson'},
  ],
};

/// Descriptor for `EvaluatePolynomialRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List evaluatePolynomialRequestDescriptor = $convert.base64Decode('ChlFdmFsdWF0ZVBvbHlub21pYWxSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIVCgZpZF9oZXgYAiABKAlSBWlkSGV4EisKEWNvZWZmaWNpZW50c19qc29uGAMgASgJUhBjb2VmZmljaWVudHNKc29u');
@$core.Deprecated('Use elemBaseMulRequestDescriptor instead')
const ElemBaseMulRequest$json = const {
  '1': 'ElemBaseMulRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'scalar_hex', '3': 2, '4': 1, '5': 9, '10': 'scalarHex'},
  ],
};

/// Descriptor for `ElemBaseMulRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List elemBaseMulRequestDescriptor = $convert.base64Decode('ChJFbGVtQmFzZU11bFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnNjYWxhcl9oZXgYAiABKAlSCXNjYWxhckhleA==');
