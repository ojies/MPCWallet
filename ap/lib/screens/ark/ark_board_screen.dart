import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ap/services/mpc_service.dart';

class ArkBoardScreen extends StatefulWidget {
  const ArkBoardScreen({super.key});

  @override
  State<ArkBoardScreen> createState() => _ArkBoardScreenState();
}

class _ArkBoardScreenState extends State<ArkBoardScreen> {
  _BoardState _state = _BoardState.ready;
  String? _commitmentTxid;
  String? _error;

  Future<void> _startBoarding() async {
    setState(() {
      _state = _BoardState.settling;
      _error = null;
    });

    try {
      final mpcService = context.read<MpcService>();
      final txid = await mpcService.boardFunds();
      if (!mounted) return;
      setState(() {
        _state = _BoardState.done;
        _commitmentTxid = txid;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _state = _BoardState.error;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mpcService = context.watch<MpcService>();
    final boardingAddress = mpcService.boardingAddress;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Board Funds',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildBody(context, boardingAddress),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, String? boardingAddress) {
    switch (_state) {
      case _BoardState.ready:
        return _buildReadyState(context, boardingAddress);
      case _BoardState.settling:
        return _buildSettlingState();
      case _BoardState.done:
        return _buildDoneState(context);
      case _BoardState.error:
        return _buildErrorState(context);
    }
  }

  Widget _buildReadyState(BuildContext context, String? boardingAddress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blueAccent, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'How Boarding Works',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildStep('1', 'Send BTC to your boarding address'),
              const SizedBox(height: 8),
              _buildStep('2', 'Wait for on-chain confirmation'),
              const SizedBox(height: 8),
              _buildStep('3', 'Tap "Board Now" to settle into Ark VTXOs'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (boardingAddress != null) ...[
          Text(
            'Your Boarding Address',
            style: GoogleFonts.inter(
              color: Colors.white54,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: boardingAddress));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Boarding address copied'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      boardingAddress,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.copy, color: Colors.white38, size: 18),
                ],
              ),
            ),
          ),
        ],
        const Spacer(),
        ElevatedButton(
          onPressed: _startBoarding,
          child: const Text('Board Now'),
        ),
        const SizedBox(height: 8),
        Text(
          'This will settle any confirmed boarding UTXOs into Ark VTXOs',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: Colors.white38, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildStep(String number, String text) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white10,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: GoogleFonts.inter(
                color: Colors.white54,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildSettlingState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
          const SizedBox(height: 24),
          Text(
            'Boarding in progress...',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Signing intent proofs and settling with ASP.\nThis may take a moment.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.greenAccent,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Boarding Complete!',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your funds have been settled into Ark VTXOs.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
          ),
          if (_commitmentTxid != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: _commitmentTxid!));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Transaction ID copied')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'TX: ${_commitmentTxid!.substring(0, 16)}...',
                      style: GoogleFonts.inter(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.copy, color: Colors.white38, size: 14),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go('/ark'),
              child: const Text('Back to Ark'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.redAccent,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Boarding Failed',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _error ?? 'Unknown error',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: Colors.redAccent, fontSize: 13),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startBoarding,
                child: const Text('Retry'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white24),
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.inter(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _BoardState { ready, settling, done, error }
