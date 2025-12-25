import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spending Policies')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPolicyCard(
              context,
              title: 'Spending Threshold',
              value: '100,000,000 Sats',
              subtitle: 'Transactions above this amount require a PIN.',
              icon: Icons.payments_outlined,
            ),
            const SizedBox(height: 16),
            _buildPolicyCard(
              context,
              title: 'Interval',
              value: '24 Hours',
              subtitle: 'Cumulative spending is reset every 24 hours.',
              icon: Icons.timer_outlined,
            ),
            const SizedBox(height: 16),
            _buildPolicyCard(
              context,
              title: 'Security PIN',
              value: 'Set',
              subtitle: '6-digit PIN for high-value transactions.',
              icon: Icons.lock_outline,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.key, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Updating policies requires authorization with your Recovery Key.',
                      style:
                          GoogleFonts.inter(color: Colors.amber, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/policies/edit');
              },
              child: const Text('Update Policy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyCard(BuildContext context,
      {required String title,
      required String value,
      required String subtitle,
      required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        GoogleFonts.inter(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 4),
                Text(value,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                        GoogleFonts.inter(color: Colors.white24, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
