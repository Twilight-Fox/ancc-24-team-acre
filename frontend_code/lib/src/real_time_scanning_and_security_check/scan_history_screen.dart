import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../main.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});

  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}

class _ScanHistoryScreenState extends State<ScanHistoryScreen> {
  List<String> url = [];
  List<String> timestamp = [];
  List<String> threatLevel = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final supabase = context.read<SupabaseState>().supabase;
    final userID = context.read<SupabaseState>().userID;
    final result = await supabase
        .from('url_scan_results')
        .select('url_link, created_at, ip_quality_rating')
        .eq('user_id', userID!);

    // print('Result: $result');
    Map<String, dynamic> cleanedResult = {};

    for (var entry in result) {
      String urlLink = entry['url_link'];
      // If the URL is not in the map or the current entry is newer, update the map
      if (!cleanedResult.containsKey(urlLink) ||
          DateTime.parse(entry['created_at'])
              .isAfter(DateTime.parse(cleanedResult[urlLink]!['created_at']))) {
        cleanedResult[urlLink] = entry;
      }
    }

    setState(() {
      cleanedResult.forEach((key, value) {
        url.add(value['url_link']);
        timestamp.add(DateTime.parse(value['created_at'])
            .toIso8601String()
            .split('T')[0]);
        threatLevel.add(value['ip_quality_rating']);
      });
    });

    print('URL: $url');
    print('Timestamp: $timestamp');
    print('Threat Level: $threatLevel');
  }

  Widget buildScanHistoryRow(int index) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 155,
          child: Text(
            url[index],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: 90,
          child: Text(
            timestamp[index],
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            threatLevel[index],
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 171, 0, 1),
      body: Stack(children: <Widget>[
        Positioned(
            top: 54.2343864440918,
            left: 367.0157165527344,
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
            top: 200.25,
            left: -3.424999952316284,
            child: Container(
                width: 414.42498779296875,
                height: 802.3905639648438,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.391666412353516),
                    topRight: Radius.circular(35.391666412353516),
                    bottomLeft: Radius.circular(35.391666412353516),
                    bottomRight: Radius.circular(35.391666412353516),
                  ),
                  color: Color.fromRGBO(241, 241, 241, 1),
                ))),
        Positioned(
          top: 226,
          left: 0,
          child: SizedBox(
            width: 411.4,
            height: 664,
            child: Column(children: [
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'URL Links',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 15.746258735656738,
                        fontWeight: FontWeight.w700,
                        height: 1),
                  ),
                  Text(
                    'Last\nScanned',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 15.746258735656738,
                        fontWeight: FontWeight.w700,
                        height: 1),
                  ),
                  Text(
                    'Threat\nLevels',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(91, 91, 91, 1),
                        fontFamily: 'Inter',
                        fontSize: 15.746258735656738,
                        fontWeight: FontWeight.w700,
                        height: 1),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: url.length,
                    itemBuilder: (context, index) {
                      return buildScanHistoryRow(index);
                    }),
              )
            ]),
          ),
        ),
        Positioned(
            top: 115.42189025878906,
            left: 12.558333396911621,
            child: Container(
                width: 100.46666717529297,
                height: 57.015625,
                decoration: const BoxDecoration(),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 15.297117233276367,
                      left: 6.8497467041015625,
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
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ))),
                  Positioned(
                      top: 24.578125,
                      left: 18.44140625,
                      child: SvgPicture.asset('assets/images/selectIcon.svg',
                          semanticsLabel: 'selecticon')),
                  const Positioned(
                      top: 27,
                      left: 42.44140625,
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
            top: 109.85938262939453,
            left: 109.5999984741211,
            child: Container(
                width: 97.04166412353516,
                height: 70.92186737060547,
                decoration: const BoxDecoration(),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 20.859298706054688,
                      left: 3.4253921508789062,
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
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ))),
                  Positioned(
                    top: 20.140625,
                    left: 7.400390625,
                    child: Transform.scale(
                      scale: 0.6,
                      child: SvgPicture.asset('assets/images/deleteicon.svg',
                          semanticsLabel: 'deleteicon'),
                    ),
                  ),
                  const Positioned(
                      top: 32,
                      left: 36,
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
            top: 114.03125762939453,
            left: 204.35833740234375,
            child: Container(
                width: 92.4749984741211,
                height: 66.75,
                decoration: const BoxDecoration(),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 16.687509536743164,
                      left: 2.2833292484283447,
                      child: Container(
                          width: 90.19166564941406,
                          height: 34.765625,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.549999237060547),
                              topRight: Radius.circular(20.549999237060547),
                              bottomLeft: Radius.circular(20.549999237060547),
                              bottomRight: Radius.circular(20.549999237060547),
                            ),
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ))),
                  const Positioned(
                      top: 27.5,
                      left: 33.6416015625,
                      child: Text(
                        'Report',
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
                  const Positioned(
                      top: 24.96875,
                      left: 12.6416015625,
                      child: Image(
                        image: AssetImage('assets/images/triangleIcon2.png'),
                      )),
                ]))),
        Positioned(
            top: 118.20314025878906,
            left: 296.8333435058594,
            child: Container(
                width: 98.18333435058594,
                height: 62.578125,
                decoration: const BoxDecoration(),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 12.516026496887207,
                      left: 4.566993713378906,
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
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ))),
                  Positioned(
                      top: 21.8597412109375,
                      left: 14.55078125,
                      child: SvgPicture.asset('assets/images/filterIcon.svg',
                          semanticsLabel: 'filterIcon')),
                  const Positioned(
                      top: 23.796875,
                      left: 40.1669921875,
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
                ]))),
        Positioned(
            top: 58,
            left: 19,
            child: SvgPicture.asset('assets/images/historyButton.svg',
                semanticsLabel: 'historybutton')),
        const Positioned(
            top: 58,
            left: 70,
            child: Text(
              'Scan History',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Inter',
                  fontSize: 33.06343460083008,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w900,
                  height: 1),
            )),
      ]),
    );
  }
}
