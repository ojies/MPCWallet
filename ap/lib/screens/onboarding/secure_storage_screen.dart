import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SecureStorageScreen extends StatefulWidget {
  const SecureStorageScreen({super.key});

  @override
  State<SecureStorageScreen> createState() => _SecureStorageScreenState();
}

class _SecureStorageScreenState extends State<SecureStorageScreen> {
  bool _isSecuring = false;

  void _secureRecoveryKey() async {
    setState(() {
      _isSecuring = true;
    });

    // Simulate secure storage operation (e.g. biometric auth + encryption)
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isSecuring = false;
      });
      // Show confirmation dialog or snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recovery Key secured successfully')),
      );
      context.push('/onboarding/ready');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backup Recovery Key')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.shield_outlined, size: 64, color: Colors.white),
            const SizedBox(height: 24),
            Text(
              'Secure Your Recovery Key',
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'The Recovery Key is used ONLY to update spending policies (e.g. changing the daily limit or PIN).\n\nIt will be stored securely in your Google Drive, protected by your device authentication.',
              style: GoogleFonts.inter(color: Colors.white70, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                border: Border.all(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.redAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Do not uninstall the app before ensuring you have a backup of this key.',
                      style: GoogleFonts.inter(
                          color: Colors.redAccent, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _isSecuring ? null : _secureRecoveryKey,
              icon: _isSecuring
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.lock_outline),
              label: Text(
                  _isSecuring ? 'Securing...' : 'Secure with Google Drive'),
            ),
          ],
        ),
      ),
    );
  }
}
