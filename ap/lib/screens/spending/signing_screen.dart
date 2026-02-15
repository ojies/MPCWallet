import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/stepper_widget.dart';
import 'package:provider/provider.dart';
import '../../services/mpc_service.dart';

class SigningScreen extends StatefulWidget {
  final Map<String, dynamic> extras;
  const SigningScreen({super.key, this.extras = const {}});

  @override
  State<SigningScreen> createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {
  int _currentStep = 0;
  final List<String> _steps = ['Client Sign', 'Server Co-sign', 'Broadcast'];

  @override
  void initState() {
    super.initState();
    _startSigning();
  }

  void _startSigning() async {
    final mpcService = context.read<MpcService>();
    final wallet = mpcService.wallet;

    if (wallet == null || !mpcService.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wallet not initialized!')),
      );
      return;
    }

    try {
      // Step 1: Build
      setState(() => _currentStep = 0);
      await Future.delayed(const Duration(milliseconds: 500));

      final destination = widget.extras['address'] as String?;
      final amountStr = widget.extras['amount'] as String?;
      final isBtc = widget.extras['isBtc'] as bool? ?? true;

      if (destination == null || amountStr == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid transaction details!')),
          );
          context.pop();
        }
        return;
      }

      BigInt amount;
      try {
        // We receiving 'amount' as String representing Sats (integer) from SendScreen
        amount = BigInt.parse(amountStr);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid amount format!')),
          );
          context.pop();
        }
        return;
      }

      // Step 0: Sync and Balance Check
      // Providing feedback to user
      // We rely on background sync mostly, but let's do a quick sync or at least refresh from store?
      // wallet.sync() does network calls.
      try {
        await wallet.sync();
      } catch (e) {
        print("Sync failed before sign: $e");
        // Continue? Yes, maybe we have UTXOs cached.
      }

      final balance = await wallet.getBalance();
      // Estimate fee (e.g. 500 sats) just for check
      if (amount + BigInt.from(500) > balance) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Insufficient funds! Balance: $balance sats')),
          );
          context.pop();
        }
        return;
      }

      // Creating transaction
      // Note: createTransaction does internal coin selection and fee estimation
      final unsigned = await wallet.createTransaction(
        destination: destination,
        amount: amount,
        feeRate: 1, // 1 sat/vbyte for Testnet/Regtest
      );

      // Step 2: Sign
      setState(() => _currentStep = 1);
      await Future.delayed(const Duration(milliseconds: 500));

      final txHex = await wallet.signTransaction(unsigned);

      // Step 3: Broadcast
      setState(() => _currentStep = 2);
      await Future.delayed(const Duration(milliseconds: 500));

      final txId = await wallet.broadcast(txHex);

      // Done
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Success! Tx Sent.'),
            action: SnackBarAction(
              label: 'View',
              onPressed: () {
                // TODO: Show Tx details dialog
              },
            ),
            backgroundColor: Colors.green,
          ),
        );
        // Go home and refresh
        context.read<MpcService>().refreshHistory();
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Transaction Failed: $e'),
              backgroundColor: Colors.red),
        );
        // Don't pop, let user retry or see error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signing Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            DkgStepper(currentStep: _currentStep, steps: _steps),
            const Spacer(),
            if (_currentStep == 0) const Text('Signing with your Key Share...'),
            if (_currentStep == 1)
              const Text('Waiting for Server Co-Signature...'),
            if (_currentStep == 2) const Text('Verifying & Broadcasting...'),
            const SizedBox(height: 32),
            const CircularProgressIndicator(color: Colors.white),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
