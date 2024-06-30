import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JailbreakScanSecureScreen extends StatelessWidget {
  const JailbreakScanSecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: Stack(
        children: [
          const Positioned(
              left: 24,
              top: 40,
              child: Image(
                image: AssetImage('assets/images/jailbreakIconW.png'),
              )),
          const Positioned(
            left: 171,
            top: 215,
            child: Image(image: AssetImage('assets/images/noIssueFound.png')),
          ),
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
            left: 26,
            top: 331,
            child: SizedBox(
              width: 359.62,
              height: 70.38,
              child: Text(
                'No Signs of Jailbreak detected',
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
          const Positioned(
            left: -43.38,
            top: 70,
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
          const Positioned(
            left: 43.38,
            top: 415.77,
            child: SizedBox(
              width: 324.23,
              height: 35.39,
              child: Text(
                'Your device hasn’t been tampered with',
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
            left: 27,
            top: 603,
            child: SizedBox(
              width: 287.70,
              height: 263.73,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tips:\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 18.27,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '    \n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 5.71,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Jailbreaking and rooting remove security restrictions, potentially making the device vulnerable to malware, viruses, and unauthorized access.\n\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 14.84,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'How To Prevent It:\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 18.27,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '    \n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 5.71,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          'For continued security, keep your device software updated and avoid downloading apps from untrusted sources.\n\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 14.84,
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
          Positioned(
            left: 13.71,
            top: 568.69,
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
        ],
      ),
    );
  }
}
