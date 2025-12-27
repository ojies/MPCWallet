import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fixnum/fixnum.dart';
import '../../services/mpc_service.dart';

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
    // 1. Auth Recovery Key (Get PIN)
    String? pin = await _showRecoveryAuthDialog();
    if (pin == null || pin.isEmpty) return;

    final mpcService = context.read<MpcService>();
    if (mpcService.client == null) return; // Should notify user

    setState(() => _isSigning = true);

    try {
      Duration duration;
      switch (_interval) {
        case '1h':
          duration = const Duration(hours: 1);
          break;
        case '7d':
          duration = const Duration(days: 7);
          break;
        case '24h':
        default:
          duration = const Duration(hours: 24);
      }

      final amount = Int64(_threshold.toInt());

      await mpcService.client!.createSpendingPolicy(duration, amount, pin);

      if (mounted) {
        setState(() => _isSigning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Policy Updated Successfully!')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSigning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<String?> _showRecoveryAuthDialog() async {
    String pin = '';
    return await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text('Authorize Recovery Key',
            style: GoogleFonts.inter(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock, size: 48, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              'Enter your PIN to sign this policy with your recovery key.',
              style: GoogleFonts.inter(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              onChanged: (v) => pin = v,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'PIN',
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(pin),
            child: const Text('Sign'),
          ),
        ],
      ),
    );
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
