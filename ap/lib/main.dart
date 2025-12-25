import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/onboarding/server_connect_screen.dart';
import 'screens/onboarding/dkg_progress_screen.dart';
import 'screens/onboarding/secure_storage_screen.dart';
import 'screens/onboarding/wallet_ready_screen.dart';
import 'screens/spending/send_screen.dart';
import 'screens/spending/review_screen.dart';
import 'screens/spending/signing_screen.dart';
import 'screens/policies/policies_screen.dart';
import 'screens/policies/edit_policy_screen.dart';

void main() {
  runApp(const MerlinWalletApp());
}

class MerlinWalletApp extends StatelessWidget {
  const MerlinWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Merlin Wallet',
      theme: AppTheme.darkTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/onboarding/welcome', // Start with onboarding for now
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/onboarding/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/onboarding/server',
      builder: (context, state) => const ServerConnectionScreen(),
    ),
    GoRoute(
      path: '/onboarding/dkg',
      builder: (context, state) => const DkgProgressScreen(),
    ),
    GoRoute(
      path: '/onboarding/secure_storage',
      builder: (context, state) => const SecureStorageScreen(),
    ),
    GoRoute(
      path: '/onboarding/ready',
      builder: (context, state) => const WalletReadyScreen(),
    ),
    GoRoute(
      path: '/spending/send',
      builder: (context, state) => const SendScreen(),
    ),
    GoRoute(
      path: '/spending/review',
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>? ?? {};
        return ReviewScreen(extras: extras);
      },
    ),
    GoRoute(
      path: '/spending/signing',
      builder: (context, state) => const SigningScreen(),
    ),
    GoRoute(
      path: '/policies',
      builder: (context, state) => const PoliciesScreen(),
    ),
    GoRoute(
      path: '/policies/edit',
      builder: (context, state) => const EditPolicyScreen(),
    ),
  ],
);
