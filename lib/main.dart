import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

// import 'src/sample_login_screen.dart';
import 'src/splash_screen.dart';
import 'src/login_screen.dart';
import 'src/signup_screen.dart';
import 'src/dashboard_screen.dart';
import 'src/settings_screen.dart';
import 'src/change_password_screen.dart';
import 'src/profile_screen.dart';
import 'src/breach_scan/breach_scan_dashboard.dart';
import 'src/breach_scan/breach_scan_input_screen.dart';
import 'src/breach_scan/breach_scan_secure_screen.dart';
import 'src/breach_scan/breach_scan_insecure_screen.dart';
import 'src/real_time_scanning_and_security_check/scanning_screen.dart';
import 'src/real_time_scanning_and_security_check/secure_screen.dart';
import 'src/real_time_scanning_and_security_check/insecure_screen.dart';
import 'src/real_time_scanning_and_security_check/threat_details_screen.dart';
import 'src/real_time_scanning_and_security_check/scan_history_screen.dart';
import 'src/report_website_screen.dart';
import 'src/report_result_screen.dart';
import 'src/jailbreak_detection/jailbreak_request_screen.dart';
import 'src/jailbreak_detection/jailbreak_secure_screen.dart';
import 'src/jailbreak_detection/jailbreak_insecure_screen.dart';
import 'src/qr_scan/screenshot.dart';
import 'src/report_screen.dart';

// Main Entry Point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Initialise Supabase
  await Supabase.initialize(
    url: 'https://fuewnvhcjyzstbyhyxzh.supabase.co',
    anonKey:dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SupabaseState())],
      child: const MainApp(),
    ),
  );
}

// Manage App State Here
class SupabaseState extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  late final StreamSubscription<AuthState> authSubscription;
  User? user;
  String? userID;

  SupabaseState() {
    authSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      //print('event: $event, session: $session');

      switch (event) {
        case AuthChangeEvent.signedIn:
          user = session?.user;
          break;
        case AuthChangeEvent.signedOut:
          user = null;
          break;
        case AuthChangeEvent.userUpdated:
          user = session?.user;
          break;
        case AuthChangeEvent.userDeleted:
          user = null;
          break;
        default:
          break;
      }

      user = supabase.auth.currentUser;
      // print(user);
      userID = user?.id;
      // print(userID);
    });
  }
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
    GoRoute(
      path: '/breach_scan/input',
      builder: (BuildContext context, GoRouterState state) =>
          const BreachScanInputScreen(),
    ),
    GoRoute(
      path: '/breach_scan/secure',
      builder: (BuildContext context, GoRouterState state) =>
          const BreachScanSecureScreen(),
    ),
    GoRoute(
      path: '/breach_scan/insecure',
      builder: (BuildContext context, GoRouterState state) =>
          const BreachScanInsecureScreen(),
    ),
    GoRoute(
      path: '/real_time_scanning_and_security_check/scanning',
      builder: (BuildContext context, GoRouterState state) {
        return const ScanningScreen();
      },
    ),
    GoRoute(
      path: '/real_time_scanning_and_security_check/secure',
      builder: (BuildContext context, GoRouterState state) {
        final url = state.extra as String?;
        return SecureScreen(url: url??'');
      },
    ),
    GoRoute(
        path: '/real_time_scanning_and_security_check/insecure',
        builder: (BuildContext context, GoRouterState state) {
          final data = state.extra as Map<String, String>;
          final rating = data['rating'] ?? '';
          final description = data['description'] ?? '';
          final url = data['url'] ?? '';
          return InsecureScreen(rating: rating, description: description, url: url,);
        }),
    GoRoute(
      path: '/real_time_scanning_and_security_check/threat_details',
      builder: (BuildContext context, GoRouterState state) =>
          const ThreatDetailsScreen(),
    ),
    GoRoute(
      path: '/real_time_scanning_and_security_check/scan_history',
      builder: (BuildContext context, GoRouterState state) =>
          const ScanHistoryScreen(),
    ),
    GoRoute(
      path: '/report_website',
      builder: (BuildContext context, GoRouterState state) {
          final url = state.extra as String?;
            return ReportWebsiteScreen(url: url ?? '');
      }
    ),
    GoRoute(
      path: '/report_result',
      builder: (BuildContext context, GoRouterState state) =>
        const ScanResultScreen()
    ),
    GoRoute(
      path: '/jailbreak_detection/confirm',
      builder: (BuildContext context, GoRouterState state) =>
          const JailbreakRequestScreen(),
    ),
    GoRoute(
      path: '/jailbreak_detection/secure',
      builder: (BuildContext context, GoRouterState state) =>
          const JailbreakScanSecureScreen(),
    ),
    GoRoute(
      path: '/jailbreak_detection/insecure',
      builder: (BuildContext context, GoRouterState state) =>
          const JailbreakScanInsecureScreen(),
    ),
    GoRoute(
      path: '/qr_scan',
      builder: (BuildContext context, GoRouterState state) =>
          const BarcodeScannerWithZoom(),
    ),
    GoRoute(
      path: '/reports',
      builder: (BuildContext context, GoRouterState state) =>
          const ReportsScreen(),
    ),
    GoRoute(
        path: '/change_password',
        builder: (BuildContext context, GoRouterState state) =>
            const ChangePasswordScreen()),
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
