import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPolicyScreen extends StatefulWidget {
  const EditPolicyScreen({super.key});

  @override
  State<EditPolicyScreen> createState() => _EditPolicyScreenState();
}

class _EditPolicyScreenState extends State<EditPolicyScreen> {
  bool _isSigning = false;
  double _threshold = 100000000;
  String _interval = '24h';

  void _savePolicy() async {
    // 1. Auth Recovery Key
    bool authenticated = await _showRecoveryAuthDialog();
    if (!authenticated) return;

    // 2. Sign Update
    setState(() => _isSigning = true);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isSigning = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Policy Updated Successfully!')),
      );
      context.pop();
    }
  }

  Future<bool> _showRecoveryAuthDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.grey[900],
            title: Text('Authorize Recovery Key',
                style: GoogleFonts.inter(color: Colors.white)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.fingerprint, size: 64, color: Colors.white),
                const SizedBox(height: 16),
                Text(
                  'Authenticate to access your Recovery Key from secure storage.',
                  style: GoogleFonts.inter(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Authenticate'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Policy')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Spending Threshold (Sats)',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            Slider(
              value: _threshold,
              min: 10000000, // 0.1 BTC
              max: 1000000000, // 10 BTC
              divisions: 99,
              label: '${_threshold.toInt().toString()} Sats',
              onChanged: (value) => setState(() => _threshold = value),
            ),
            Text(
              '${_threshold.toInt().toString()} Sats',
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text('Reset Interval',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: '1h', label: Text('1 Hourly')),
                  ButtonSegment(value: '24h', label: Text('Daily')),
                  ButtonSegment(value: '7d', label: Text('Weekly')),
                ],
                selected: {
                  _interval
                },
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _interval = newSelection.first;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white;
                    }
                    return Colors.transparent;
                  }),
                  foregroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.black;
                    }
                    return Colors.white;
                  }),
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: _isSigning ? null : _savePolicy,
              child: _isSigning
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Sign & Update Policy'),
            )
          ],
        ),
      ),
    );
  }
}
