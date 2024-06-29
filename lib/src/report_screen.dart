import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _totalScans = '0';
  String _secureScans = '0';
  String _suspiciousScans = '0';
  String _maliciousScans = '0';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final supabase = context.read<SupabaseState>().supabase;
    final scanResults =
        await supabase.from('url_scan_results').select('ip_quality_rating');
    //print(scanResults);

    int secureCount = 0;
    int suspiciousCount = 0;
    int maliciousCount = 0;

    for (var result in scanResults) {
      switch (result['ip_quality_rating']) {
        case 'Secure':
          secureCount++;
          break;
        case 'Suspicious':
          suspiciousCount++;
          break;
        case 'Malicious':
          maliciousCount++;
          break;
        default:
          // Handle unknown ratings if necessary
          break;
      }
    }
    setState(() {
      _totalScans = scanResults.length.toString();
      _secureScans = secureCount.toString();
      _suspiciousScans = suspiciousCount.toString();
      _maliciousScans = maliciousCount.toString();
    });
    //print('Total Scans: $totalScans');
    //print('Secure Scans: $secureScans');
    //print('Suspicious Scans: $suspiciousScans');
    //print('Malicious Scans: $maliciousScans');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: Stack(
        children: [
          Positioned(
            right: 25,
            top: 64,
            child: InkWell(
              onTap: () {
                context.go('/dashboard');
              },
              child: const Image(
                image: AssetImage('assets/images/exitButton.png'),
              ),
            ),
          ),
          const Positioned(
              left: 35,
              top: 60,
              child: Image(
                image: AssetImage('assets/images/reportIconW.png'),
              )),
          Positioned(
            left: 0,
            top: 148,
            child: Container(
              width: 411,
              height: 778,
              decoration: ShapeDecoration(
                color: const Color(0xFFF1F1F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43.38),
                ),
              ),
            ),
          ),
          const Positioned(
            left: -35,
            top: 74,
            child: SizedBox(
              width: 359.62,
              height: 43.38,
              child: Text(
                'Reports',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27.40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 44,
            top: 252,
            child: SizedBox(
              width: 342.43,
              height: 69.85,
              child: Text(
                'Website Analysis Report',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: -2,
            top: 341,
            child: Container(
              width: 235.21,
              height: 168.19,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 14.45,
                    top: 26.28,
                    child: Container(
                      width: 183.96,
                      height: 126.14,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.28),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23.65,
                    top: 45.99,
                    child: SizedBox(
                      width: 164.25,
                      height: 19.71,
                      child: Text(
                        'Total Scans Performed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.45,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 72.27,
                    top: 74.90,
                    child: SizedBox(
                      width: 68.33,
                      height: 40.59,
                      child: Text(
                        _totalScans,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 42.05,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 201.21,
            top: 341,
            child: Container(
              width: 235.21,
              height: 168.19,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 14.45,
                    top: 26.28,
                    child: Container(
                      width: 183.96,
                      height: 126.14,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.28),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23.65,
                    top: 45.99,
                    child: SizedBox(
                      width: 164.25,
                      height: 19.71,
                      child: Text(
                        'Secure Scan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.45,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 72.27,
                    top: 74.90,
                    child: SizedBox(
                      width: 68.33,
                      height: 50,
                      child: Text(
                        _secureScans,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 42.05,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 1.94,
            top: 509.19,
            child: Container(
              width: 235.21,
              height: 168.19,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 14.46,
                    top: 26.28,
                    child: Container(
                      width: 183.96,
                      height: 126.14,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.28),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23.65,
                    top: 45.99,
                    child: SizedBox(
                      width: 164.25,
                      height: 19.71,
                      child: Text(
                        'Suspicious Scan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.45,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 72.27,
                    top: 74.90,
                    child: SizedBox(
                      width: 68.33,
                      height: 50,
                      child: Text(
                        _suspiciousScans,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 42.05,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 199.90,
            top: 509.19,
            child: Container(
              width: 235.21,
              height: 168.19,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 14.45,
                    top: 26.28,
                    child: Container(
                      width: 183.96,
                      height: 126.14,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.28),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23.65,
                    top: 45.99,
                    child: SizedBox(
                      width: 164.25,
                      height: 19.71,
                      child: Text(
                        'Malicious Scan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.45,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 72.27,
                    top: 74.90,
                    child: SizedBox(
                      width: 68.33,
                      height: 50,
                      child: Text(
                        _maliciousScans,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 42.05,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
