import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../main.dart';

class BreachScanDashboardScreen extends StatefulWidget {
  const BreachScanDashboardScreen({super.key});

  @override
  State<BreachScanDashboardScreen> createState() => _BreachScanDashboardScreenState();
}

class _BreachScanDashboardScreenState extends State<BreachScanDashboardScreen> {
  List<String> email = [];
  List<String> timestamp = [];
  List<String> security = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
      final supabase = context.read<SupabaseState>().supabase;
      final result = await supabase
          .from('breach_scan')
          .select('email, last_scanned, security');

      Map<String, dynamic> cleanedResult = {};

      for (var entry in result) {
        String email = entry['email'];
        // If the URL is not in the map or the current entry is newer, update the map
        if (!cleanedResult.containsKey(email) ||
            DateTime.parse(entry['last_scanned'])
                .isAfter(DateTime.parse(cleanedResult[email]!['last_scanned']))) {
          cleanedResult[email] = entry;
        }
      }

      setState(() {
        cleanedResult.forEach((key, value) {
          email.add(value['email']);
          timestamp.add(DateTime.parse(value['last_scanned'])
              .toIso8601String()
              .split('T')[0]);
          security.add(value['security']);
        });
      });
      print(email);
      print(timestamp);
      print(security);
  }

  Widget buildScanHistoryRow(int index) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 125,
          child: Text(
            email[index],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width:40
        ),
        SizedBox(
          width: 120,
          child: Text(
            timestamp[index],
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          width: 110,
          child: Text(
            security[index],
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Breach_alert_screenWidget - FRAME
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: Stack(children: <Widget>[
        Positioned(
          right: 25,
          top: 44,
          child: InkWell(
            onTap: () {
              context.go('/dashboard');
            },
            child: const Image(
              image: AssetImage('assets/images/exitButton.png'),
            ),
          ),
        ),
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
            left: 95,
            child: Text(
              'Breach Alert',
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
          top: 285,
          child: SizedBox(
            width: 400,
            height: 500,
            child: Column(
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'emails',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 17.125,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    Text(
                      'last scanned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 17.125,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    Text(
                      'status',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 17.125,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: email.length,
                    itemBuilder: (context, index) {
                      return buildScanHistoryRow(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
                              bottomLeft: Radius.circular(20.549999237060547),
                              bottomRight: Radius.circular(20.549999237060547),
                            ),
                            color: Color.fromRGBO(216, 216, 216, 1),
                          ))),
                  Positioned(
                      top: 25.03125762939453,
                      left: 18.26667022705078,
                      child: SvgPicture.asset('assets/images/selectIcon.svg',
                          semanticsLabel: 'selecticon')),
                  const Positioned(
                      top: 27.0941162109375,
                      left: 42.2998046875,
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
            child: InkWell(
              onTap: () {
                context.go('/breach_scan/input');
              },
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
                                bottomLeft: Radius.circular(20.549999237060547),
                                bottomRight:
                                    Radius.circular(20.549999237060547),
                              ),
                              color: Color.fromRGBO(216, 216, 216, 1),
                            ))),
                    const Positioned(
                        top: 57,
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
                              fontWeight: FontWeight.w900,
                              height: 1),
                        )),
                    Positioned(
                        top: 52.84226989746094,
                        left: 139.28334045410156,
                        child: Transform.rotate(
                          angle: 2.435652857342211 * (math.pi / 180),
                          child: SvgPicture.asset(
                              'assets/images/exitButton.svg',
                              semanticsLabel: 'exitbutton'),
                        )),
                  ])),
            )),
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
                              bottomLeft: Radius.circular(20.549999237060547),
                              bottomRight: Radius.circular(20.549999237060547),
                            ),
                            color: Color.fromRGBO(216, 216, 216, 1),
                          ))),
                  const Positioned(
                      top: 28.6566162109375,
                      left: 14.2587890625,
                      child: Image(
                        image: AssetImage('assets/images/deleteIcon.png'),
                      )),
                  const Positioned(
                      top: 31.6566162109375,
                      left: 37.2587890625,
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
                              bottomLeft: Radius.circular(20.549999237060547),
                              bottomRight: Radius.circular(20.549999237060547),
                            ),
                            color: Color.fromRGBO(216, 216, 216, 1),
                          ))),
                  const Positioned(
                      top: 32.0472412109375,
                      left: 43.5,
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
                                image: AssetImage('assets/images/scanIcon.png'),
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
                              bottomLeft: Radius.circular(20.549999237060547),
                              bottomRight: Radius.circular(20.549999237060547),
                            ),
                            color: Color.fromRGBO(216, 216, 216, 1),
                          ))),
                  const Positioned(
                      top: 23.46875,
                      left: 42.25,
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
                      child: SvgPicture.asset('assets/images/filterIcon.svg',
                          semanticsLabel: 'filtericon')),
                ]))),
      ]),
    );
  }
}
