import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BreachScanSecureScreen extends StatefulWidget {
  const BreachScanSecureScreen({super.key});

  @override
  State<BreachScanSecureScreen> createState() => _BreachScanSecureScreenState();
}

class _BreachScanSecureScreenState extends State<BreachScanSecureScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1250,
          child: Stack(
            children: [
              const Positioned(
                left: 28,
                top: 48,
                child: Image(
                  image: AssetImage('assets/images/breachScanIconW.png'),
                ),
              ),
              const Positioned(
                  left: 170,
                  top: 188.64,
                  child: Image(
                    image: AssetImage('assets/images/noIssueFound.png'),
                  )),
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
                left: 25.12,
                top: 306.86,
                child: SizedBox(
                  width: 359.62,
                  height: 70,
                  child: Text(
                    'Your Email hasn’t appeared in any new breaches',
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
                top: 75,
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
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 741,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 12.56, left: 3.43, right: 9.87),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 287.70,
                        height: 526.31,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'What is data breach?\n',
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
                                    'A data breach occurs when a website containing sensitive user information is hacked, and more specifically, when that information is exposed publicly.\n\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Who is behind the breaches?\n',
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
                                    'Regrettably cyber criminals repeatedly try to hack websites for sensitive information. They look to access email addresses, physical addresses, passwords or in some cases credit card details.\n\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'How To Prevent Breaches?\n',
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
                                text: 'Passwords\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Don’t re-use passwords across multiple websites.\n\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Click Smart\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Avoid suspicious links & websites, look for the padlock (https) for security.\n\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Antivirus\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Regularly run antivirus scans on all your devices.',
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 36.53,
                top: 471.89,
                child: Container(
                  width: 337.93,
                  height: 198.65,
                  decoration: ShapeDecoration(
                    color: const Color(0x49C20000),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 2.28, color: Color(0xFFFF2828)),
                      borderRadius: BorderRadius.circular(33.11),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 101.61,
                top: 516.42,
                child: SizedBox(
                  width: 191.80,
                  height: 21.69,
                  child: Text(
                    'Turn on Breach Alerts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.27,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 287.54,
                top: 500.57,
                child: Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                ),
              ),
              const Positioned(
                  left: 67.34,
                  top: 510,
                  child: Image(
                    image: AssetImage('assets/images/bellRedIcon.png'),
                  )),
              const Positioned(
                left: 83.34,
                top: 563.22,
                child: SizedBox(
                  width: 248.88,
                  height: 89.05,
                  child: Text(
                    'Get notified when your email address appears in a new data breach.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.27,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 13.71,
                top: 720.69,
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
        ),
      ),
    );
  }
}
