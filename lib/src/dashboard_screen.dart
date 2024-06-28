import 'package:ancc_24_team_acre/src/real_time_scanning_and_security_check/scanning_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();

  Future<void> _handleScanURL() async {
    final URL = _searchController.text;
    final supabase = context.read<SupabaseState>().supabase;
    final userID = context.read<SupabaseState>().userID;

    const denoURL =
        'https://fuewnvhcjyzstbyhyxzh.supabase.co/functions/v1/validate_url';
    const scanURL =
        'https://fuewnvhcjyzstbyhyxzh.supabase.co/functions/v1/scan_url';
    const anonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1ZXdudmhjanl6c3RieWh5eHpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwMDY2NzMsImV4cCI6MjAzMzU4MjY3M30.GQi3uTIxslY1CAPIOxm0x5o78rLkF3_XPtb6bREu9XQ';

    var response = await http.post(Uri.parse(denoURL),
        headers: {
          "Authorization": "Bearer $anonKey",
          "Content-Type": "application/json"
        },
        body: json.encode({"url": URL}));
    final sanitisedURL = response.body;

    try {
      json.decode(sanitisedURL)['error'];
      return;
    } catch (e) {
      try {
        // Scan URL with APIs
        final promise = http.post(Uri.parse(scanURL),
            headers: {
              "Authorization": "Bearer $anonKey",
              "Content-Type": "application/json"
            },
            body: json.encode({"url": URL}));
        // Push Loading Screen while API is being called
        await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ScanningScreen()));

        // Ensure API call is completed
        response = await promise;
        final data = json.decode(response.body);
        final rating = data['IPScannerRating'].toString();
        final description = data['IPScannerDescription'].toString();

        // Call appropriate screen based on the rating
        if (rating == 'Secure') {
          context.go('/real_time_scanning_and_security_check/secure');
        } else {
          context.go('/real_time_scanning_and_security_check/insecure',
              extra: {'rating': rating, 'description': description});
        }

        // Insert into database
        await supabase.from('url_scan_results').insert({
          'user_id': userID,
          'url_link': URL,
          'ip_quality_rating': rating,
          'ip_quality_description': description,
          'status': true
        });

        print('Rating: $rating');
        return;
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: 411,
              height: 890,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Color(0xFFFFAB00)),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 139,
                    child: Container(
                      width: 411,
                      height: 806,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF1F1F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(43.38),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: -2,
                    top: 770,
                    child: Container(
                      width: 411,
                      height: 146,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(43.38),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      left: 24,
                      top: 59,
                      child: SizedBox(
                        width: 244,
                        height: 44,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.13),
                            ),
                            labelText: 'Search',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      )),

                  Positioned(
                    left: 14,
                    top: 247.85,
                    child: SizedBox(
                      width: 277.94,
                      height: 40.3,
                      child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF9F9F9),
                            hintText: 'Enter URL to scan',
                            hintStyle: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16.68,
                                fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.78, color: Color(0xFFFFAB00)),
                              borderRadius: BorderRadius.circular(61.15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.78, color: Color(0xFFFFAB00)),
                              borderRadius: BorderRadius.circular(61.15),
                            ),
                            contentPadding: const EdgeInsets.only(
                                top: 3, bottom: 3, left: 15),
                          ),
                          style: const TextStyle(
                              fontFamily: "Inter", fontSize: 16.0)),
                    ),
                  ),

                  const Positioned(
                      left: 259,
                      top: 254.85,
                      child: Image(
                          image:
                              AssetImage('assets/images/historyButton.png'))),

                  // Real-Time Scan & Security Check
                  Positioned(
                      left: 303.06,
                      top: 243.85,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleScanURL();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 170, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44),
                          ),
                        ),
                        child: const Text('Scan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.68,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              height: 0,
                            )),
                      )),

                  const Positioned(
                    left: 26,
                    top: 221,
                    child: SizedBox(
                      width: 284.89,
                      height: 20.85,
                      child: Text(
                        'Real-Time Scan & Security Check',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.90,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  // Breach Scan
                  Positioned(
                    left: 0,
                    top: 343,
                    child: GestureDetector(
                      onTap: () {
                        context.go('/breach_scan/dashboard');
                      },
                      child: Container(
                        width: 229.01,
                        height: 163.76,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 14.07,
                              top: 25.59,
                              child: Container(
                                width: 179.12,
                                height: 122.82,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.59),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 30,
                                top: 45,
                                child: SizedBox(
                                    width: 28,
                                    height: 32,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/breachScanIcon.png'),
                                    ))),
                            const Positioned(
                              left: 67.81,
                              top: 57.57,
                              child: SizedBox(
                                width: 115.15,
                                height: 19.19,
                                child: Text(
                                  'Breach Scan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 33.27,
                              top: 90.84,
                              child: SizedBox(
                                width: 139.45,
                                height: 26.87,
                                child: Text(
                                  'Protect your Personal Information',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Jailbreak Detection
                  Positioned(
                    left: 0,
                    top: 534.91,
                    child: InkWell(
                      onTap: () {
                        print("Jailbreak Icon pressed");
                      },
                      child: Container(
                        width: 229.01,
                        height: 163.76,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 14.07,
                              top: 25.59,
                              child: Container(
                                width: 179.12,
                                height: 122.82,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.59),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 30,
                                top: 45,
                                child: SizedBox(
                                    width: 28,
                                    height: 32,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/jailbreakIcon.png'),
                                    ))),
                            const Positioned(
                              left: 67.81,
                              top: 48.62,
                              child: SizedBox(
                                width: 115.15,
                                height: 49.19,
                                child: Text(
                                  'Jailbreak\nDetection',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 33.27,
                              top: 87,
                              child: SizedBox(
                                width: 139.45,
                                height: 26.87,
                                child: Text(
                                  'Secure your device & Identify potential risks',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Reports
                  Positioned(
                    left: 205.99,
                    top: 534.91,
                    child: InkWell(
                      onTap: () {
                        print("Reports Icon pressed");
                      },
                      child: Container(
                        width: 229.01,
                        height: 163.76,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 14.07,
                              top: 25.59,
                              child: Container(
                                width: 179.12,
                                height: 122.82,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.59),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 30,
                                top: 45,
                                child: SizedBox(
                                    width: 28,
                                    height: 32,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/reportIcon.png'),
                                    ))),
                            const Positioned(
                              left: 67.80,
                              top: 57.57,
                              child: SizedBox(
                                width: 115.15,
                                height: 19.19,
                                child: Text(
                                  'Reports',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 26.86,
                              top: 87,
                              child: SizedBox(
                                width: 152.25,
                                height: 26.87,
                                child: Text(
                                  'Summarize your website scan findings',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      left: 62,
                      top: 803,
                      child: InkWell(
                          onTap: () {
                            print("Dashboard Icon pressed");
                            GoRouter.of(context).go('/dashboard');
                          },
                          child: Image.asset(
                            'assets/images/homeIcon.png',
                            width: 37.83,
                            height: 37.83,
                          ))),

                  const Positioned(
                    left: 43,
                    top: 852.16,
                    child: SizedBox(
                      width: 79.02,
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.55,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      left: 187,
                      top: 803,
                      child: InkWell(
                          onTap: () {
                            GoRouter.of(context).go('/settings');
                          },
                          child: Image.asset(
                            'assets/images/settingsIcon.png',
                            width: 37.83,
                            height: 37.83,
                          ))),

                  const Positioned(
                    left: 182,
                    top: 852,
                    child: SizedBox(
                      width: 53.53,
                      child: Text(
                        'Setting',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.55,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      left: 315,
                      top: 803,
                      child: InkWell(
                          onTap: () {
                            GoRouter.of(context).go('/profile');
                          },
                          child: Image.asset(
                            'assets/images/profileIcon.png',
                            width: 37.83,
                            height: 37.83,
                          ))),

                  const Positioned(
                    left: 312,
                    top: 852,
                    child: SizedBox(
                      width: 48.43,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.55,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  // QR Check
                  Positioned(
                    left: 202.15,
                    top: 343,
                    child: InkWell(
                      onTap: () => print("QR Check Icon pressed"),
                      child: Container(
                        width: 229.01,
                        height: 163.76,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 14.07,
                              top: 25.59,
                              child: Container(
                                width: 179.12,
                                height: 122.82,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.59),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 30,
                                top: 45,
                                child: SizedBox(
                                    width: 28,
                                    height: 32,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/qrIcon.png'),
                                    ))),
                            const Positioned(
                              left: 72.93,
                              top: 57.57,
                              child: SizedBox(
                                width: 115.15,
                                height: 19.19,
                                child: Text(
                                  'QR Check',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 29.42,
                              top: 90.84,
                              child: SizedBox(
                                width: 154.81,
                                height: 26.87,
                                child: Text(
                                  'Protect yourself against dangerous QR code links',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.79,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 188.52,
                    top: 669.31,
                    child: SizedBox(width: 29.68, height: 29.68),
                  ),
                  Positioned(
                    left: 337.96,
                    top: 59,
                    child: Container(
                      width: 44.53,
                      height: 44.53,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFBF9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
