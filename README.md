# MPCWallet

A **Multi-Party Computation (MPC) Wallet** implementation using **threshold cryptography** to create a secure, distributed cryptocurrency wallet system. Built with Dart and leveraging secp256k1 elliptic curve cryptography.

## Overview

MPCWallet enables multiple parties to jointly control a cryptocurrency wallet without any single party ever possessing the complete private key. This eliminates single points of failure and enhances security through distributed trust.

### Key Features

- 🔐 **Threshold Signatures**: Require M-of-N participants to authorize transactions (e.g., 2-of-3)
- 🤝 **Distributed Key Generation (DKG)**: Generate shared secrets without any party learning the full key
- ✅ **Verifiable Secret Sharing (VSS)**: Pedersen's VSS ensures integrity of shared secrets
- 🔄 **Key Refresh**: Update key shares without changing the master public key
- 📡 **gRPC Communication**: Efficient client-server protocol for coordination
- 🔗 **secp256k1 Support**: Compatible with Bitcoin, Ethereum, and other blockchain systems

## Architecture

```
MPCWallet/
├── threshold/          # Core cryptography library (DKG, FROST, secp256k1)
├── client/            # Dart client managing participant shares
├── server/            # Coordination server for DKG and signing rounds
├── protocol/          # Generated gRPC protocol code
├── protos/            # Protocol buffer definitions
├── e2e/               # End-to-end tests
└── dart/              # Additional Dart utilities
```

### Components

#### 1. **Threshold Library** (`threshold/`)
Core cryptographic primitives implementing:
- **DKG Protocol**: 3-round distributed key generation
- **FROST Signatures**: Flexible Round-Optimized Schnorr Threshold signatures
- **secp256k1 Operations**: Elliptic curve arithmetic
- **Key Management**: Reconstruction and refresh capabilities

#### 2. **Client** (`client/`)
Dart client that:
- Manages multiple key shares (identities) per device
- Communicates with coordination server via gRPC
- Executes DKG and signing protocols
- Maintains session state and key packages

#### 3. **Server** (`server/`)
Coordination server facilitating:
- DKG rounds (Step 1, 2, 3)
- Signing rounds (Step 1, 2)
- Message routing between participants
- Session management by device ID

## How It Works

### Distributed Key Generation (DKG)

The wallet uses a 3-round DKG protocol:

**Round 1: Commitment Phase**
- Each participant generates a random secret and polynomial coefficients
- Participants create and exchange commitments (Round1Packages)

**Round 2: Share Distribution**
- Participants compute secret shares for each other participant
- Shares are distributed via the coordination server

**Round 3: Finalization**
- Participants verify received shares using VSS
- Each participant derives their KeyPackage (secret share)
- All participants derive the same group PublicKeyPackage

### Threshold Signing

Signing follows the FROST protocol:

**Step 1: Nonce Commitment**
- Each signing participant generates a random nonce
- Hiding and binding commitments are exchanged
- Message to sign is agreed upon

**Step 2: Signature Share Generation**
- Each participant computes their signature share
- Server aggregates shares into final signature (R, z)

**Verification**
- Signature is verified: `z·G = R + c·Y` where Y is the group public key

## Use Cases

MPCWallet is ideal for scenarios requiring enhanced security through distributed control:

- 💼 **Corporate Wallets**: Multi-signature approvals for company funds
- 🏦 **Custodial Services**: Eliminate single points of failure
- 👤 **Personal Security**: Distribute keys across multiple devices
- 🔒 **Cold Storage**: Geographic distribution of key shares
- 🛡️ **Compliance**: Enforce multi-party authorization policies

## Getting Started

### Prerequisites

- Dart SDK 2.17 or higher
- Protocol Buffers compiler (`protoc`)
- gRPC tools for Dart

### Installation

1. Clone the repository:
```bash
git clone https://github.com/BitspendPayment/MPCWallet.git
cd MPCWallet
```

2. Install dependencies:
```bash
cd threshold && dart pub get
cd ../client && dart pub get
cd ../server && dart pub get
```

3. Generate protocol buffers (if needed):
```bash
protoc --dart_out=grpc:protocol/lib/src -Iprotos protos/mpc_wallet.proto
```

### Quick Example

```dart
import 'package:grpc/grpc.dart';
import 'package:threshold/threshold.dart' as threshold;
import 'package:client/client.dart';

void main() async {
  // Connect to coordination server
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  // Create client with two identities (2-of-3 threshold)
  final id1 = threshold.identifierFromUint16(1);
  final id2 = threshold.identifierFromUint16(2);
  final client = MpcClient(channel, id1, id2, maxSigners: 3, minSigners: 2);

  // Perform DKG
  await client.doDkg();
  print('DKG completed! Group public key generated.');

  // Sign a message
  final message = utf8.encode('Hello, MPC World!');
  final isValid = await client.sign(Uint8List.fromList(message));
  print('Signature valid: $isValid');

  await channel.shutdown();
}
```

## Security Considerations

- ⚠️ **Network Security**: Use TLS for gRPC communication in production
- 🔑 **Key Storage**: Securely store KeyPackages (consider hardware security modules)
- 🔒 **Session Management**: Implement proper device authentication
- 🛡️ **Nonce Reuse**: Never reuse nonces in signing operations
- 📝 **Audit Logging**: Log all DKG and signing operations

## Testing

Run the test suite:

```bash
cd threshold && dart test
cd ../e2e && dart test
```

## Documentation

For detailed information about specific components:

- **Threshold Library**: See [`threshold/README.md`](threshold/README.md)
- **Protocol Specification**: See [`protos/mpc_wallet.proto`](protos/mpc_wallet.proto)
- **Client API**: See [`client/lib/client.dart`](client/lib/client.dart)

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is part of the Bitspend Payment ecosystem.

## References

- [FROST: Flexible Round-Optimized Schnorr Threshold Signatures](https://eprint.iacr.org/2020/852)
- [Pedersen's Verifiable Secret Sharing](https://link.springer.com/chapter/10.1007/3-540-46766-1_9)
- [secp256k1 Curve Specification](https://www.secg.org/sec2-v2.pdf)
