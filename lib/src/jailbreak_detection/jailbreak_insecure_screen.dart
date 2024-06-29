import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JailbreakScanInsecureScreen extends StatelessWidget {
  const JailbreakScanInsecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 950,
          child: Stack(
            children: [
              const Positioned(
                  left: 24,
                  top: 40,
                  child: Image(
                    image: AssetImage('assets/images/jailbreakIconW.png'),
                  )),
              const Positioned(
                left: 25,
                top: 327,
                child: SizedBox(
                  width: 359.62,
                  height: 70,
                  child: Text(
                    'Your Device Appear to be Jailbroken',
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
                    context.go('/dashboard');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/exitButton.png'),
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
                left: 167,
                top: 411,
                child: Image(
                  image: AssetImage('assets/images/triangleRedIcon.png'),
                ),
              ),
              const Positioned(
                left: 43,
                top: 414,
                child: SizedBox(
                  width: 324.23,
                  height: 35.39,
                  child: Text(
                    '    Risky ',
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
              const Positioned(
                left: 171,
                top: 222,
                child: Image(
                  image: AssetImage('assets/images/issueFoundSign.png'),
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
              Positioned(
                left: 0,
                top: 559,
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 25, left: 25, right: 72.30),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 287.70,
                        height: 388.17,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Risk of Jailbreaking:\n',
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
                                    'While rooting offers customization options, it also weakens security measures. This can make your device more susceptible to malware attacks, data breaches, and unauthorized access to your personal information.\n\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Recommendations:\n',
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
                                text: 'Data Backup',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFFFFFFF),
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nBack up your important data regularly in case of potential security breaches.\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\nUse with Caution',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFFFFFFF),
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nIf you choose to keep your device rooted, be extra cautious when downloading apps and visiting websites. Only use trusted sources and avoid suspicious links."\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14.84,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 11.42,
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
            ],
          ),
        ),
      ),
    );
  }
}
