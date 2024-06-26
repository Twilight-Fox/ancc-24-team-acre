import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

// import 'src/sample_login_screen.dart';
import 'src/splash_screen.dart';
import 'src/login_screen.dart';
import 'src/signup_screen.dart';
import 'src/dashboard_screen.dart';
import 'src/settings_screen.dart';
import 'src/profile_screen.dart';
import 'src/breach_scan/breach_scan_dashboard.dart';

// Main Entry Point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Supabase
  await Supabase.initialize(
    url: 'https://fuewnvhcjyzstbyhyxzh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1ZXdudmhjanl6c3RieWh5eHpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwMDY2NzMsImV4cCI6MjAzMzU4MjY3M30.GQi3uTIxslY1CAPIOxm0x5o78rLkF3_XPtb6bREu9XQ',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SupabaseState())
      ],
      child: const MainApp(),
    ),
  );
}

// Manage App State Here
class SupabaseState extends ChangeNotifier {
  final supabase = Supabase.instance.client;
}

// Manage Screen Navigation Here
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) =>
          const SignupScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) =>
          const DashboardScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) =>
          const SettingsScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileScreen(),
    ),
    GoRoute(
      path: "/breach_scan/dashboard",
      builder: (BuildContext context, GoRouterState state) =>
          const BreachScanDashboardScreen(),
    ),
  ],
);

// Main App Entry Point
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const MaterialApp(
    //  title: 'Acre Numba Wan',
    //  home: SignupScreen(),
    //);
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
