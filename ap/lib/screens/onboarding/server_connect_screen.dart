import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerConnectionScreen extends StatefulWidget {
  const ServerConnectionScreen({super.key});

  @override
  State<ServerConnectionScreen> createState() => _ServerConnectionScreenState();
}

class _ServerConnectionScreenState extends State<ServerConnectionScreen> {
  final TextEditingController _urlController = TextEditingController(
    text: 'https://mpc.merlin.io', // Default or placeholder
  );
  bool _isChecking = false;

  void _connect() async {
    setState(() {
      _isChecking = true;
    });

    // Simulate network check
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        _isChecking = false;
      });
      context.push('/onboarding/dkg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect to Server')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Co-signing Server',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter the URL of the MPC co-signing server.',
              style: GoogleFonts.inter(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                prefixIcon: Icon(Icons.dns),
              ),
              style: GoogleFonts.inter(),
            ),
            const SizedBox(height: 16),
            // Environment selector could go here
            const Spacer(),
            ElevatedButton(
              onPressed: _isChecking ? null : _connect,
              child: _isChecking
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Connect & Start DKG'),
            ),
          ],
        ),
      ),
    );
  }
}
