import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class JailbreakRequestScreen extends StatelessWidget {
  const JailbreakRequestScreen({super.key});

  void _handleJailbreak(BuildContext context) async {
    final bool isJailbroken = await FlutterJailbreakDetection.jailbroken;
    //print(isJailbroken);
    //const bool isJailbroken = true;
    if (isJailbroken == true) {
      context.go('/jailbreak_detection/insecure');
    } else {
      context.go('/jailbreak_detection/secure');
    }
  }

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
          Positioned(
            left: 22,
            top: 235,
            child: Container(
              width: 367.62,
              height: 261.44,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.4000000059604645),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.54),
                ),
              ),
            ),
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
            left: 84,
            top: 68,
            child: SizedBox(
              width: 283.13,
              height: 43.38,
              child: Text(
                'Jailbreak Detection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.83,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 41.41,
            top: 278.38,
            child: SizedBox(
              width: 327.66,
              height: 92.47,
              child: Text(
                'To ensure optimal security, we would like to scan your device for potential risk security.\n(This scan checks for signs of jailbreak)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 56.25,
            top: 432.51,
            child: InkWell(
              onTap: () {
                _handleJailbreak(context);
              },
              child: Stack(
                children: [
                  Container(
                    width: 115.31,
                    height: 35.39,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.70),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 43.07,
                    top: 9,
                    child: SizedBox(
                      width: 47.95,
                      height: 27.40,
                      child: Text(
                        'YES',
                        style: TextStyle(
                          color: Color(0xFFFFAB00),
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
            ),
          ),
          Positioned(
            left: 240.06,
            top: 432.51,
            child: InkWell(
              onTap: () {
                context.go('/dashboard');
              },
              child: Stack(
                children: [
                  Container(
                    width: 115.31,
                    height: 35.39,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.70),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 43.07,
                    top: 9,
                    child: SizedBox(
                      width: 47.95,
                      height: 27.40,
                      child: Text(
                        'NO',
                        style: TextStyle(
                          color: Color(0xFFFFAB00),
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
            ),
          ),
          Positioned(
            left: 13.71,
            top: 608.69,
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
            left: 15.98,
            top: 642.94,
            child: SizedBox(
              width: 287.70,
              height: 263.73,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'What is Jailbreak?\n',
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
                          'Jailbreaking removes security restrictions on a device, allowing for more customization and app installation (but also increasing security risks).\n\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 14.84,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Benefits of Jailbreak Detection:\n',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 18.27,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' \n',
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
                          'Improved Security: Being warned about potential security vulnerabilities that you might not be aware of. \n\n',
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
        ],
      ),
    );
  }
}
