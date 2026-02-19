import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fixnum/fixnum.dart';
import '../../services/mpc_service.dart';

class EditPolicyScreen extends StatefulWidget {
  const EditPolicyScreen({super.key});

  @override
  State<EditPolicyScreen> createState() => _EditPolicyScreenState();
}

class _EditPolicyScreenState extends State<EditPolicyScreen> {
  static const double _minSats = 10000; // 10k sats
  static const double _maxSats = 1000000000; // 10 BTC

  bool _isSigning = false;
  double _sliderValue = 0.5; // 0.0–1.0, maps logarithmically
  String _interval = '24h';

  int get _thresholdSats => pow(
          10,
          log(_minSats) / ln10 +
              _sliderValue * (log(_maxSats) / ln10 - log(_minSats) / ln10))
      .round();

  double _satsToSlider(double sats) {
    final clamped = sats.clamp(_minSats, _maxSats);
    return (log(clamped) / ln10 - log(_minSats) / ln10) /
        (log(_maxSats) / ln10 - log(_minSats) / ln10);
  }

  @override
  void initState() {
    super.initState();
    final policy = context.read<MpcService>().activePolicy;
    if (policy != null) {
      _sliderValue = _satsToSlider(policy.thresholdSats.toDouble());
      if (policy.interval.inDays >= 7) {
        _interval = '7d';
      } else if (policy.interval.inHours >= 24) {
        _interval = '24h';
      } else if (policy.interval.inHours >= 1) {
        _interval = '1h';
      } else {
        _interval = '5m';
      }
    }
  }

  void _savePolicy() async {
    // 1. Auth Key (Get PIN)
    String? pin = await _showAuthDialog();
    if (pin == null || pin.isEmpty) return;

    final mpcService = context.read<MpcService>();
    if (mpcService.client == null) return; // Should notify user

    setState(() => _isSigning = true);

    try {
      Duration duration;
      switch (_interval) {
        case '5m':
          duration = const Duration(minutes: 5);
          break;
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

      final amount = Int64(_thresholdSats);

      await mpcService.client!.createSpendingPolicy(duration, amount, pin);
      mpcService.policyUpdated();

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

  Future<String?> _showAuthDialog() async {
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
              keyboardType: TextInputType.number,
              maxLength: 6,
              onChanged: (v) => pin = v,
              style: const TextStyle(color: Colors.white, letterSpacing: 8),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: '6-digit PIN',
                counterText: '',
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
            onPressed: () {
              if (pin.length == 6 && RegExp(r'^\d{6}$').hasMatch(pin)) {
                Navigator.of(context).pop(pin);
              }
            },
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
              value: _sliderValue,
              min: 0,
              max: 1,
              divisions: 200,
              label: '${NumberFormat('#,###').format(_thresholdSats)} Sats',
              onChanged: (value) => setState(() => _sliderValue = value),
            ),
            Text(
              '${NumberFormat('#,###').format(_thresholdSats)} Sats',
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
                  ButtonSegment(value: '5m', label: Text('5 Min')),
                  ButtonSegment(value: '1h', label: Text('1 Hour')),
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
