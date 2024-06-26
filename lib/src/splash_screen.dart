import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../main.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(const Duration(milliseconds: 500));

    final supabase =
        Provider.of<SupabaseState>(context, listen: false).supabase;
    final session = supabase.auth.currentSession;
    print('Session: $session');
    if (session == null) {
      if (mounted) {
        context.go('/login');
      }
    } else {
      if (mounted) {
        context.go('/dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.orange)));
  }
}
