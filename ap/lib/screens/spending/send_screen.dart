import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ap/services/mpc_service.dart';

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
    final mpcService = context.watch<MpcService>();
    final balanceSats = mpcService.balance;
    final formattedBalance = NumberFormat('#,###').format(balanceSats.toInt());

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
              'Available Balance: $formattedBalance Sats',
              style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final address = _addressController.text.trim();
                final amountText = _amountController.text.trim();

                if (address.isEmpty || amountText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')));
                  return;
                }

                // Basic address validation (Bech32/Segwit)
                // Accepts bc1, tb1, bcrt1
                if (!RegExp(r'^(bc1|tb1|bcrt1)[a-zA-Z0-9]{25,60}$')
                    .hasMatch(address)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid Bitcoin address format')));
                  return;
                }

                try {
                  // If _isBtc is true, the label is 'Sats', so we expect an Integer.
                  // If we were supporting BTC unit, we'd multiply by 1e8.
                  // Current UI: suffixText: _isBtc ? 'Sats' : 'USD'

                  if (_isBtc) {
                    // Validating SATS (must be integer-like, but user might type 100.0)
                    final amountDouble = double.parse(amountText);
                    if (amountDouble <= 0) throw Exception();

                    // Allow 100.0 but not 100.5 for Sats
                    if (amountDouble % 1 != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Sats must be an integer')));
                      return;
                    }

                    // Pass strict clean string to next screen
                    context.push('/spending/review', extra: {
                      'address': address,
                      'amount': amountDouble.toInt().toString(),
                      'isBtc': true, // Treating as Sats
                    });
                  } else {
                    // USD Logic (Placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('USD mode not supported yet')));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid amount')));
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
