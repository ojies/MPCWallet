import 'package:client/policy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../services/mpc_service.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  String _formatInterval(Duration interval) {
    if (interval.inDays >= 7) return '${interval.inDays ~/ 7} Week(s)';
    if (interval.inDays >= 1) return '${interval.inDays} Day(s)';
    if (interval.inHours >= 1) return '${interval.inHours} Hour(s)';
    return '${interval.inMinutes} Minute(s)';
  }

  @override
  Widget build(BuildContext context) {
    final mpcService = context.watch<MpcService>();
    final policies = mpcService.policies;

    return Scaffold(
      appBar: AppBar(title: const Text('Spending Policies')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (policies.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shield_outlined,
                          size: 64, color: Colors.white24),
                      const SizedBox(height: 16),
                      Text('No Spending Policies',
                          style: GoogleFonts.inter(
                              fontSize: 18, color: Colors.white54)),
                      const SizedBox(height: 8),
                      Text(
                          'Add a policy to set spending limits that require PIN authorization.',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: Colors.white24),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: policies.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      _buildPolicyTile(context, policies[index], index + 1),
                ),
              ),
            const SizedBox(height: 16),
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
                      'Modifying or removing policies requires the Recovery Key.',
                      style:
                          GoogleFonts.inter(color: Colors.amber, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                context.push('/policies/edit');
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Policy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyTile(
      BuildContext context, ProtectedPolicy policy, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.shield_outlined, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text('Policy $index',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Active',
                    style: GoogleFonts.inter(
                        color: Colors.green, fontSize: 10)),
              ),
            ],
          ),
          const Divider(color: Colors.white10, height: 24),
          Row(
            children: [
              Expanded(
                child: _buildDetail(
                  'Threshold',
                  '${NumberFormat('#,###').format(policy.thresholdSats)} Sats',
                ),
              ),
              Expanded(
                child: _buildDetail(
                  'Interval',
                  _formatInterval(policy.interval),
                ),
              ),
              Expanded(
                child: _buildDetail('PIN', 'Set'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.inter(color: Colors.white38, fontSize: 10)),
        const SizedBox(height: 2),
        Text(value,
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }
}
