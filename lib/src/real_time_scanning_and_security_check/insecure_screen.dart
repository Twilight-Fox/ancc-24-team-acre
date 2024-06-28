import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

class InsecureScreen extends StatelessWidget {
  final String rating;
  final String description;

  const InsecureScreen(
      {super.key, required this.rating, required this.description});

  @override
  Widget build(BuildContext context) {
    print('rating: $rating');
    print('description: $description');
    return Scaffold(
      body: Container(
          width: 411,
          height: 890,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 171, 0, 1),
          ),
          child: Stack(children: <Widget>[
            const Positioned(
                top: 117,
                left: 170,
                child: Image(
                  image: AssetImage('assets/images/issueFoundSign.png'),
                )),
            const Positioned(
                top: 254,
                left: 106.42578125,
                child: Text(
                  'Scan Result',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 36.53333282470703,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w900,
                      height: 1),
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
                top: 311.0833740234375,
                left: 107,
                child: Text(
                  'Potential Security Threats\nDetected',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(249, 249, 249, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 426,
                left: 329,
                child:
                    Image(image: AssetImage('assets/images/warningIcon.png'))),
            const Positioned(
                top: 539,
                left: 329,
                child:
                    Image(image: AssetImage('assets/images/warningIcon.png'))),
            Positioned(
                top: 781,
                left: 39,
                child: InkWell(
                  onTap: () {
                    context.go(
                        '/real_time_scanning_and_security_check/threat_details');
                  },
                  child: const Text(
                    'details ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 23.797725677490234,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(255, 255, 255, 1),
                        decorationThickness: 1.5,
                        height: 1),
                  ),
                )),
            const Positioned(
                top: 690.283447265625,
                left: 120,
                child: Text(
                  'website is',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 688,
                left: 201.908203125,
                child: Text(
                  rating,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(222, 18, 18, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(222, 18, 18, 1),
                      height: 1),
                )),
            const Positioned(
                top: 784,
                left: 284,
                child: Text(
                  '     report',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 20.875001907348633,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 784.84375,
                left: 290.2666015625,
                child: SvgPicture.asset('assets/images/reportIcon.svg',
                    semanticsLabel: 'reporticon')),
            const Positioned(
                top: 428,
                left: 38,
                child: Text(
                  'IP Quality Scorer (IPQS)\nMalicious URL Scanner API',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(236, 236, 236, 1),
                      fontFamily: 'Inter',
                      fontSize: 22.110509872436523,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w900,
                      height: 1),
                )),
            Positioned(
                top: 538.552734375,
                left: 38,
                child: Text(
                  'Suspicious Activity:\n$description',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(236, 236, 236, 1),
                      fontFamily: 'Inter',
                      fontSize: 22.110509872436523,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w900,
                      height: 1),
                )),
            //Positioned(
            //    top: 569.680908203125,
            //    left: 116.5869140625,
            //    child: SvgPicture.asset('assets/images/aa419infobutton.svg',
            //        semanticsLabel: 'aa419infobutton')),
            //Positioned(
            //    top: 458.3212890625,
            //    left: 160.162109375,
            //    child: SvgPicture.asset('assets/images/gsbinfobutton.svg',
            //        semanticsLabel: 'gsbinfobutton')),
          ])),
    );
  }
}
