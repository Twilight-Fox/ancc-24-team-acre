import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BreachScanInsecureScreen extends StatelessWidget {
  const BreachScanInsecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: Stack(
        children: [
          const Positioned(
            left: 28,
            top: 48,
            child: Image(
              image: AssetImage('assets/images/breachScanIconW.png'),
            ),
          ),
          const Positioned(
            left: 25.12,
            top: 289.86,
            child: SizedBox(
              width: 359.62,
              height: 43.38,
              child: Text(
                'Your Data is at Risk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
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
            left: -33.38,
            top: 75.66,
            child: SizedBox(
              width: 359.62,
              height: 43.38,
              child: Text(
                'Results',
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
          Positioned(
            left: 173,
            top: 182,
            child: Image(
              image: AssetImage('assets/images/issueFoundSign.png'),
            ),
          ),
          const Positioned(
            left: 43.38,
            top: 333.24,
            child: SizedBox(
              width: 324.23,
              height: 35.39,
              child: Text(
                'Your personal information was found in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF9F9F9),
                  fontSize: 17.12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 134.72,
            top: 366.35,
            child: SizedBox(
              width: 141.57,
              height: 27.40,
              child: Text(
                'New Breach',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFDE1313),
                  fontSize: 17.12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 13.71,
            top: 405,
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
            left: 272.86,
            top: 461.11,
            child: SizedBox(
              width: 94.76,
              height: 43.38,
              child: Text(
                'date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 37.67,
            top: 461.11,
            child: SizedBox(
              width: 90.19,
              height: 29.68,
              child: Text(
                'Source',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
