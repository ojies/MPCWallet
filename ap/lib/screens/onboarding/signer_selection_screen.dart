import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/mpc_service.dart';

class SignerSelectionScreen extends StatelessWidget {
  const SignerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hardware Signer')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Connect Hardware Signer',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Your recovery key is managed by an external signing device.\n'
              'Enter the signer connection details below.',
              style: GoogleFonts.inter(color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 32),
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
                    'Signer Connection',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _SignerHostField(),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.push('/onboarding/server');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignerHostField extends StatefulWidget {
  @override
  State<_SignerHostField> createState() => _SignerHostFieldState();
}

class _SignerHostFieldState extends State<_SignerHostField> {
  final _controller = TextEditingController(text: '10.0.2.2');
  final _portController = TextEditingController(text: '9090');

  @override
  void dispose() {
    _controller.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Host',
              hintText: '10.0.2.2',
              isDense: true,
            ),
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
            onChanged: (v) {
              final port = int.tryParse(_portController.text) ?? 9090;
              context.read<MpcService>().setSignerHost(v.trim(), port);
            },
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
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
            onChanged: (v) {
              final port = int.tryParse(v) ?? 9090;
              context.read<MpcService>().setSignerHost(
                    _controller.text.trim(),
                    port,
                  );
            },
          ),
        ),
      ],
    );
  }
}
