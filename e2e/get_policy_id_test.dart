import 'dart:typed_data';

import 'package:client/client.dart';
import 'package:grpc/grpc.dart';
import 'package:protocol/protocol.dart';
import 'package:server/persistence/store.dart';
import 'package:server/server.dart';
import 'package:server/state.dart';
import 'package:test/test.dart';
import 'package:threshold/threshold.dart' as threshold;

void main() {
  late Server server;
  late MPCWalletService service;
  late MpcClient client;
  late ClientChannel channel;

  setUp(() async {
    final dkgStore = DKGSessionStore();
    final policyStore = PolicyStore();
    final refreshStore = RefreshSessionStore();
    final signingStore = SigningSessionStore();
    final utxoStore = UtxoStore();

    await dkgStore.init();
    await policyStore.init();
    await refreshStore.init();
    await signingStore.init();
    await utxoStore.init();

    service = MPCWalletService(
        dkgStore: dkgStore,
        signingStore: signingStore,
        refreshStore: refreshStore,
        policyStore: policyStore,
        utxoStore: utxoStore);
    server = Server.create(services: [service]);
    await server.serve(port: 0);
    channel = ClientChannel(
      'localhost',
      port: server.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final id1 = threshold.Identifier(BigInt.from(1));
    final id2 = threshold.Identifier(BigInt.from(2));
    client = MpcClient(channel, id1, id2);
  });

  tearDown(() async {
    await channel.shutdown();
    await server.shutdown();
  });

  test('getPolicyId returns empty string for transaction under threshold',
      () async {
    // 1. Run DKG to initialize session
    await client.doDkg();

    // 2. Call getPolicyId with dummy transaction bytes
    final txBytes = Uint8List.fromList(
        [1, 2, 3, 4]); // Invalid TX, should result in 0 spent
    final policyId = await client.getPolicyId(txBytes);

    expect(policyId, equals(''));
  });
}
