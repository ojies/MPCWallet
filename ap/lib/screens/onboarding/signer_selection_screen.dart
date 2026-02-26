import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/mpc_service.dart';

class SignerSelectionScreen extends StatefulWidget {
  const SignerSelectionScreen({super.key});

  @override
  State<SignerSelectionScreen> createState() => _SignerSelectionScreenState();
}

class _SignerSelectionScreenState extends State<SignerSelectionScreen> {
  String _selected = 'usb';
  final _hostController = TextEditingController(text: '10.0.2.2');
  final _portController = TextEditingController(text: '9090');

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _proceed() {
    final mpcService = context.read<MpcService>();
    mpcService.setSignerType(_selected);
    if (_selected == 'tcp') {
      final host = _hostController.text.trim();
      final port = int.tryParse(_portController.text) ?? 9090;
      mpcService.setSignerHost(host, port);
    }
    context.push('/onboarding/server');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recovery Signer')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Recovery Signer',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Your recovery key is managed by an external signing device.\n'
              'Select the connection method below.',
              style: GoogleFonts.inter(color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 24),
            _buildOption(
              value: 'usb',
              icon: Icons.usb,
              title: 'Hardware Signer (USB)',
              subtitle: 'Connect a Pico 2 signing device via USB',
            ),
            const SizedBox(height: 12),
            _buildOption(
              value: 'tcp',
              icon: Icons.dns_outlined,
              title: 'Signing Server (TCP)',
              subtitle: 'Connect to a signing server for testing',
            ),
            if (_selected == 'tcp') ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Server Connection',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _hostController,
                            decoration: const InputDecoration(
                              labelText: 'Host',
                              hintText: '10.0.2.2',
                              isDense: true,
                            ),
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _portController,
                            decoration: const InputDecoration(
                              labelText: 'Port',
                              hintText: '9090',
                              isDense: true,
                            ),
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: _proceed,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String value,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = _selected == value;
    return GestureDetector(
      onTap: () => setState(() => _selected = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.withOpacity(0.15)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.white24,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? Colors.blueAccent : Colors.white54,
                size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: GoogleFonts.inter(
                          color: Colors.white54, fontSize: 13)),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: _selected,
              onChanged: (v) => setState(() => _selected = v!),
              activeColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
