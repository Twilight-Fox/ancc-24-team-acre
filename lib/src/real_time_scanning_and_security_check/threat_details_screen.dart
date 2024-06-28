import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class ThreatDetailsScreen extends StatelessWidget {
  const ThreatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 171, 0, 1),
      body: SingleChildScrollView(
          child: SizedBox(
            height:950,
            child: Stack(children: <Widget>[
              const Positioned(
                  top: 63.9687614440918,
                  left: 21.691667556762695,
                  child: Text(
                    'Threat Levels',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 36.53333282470703,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w900,
                        height: 1),
                  )),
              Positioned(
                  top: 117.5916748046875,
                  left: 0,
                  child: Container(
                      width: 393.875,
                      height: 1000.0833129882812,
                      decoration: const BoxDecoration(),
                      child: Stack(children: [
                        Positioned(
                            top: 295.5,
                            left: 47.95000076293945,
                            child: Container(
                                width: 315.1000061035156,
                                height: 230.29998779296875,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.558333396911621),
                                    topRight: Radius.circular(12.558333396911621),
                                    bottomLeft: Radius.circular(12.558333396911621),
                                    bottomRight:
                                        Radius.circular(12.558333396911621),
                                  ),
                                  color: const Color.fromRGBO(255, 255, 255, 0),
                                  border: Border.all(
                                    color: const Color.fromRGBO(254, 242, 0, 1),
                                    width: 4.566666603088379,
                                  ),
                                ))),
                        Positioned(
                            top: 30.825002670288086,
                            left: 47.95000076293945,
                            child: Container(
                                width: 315.1000061035156,
                                height: 235.29998779296875,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.558333396911621),
                                    topRight: Radius.circular(12.558333396911621),
                                    bottomLeft: Radius.circular(12.558333396911621),
                                    bottomRight:
                                        Radius.circular(12.558333396911621),
                                  ),
                                  color: const Color.fromRGBO(255, 255, 255, 0),
                                  border: Border.all(
                                    color: const Color.fromRGBO(117, 255, 131, 1),
                                    width: 4.566666603088379,
                                  ),
                                ))),
                        Positioned(
                            top: 4.566668510437012,
                            left: 95.9000015258789,
                            child: Container(
                                width: 85.625,
                                height: 51.375,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 171, 0, 1),
                                ),
                                child: const Stack(children: <Widget>[
                                  Positioned(
                                      top: 18.699798583984375,
                                      left: 25.41705322265625,
                                      child: Text(
                                        'Safe',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(117, 255, 131, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 18.266666412353516,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w900,
                                            height: 1),
                                      )),
                                ]))),
                        Positioned(
                            top: 274.39166259765625,
                            left: 85.625,
                            child: Container(
                                width: 130.14999389648438,
                                height: 51.375,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 171, 0, 1),
                                ),
                                child: const Stack(children: <Widget>[
                                  Positioned(
                                      top: 13.700006484985352,
                                      left: 19.5,
                                      child: Text(
                                        'Suspicious',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(254, 242, 0, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 18.266666412353516,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w900,
                                            height: 1),
                                      )),
                                ]))),
                        Positioned(
                            top: 53.6583366394043,
                            left: 78.7750015258789,
                            child: SizedBox(
                              width: 250,
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white), // Default text style
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Definition:\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          'The website appears to be secure and poses no immediate threat.\n\n',
                                    ),
                                    TextSpan(
                                      text: 'Indicators:\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          '  • Secure connection (HTTPS with\n    padlock icon)\n  • No presence on malware or phishing\n    databases\n  • Good reputation based on security\n    checks',
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Positioned(
                            top: 319.3500061035156,
                            left: 78.7750015258789,
                            child: SizedBox(
                              width: 250,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: const TextSpan(
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 13.699999809265137,
                                    letterSpacing:
                                        0, // Percentages not used in Flutter. Defaulting to zero.
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ), // Default text style
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Definition:\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          'The website may contain suspicious elements or lack proper security measures. Proceed with caution and avoid entering sensitive information.\n\n',
                                    ),
                                    TextSpan(
                                      text: 'Indicators:\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          '  • Missing security certificates (HTTP \n    instead of HTTPS)\n  • Presence of some suspicious content \n    or functionality\n  • Limited information or negative\n    reviews about the website',
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Positioned(
                            top: 551.3416748046875,
                            left: 46.80833435058594,
                            child: Container(
                                width: 315.1000061035156,
                                height: 260.29998779296875,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.558333396911621),
                                    topRight: Radius.circular(12.558333396911621),
                                    bottomLeft: Radius.circular(12.558333396911621),
                                    bottomRight:
                                        Radius.circular(12.558333396911621),
                                  ),
                                  color: const Color.fromRGBO(255, 255, 255, 0),
                                  border: Border.all(
                                    color: const Color.fromRGBO(222, 19, 19, 1),
                                    width: 4.566666603088379,
                                  ),
                                ))),
                        Positioned(
                            top: 532.0833129882812,
                            left: 90.625,
                            child: Container(
                                width: 130.14999389648438,
                                height: 51.375,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 171, 0, 1),
                                ),
                                child: const Stack(children: <Widget>[
                                  Positioned(
                                      top: 13.70002269744873,
                                      left: 26.274999618530273,
                                      child: Text(
                                        'Malicious',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(222, 19, 19, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 18.266666412353516,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w900,
                                            height: 1),
                                      )),
                                ]))),
                      ]))),
              Positioned(
                  top: 63.9687614440918,
                  left: 376.1490783691406,
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
              Positioned(
                  top: 694.61669921875,
                  left: 79.91666412353516,
                  child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Definition:\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 14.841666221618652,
                      ),
                    ),
                    TextSpan(
                      text:
                          'The website is likely a threat and\ncould be used to steal your information\nor harm your device. Do not visit this\nwebsite.\n\n',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 14.841666221618652,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'Indicators:\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 14.841666221618652,
                      ),
                    ),
                    TextSpan(
                      text:
                          '  • Known phishing or malware site\n  • Attempts to download malware or\n    steal personal information\n  • Deceptive content or misleading\n    information',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 14.841666221618652,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )),
            ]),
          )),
    );
  }
}
