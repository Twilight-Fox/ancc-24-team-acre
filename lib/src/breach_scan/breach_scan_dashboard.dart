import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class BreachScanDashboardScreen extends StatelessWidget {
  const BreachScanDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Breach_alert_screenWidget - FRAME
    return Scaffold(
      body: Container(
          width: 411,
          height: 890,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 171, 0, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 135,
                left: 0,
                child: Container(
                    width: 411,
                    height: 858,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(43.383331298828125),
                        topRight: Radius.circular(43.383331298828125),
                        bottomLeft: Radius.circular(43.383331298828125),
                        bottomRight: Radius.circular(43.383331298828125),
                      ),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ))),
            const Positioned(
                top: 88,
                left: 77,
                child: Text(
                  'Breach Alert',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 36.53333282470703,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 29,
                left: 366.6660461425781,
                child: Transform.rotate(
                  angle: -50.63650861951021 * (math.pi / 180),
                  child: SvgPicture.asset('assets/images/exitbutton.svg',
                      semanticsLabel: 'exitbutton'),
                )),
            const Positioned(
                top: 285,
                left: 14,
                child: Text(
                  'emails',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 285.44970703125,
                left: 160.1337890625,
                child: Text(
                  'last scanned',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 285.44970703125,
                left: 298.275390625,
                child: Text(
                  'status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 17.125,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 191.9058380126953,
                left: 13.699996948242188,
                child: Container(
                    width: 100.46666717529297,
                    height: 57.015625,
                    decoration: const BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 15.296882629394531,
                          left: 6.850003242492676,
                          child: Container(
                              width: 89.05000305175781,
                              height: 34.765625,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.549999237060547),
                                  topRight: Radius.circular(20.549999237060547),
                                  bottomLeft:
                                      Radius.circular(20.549999237060547),
                                  bottomRight:
                                      Radius.circular(20.549999237060547),
                                ),
                                color: Color.fromRGBO(216, 216, 216, 1),
                              ))),
                      Positioned(
                          top: 25.03125762939453,
                          left: 18.26667022705078,
                          child: SvgPicture.asset(
                              'assets/images/selecticon.svg',
                              semanticsLabel: 'selecticon')),
                      const Positioned(
                          top: 26.0941162109375,
                          left: 21.2998046875,
                          child: Text(
                            'Select',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 13.699999809265137,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                    ]))),
            Positioned(
                top: 732.23388671875,
                left: -6,
                child: Container(
                    width: 411,
                    height: 123.76561737060547,
                    decoration: const BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 33.20570755004883,
                          left: 28.023239135742188,
                          child: Container(
                              width: 364.29547119140625,
                              height: 75.46684265136719,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.549999237060547),
                                  topRight: Radius.circular(20.549999237060547),
                                  bottomLeft:
                                      Radius.circular(20.549999237060547),
                                  bottomRight:
                                      Radius.circular(20.549999237060547),
                                ),
                                color: Color.fromRGBO(216, 216, 216, 1),
                              ))),
                      const Positioned(
                          top: 54.23484802246094,
                          left: 192.94166564941406,
                          child: Text(
                            'Email',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 27.399999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                      Positioned(
                          top: 56.84226989746094,
                          left: 139.28334045410156,
                          child: Transform.rotate(
                            angle: 2.435652857342211 * (math.pi / 180),
                            child: SvgPicture.asset(
                                'assets/images/exitbutton.svg',
                                semanticsLabel: 'exitbutton'),
                          )),
                    ]))),
            Positioned(
                top: 186.3433380126953,
                left: 110.74166870117188,
                child: Container(
                    width: 97.04166412353516,
                    height: 70.92186737060547,
                    decoration: const BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 20.858890533447266,
                          left: 3.4254531860351562,
                          child: Container(
                              width: 89.05000305175781,
                              height: 34.765621185302734,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.549999237060547),
                                  topRight: Radius.circular(20.549999237060547),
                                  bottomLeft:
                                      Radius.circular(20.549999237060547),
                                  bottomRight:
                                      Radius.circular(20.549999237060547),
                                ),
                                color: Color.fromRGBO(216, 216, 216, 1),
                              ))),
                      Positioned(
                          top: 28.6566162109375,
                          left: 14.2587890625,
                          child: SvgPicture.asset(
                              'assets/images/deleteicon.svg',
                              semanticsLabel: 'deleteicon')),
                      const Positioned(
                          top: 30.6566162109375,
                          left: 18.2587890625,
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 13.699999809265137,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                    ]))),
            Positioned(
                top: 184.95272827148438,
                left: 205.5,
                child: Container(
                    width: 97.04166412353516,
                    height: 70.92186737060547,
                    decoration: const BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 20.858816146850586,
                          left: 3.424999952316284,
                          child: Container(
                              width: 89.05000305175781,
                              height: 34.765621185302734,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.549999237060547),
                                  topRight: Radius.circular(20.549999237060547),
                                  bottomLeft:
                                      Radius.circular(20.549999237060547),
                                  bottomRight:
                                      Radius.circular(20.549999237060547),
                                ),
                                color: Color.fromRGBO(216, 216, 216, 1),
                              ))),
                      const Positioned(
                          top: 31.0472412109375,
                          left: 18.5,
                          child: Text(
                            'Scan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 13.699999809265137,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                      Positioned(
                          top: 32.0472412109375,
                          left: 18.5,
                          child: Container(
                              width: 17.125,
                              height: 14.841666221618652,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Scanicon.png'),
                                    fit: BoxFit.fitWidth),
                              ))),
                    ]))),
            Positioned(
                top: 194.68710327148438,
                left: 297.9750061035156,
                child: Container(
                    width: 98.18333435058594,
                    height: 62.578125,
                    decoration: const BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 12.515617370605469,
                          left: 4.567054748535156,
                          child: Container(
                              width: 89.05000305175781,
                              height: 34.765625,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.549999237060547),
                                  topRight: Radius.circular(20.549999237060547),
                                  bottomLeft:
                                      Radius.circular(20.549999237060547),
                                  bottomRight:
                                      Radius.circular(20.549999237060547),
                                ),
                                color: Color.fromRGBO(216, 216, 216, 1),
                              ))),
                      const Positioned(
                          top: 22.46875,
                          left: 34.25,
                          child: Text(
                            'Filter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 13.699999809265137,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                      Positioned(
                          top: 20.859375,
                          left: 20.550392150878906,
                          child: SvgPicture.asset(
                              'assets/images/filtericon.svg',
                              semanticsLabel: 'filtericon')),
                    ]))),
          ])),
    );
  }
}
