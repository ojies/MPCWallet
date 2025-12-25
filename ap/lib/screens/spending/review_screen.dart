import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, dynamic> extras;

  const ReviewScreen({super.key, required this.extras});

  @override
  Widget build(BuildContext context) {
    final address = extras['address'] as String? ?? 'Unknown';
    final amount = extras['amount'] as String? ?? '0.0';
    final isBtc = extras['isBtc'] as bool? ?? true;

    return Scaffold(
      appBar: AppBar(title: const Text('Review Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDetailRow('Recipient', address),
            const Divider(color: Colors.white24, height: 32),
            _buildDetailRow('Amount', '$amount ${isBtc ? "Sats" : "USD"}'),
            const SizedBox(height: 16),
            _buildDetailRow('Network Fee', '~1,000 Sats'), // Mock
            const Divider(color: Colors.white24, height: 32),
            _buildDetailRow('Total', '$amount ${isBtc ? "Sats" : "USD"}',
                isTotal: true),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.blueAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'This transaction requires 2 signatures to be valid.',
                      style: GoogleFonts.inter(
                          color: Colors.blueAccent, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/spending/signing');
              },
              child: const Text('Sign Transaction'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(color: Colors.white54, fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
