import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

// import 'src/sample_login_screen.dart';
import 'src/login_screen.dart';

// Main Entry Point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Supabase
  await Supabase.initialize(
  url: 'https://fuewnvhcjyzstbyhyxzh.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1ZXdudmhjanl6c3RieWh5eHpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwMDY2NzMsImV4cCI6MjAzMzU4MjY3M30.GQi3uTIxslY1CAPIOxm0x5o78rLkF3_XPtb6bREu9XQ',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppState())
    ],
      child: const MainApp(),
    ),
  );
}

// Manage App State Here
class MyAppState extends ChangeNotifier{
  final supabase = Supabase.instance.client;
}

// Manage Screen Navigation Here
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => ChangeNotifierProvider(
        create: (context) => LoginScreenState(),
        child: const LoginScreen(),
      ),
    ),
  ],
);

// Main App Entry Point
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
