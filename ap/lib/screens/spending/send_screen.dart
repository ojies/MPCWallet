import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _isBtc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Bitcoin')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Recipient Address',
                hintText: 'bc1q...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () {}, // TODO: Scanner
                ),
              ),
              style: GoogleFonts.inter(),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      suffixText: _isBtc ? 'Sats' : 'USD',
                    ),
                    style: GoogleFonts.inter(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isBtc = !_isBtc;
                    });
                  },
                  icon: const Icon(Icons.swap_vert),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Available Balance: 124,503,211 Sats',
              style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Simple validation
                if (_addressController.text.isNotEmpty &&
                    _amountController.text.isNotEmpty) {
                  context.push('/spending/review', extra: {
                    'address': _addressController.text,
                    'amount': _amountController.text,
                    'isBtc': _isBtc,
                  });
                }
              },
              child: const Text('Review Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
