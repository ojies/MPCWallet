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
        if (isBtc) {
          amount = BigInt.from(double.parse(amountStr).round());
        } else {
          // Placeholder: USD conversion would go here
          amount = BigInt.from(1000);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid amount format!')),
          );
          context.pop();
        }
        return;
      }

      // Creating transaction (Syncs UTXOs first implicitly via init, but maybe ensure sync?)
      await wallet.sync();

      final unsigned = await wallet.createTransaction(
        destination: destination,
        amount: amount,
        feeRate: 1,
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
          SnackBar(content: Text('Success! TxId: ${txId.substring(0, 10)}...')),
        );
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
        // Navigate back or stay? Stay to show error.
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
