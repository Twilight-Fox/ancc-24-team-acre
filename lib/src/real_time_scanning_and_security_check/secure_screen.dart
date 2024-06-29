import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SecureScreen extends StatelessWidget {
  const SecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFAB00),
        body: Stack(
          children: [
            const Positioned(
              left: 101,
              top: 241,
              child: SizedBox(
                width: 218.06,
                height: 43.38,
                child: Text(
                  'Scan Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.53,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
                left: 175,
                top: 118.20,
                child: Image(
                  image: AssetImage('assets/images/noIssueFound.png'),
                )),
            Positioned(
                top: 77.87500762939453,
                left: 367.016845703125,
                child: InkWell(
                  onTap: () {
                    context.go('/dashboard');
                  },
                  child: Transform.rotate(
                    angle: -50.63650861951021 * (math.pi / 180),
                    child: SvgPicture.asset('assets/images/exitButton.svg',
                        semanticsLabel: 'exitbutton'),
                  ),
                )),
            const Positioned(
              left: 146.67,
              top: 300.37,
              child: SizedBox(
                width: 127.87,
                height: 35.39,
                child: Text(
                  'No Issue Found',
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
              left: 38,
              top: 407,
              child: SizedBox(
                width: 300.38,
                height: 99.50,
                child: Text(
                  'IP Quality Scorer (IPQS)\nMalicious URL Scanner API',
                  style: TextStyle(
                    color: Color(0xFFECECEC),
                    fontSize: 22.11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 38,
              top: 517.55,
              child: SizedBox(
                width: 276.38,
                height: 99.50,
                child: Text(
                  'Community Database',
                  style: TextStyle(
                    color: Color(0xFFECECEC),
                    fontSize: 22.11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 83,
              top: 659,
              child: SizedBox(
                width: 246.60,
                height: 40.39,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Great News! This website appears to be ',
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 18.27,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'safe',
                        style: TextStyle(
                          color: Color(0x00F9F9F9),
                          fontSize: 18.27,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Positioned(
              left: 245.54,
              top: 680.69,
              child: SizedBox(
                width: 43.38,
                height: 30.12,
                child: Text(
                  'safe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF75FF83),
                    fontSize: 18.27,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 255, 255, 1),
                    decorationThickness: 1.5,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
                top: 407,
                left: 348,
                child:
                    Image(image: AssetImage('assets/images/gsbCheckIcon.png'))),
            const Positioned(
                top: 513,
                left: 348,
                child:
                    Image(image: AssetImage('assets/images/gsbCheckIcon.png'))),
            const Positioned(
                top: 780,
                left: 285,
                child: Image(
                  image: AssetImage('assets/images/triangleIcon.png'),
                )),
            const Positioned(
              left: 284,
              top: 784,
              child: SizedBox(
                width: 130.82,
                height: 33.40,
                child: Text(
                  '     report',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.88,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(255, 255, 255, 1),
                    decorationThickness: 1.5,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
