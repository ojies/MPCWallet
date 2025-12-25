import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/stepper_widget.dart';

class SigningScreen extends StatefulWidget {
  const SigningScreen({super.key});

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
    // Step 1: Client Sign
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _currentStep = 0);

    // Step 2: Request Co-Sign
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _currentStep = 1);

    // Step 3: Verify & Broadcast
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _currentStep = 2);

    // Done
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaction Broadcasted Successfully!')),
      );
      context.go('/');
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
