import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

import '../../main.dart';

class BreachScanInputScreen extends StatefulWidget {
  const BreachScanInputScreen({super.key});

  @override
  State<BreachScanInputScreen> createState() => _BreachScanInputScreenState();
}

class _BreachScanInputScreenState extends State<BreachScanInputScreen> {
  final _emailController = TextEditingController();

  Future<void> _handleScanEmail() async {
    final supabase = context.read<SupabaseState>().supabase;
    final userID = context.read<SupabaseState>().userID;
    const denoURL =
        'https://fuewnvhcjyzstbyhyxzh.supabase.co/functions/v1/scan_email';
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];

    var response = await http.post(Uri.parse(denoURL),
        headers: {
          'Authorization': 'Bearer $anonKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': _emailController.text,
        }));

    try {
      var details = jsonDecode(response.body);
      if (details['valid'] == false) {
        return;
      } else {
        //print(details['exposed'] ? 'Breached' : 'Secure');
        print('a\na\na\na');
        await supabase.from('breach_scan').insert([
          {
            'user_id': userID,
            'email': _emailController.text,
            'last_scanned': DateTime.now().toUtc().toString(),
            'security': details['exposed'] ? 'Breached' : 'Secure',
          }
        ]);
        if (details['exposed']) {
          context.go('/breach_scan/insecure');
        } else {
          context.go('/breach_scan/secure');
        }
      }
    } catch (e) {
      print('Failed to load details');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF575757),
      body: Stack(
        children: [
          const Positioned(
            left: 28,
            top: 48,
            child: Image(
              image: AssetImage('assets/images/breachScanIconW.png'),
            ),
          ),
          Positioned(
            right: 25,
            top: 64,
            child: InkWell(
              onTap: () {
                context.go('/breach_scan/dashboard');
              },
              child: const Image(
                image: AssetImage('assets/images/exitButton.png'),
              ),
            ),
          ),
          const Positioned(
            left: 79.99,
            top: 61.87,
            child: SizedBox(
              width: 183.01,
              height: 42.31,
              child: Text(
                'Breach Scan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.96,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 220,
            child: SizedBox(
              width: 362.38,
              height: 51.77,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 15.0),
                    fillColor: const Color(0xFF868686),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.59, color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(15.53),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.59, color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(15.53),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.59, color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(15.53),
                    ),
                    labelStyle: const TextStyle(fontFamily: "Inter")),
              ),
            ),
          ),
          Positioned(
            left: 13.71,
            top: 470.69,
            child: Container(
              width: 383.68,
              height: 0.5,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.28,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 38,
            top: 188,
            child: SizedBox(
              width: 126.01,
              height: 63,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.38,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 111.71,
            top: 324.83,
            child: SizedBox(
              width: 188.95,
              height: 51.77,
              child: ElevatedButton(
                onPressed: () {
                  _handleScanEmail();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.65),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.5,
                      top: 15,
                      child: Text(
                        'CHECK NOW',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.41,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 13.5,
                      left: 125,
                      child: Image(
                        image: AssetImage('assets/images/rightArrowIcon.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 13,
            top: 535,
            child: SizedBox(
              width: 395.07,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Breach Scan\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Shield your data: This scan checks if your email address has been exposed in a data breach. Data breaches happen when hackers steal large amounts of personal information from companies.\n\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'What it does?\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          '  • Compares your email address against known data\n     breach databases.\n  • Alerts you if your email appears in a breach.\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Why it matters?\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          'If your email is exposed, hackers might try to use it for phishing attacks or steal your identity.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.53,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
