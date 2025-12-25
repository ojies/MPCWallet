import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/stepper_widget.dart';

class DkgProgressScreen extends StatefulWidget {
  const DkgProgressScreen({super.key});

  @override
  State<DkgProgressScreen> createState() => _DkgProgressScreenState();
}

class _DkgProgressScreenState extends State<DkgProgressScreen> {
  int _currentStep = 0;
  final List<String> _steps = ['Session', 'Generate', 'Finalize'];
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _startDkg();
  }

  void _startDkg() async {
    // Simulate DKG steps
    await _addLog('Connecting to server...');
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _currentStep = 0);

    await _addLog('Establishing secure session...');
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _currentStep = 1);

    await _addLog('Generating secret shares...');
    await Future.delayed(const Duration(seconds: 1));
    await _addLog('Verifying shares with server...');
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _currentStep = 2);

    await _addLog('Finalizing wallet creation...');
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      context.push('/onboarding/secure_storage');
    }
  }

  Future<void> _addLog(String message) async {
    if (mounted) {
      setState(() {
        _logs.add(message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Creating Wallet')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              DkgStepper(currentStep: _currentStep, steps: _steps),
              const SizedBox(height: 32),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: ListView.builder(
                    itemCount: _logs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '> ${_logs[index]}',
                          style: GoogleFonts.firaCode(
                            fontSize: 12,
                            color: Colors.greenAccent,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              if (_currentStep < 2)
                const CircularProgressIndicator(color: Colors.white)
              else
                const Icon(Icons.check_circle,
                    color: Colors.greenAccent, size: 48),
            ],
          ),
        ),
      ),
    );
  }
}
