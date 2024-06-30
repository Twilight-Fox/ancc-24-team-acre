import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:math' as math;

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  @override
  void initState() {
    print("screen called");
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      print('2 seconds later');
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Scanning_screenWidget - FRAME
    return Scaffold(
      body: Container(
          width: 411,
          height: 890,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 171, 0, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 54.2343864440918,
                left: 367.0157165527344,
                child: Transform.rotate(
                  angle: -50.63650861951021 * (math.pi / 180),
                  child: SvgPicture.asset('assets/images/exitButton.svg',
                      semanticsLabel: 'exitbutton'),
                )),
            Positioned(
                top: 319,
                left: 142.8583984375,
                child: Container(
                    width: 122.15833282470703,
                    height: 111.88333129882812,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/scanIcon.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            const Positioned(
                top: 483.50830078125,
                left: 122,
                child: Text(
                  'Scanning',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 36.53333282470703,
                      fontWeight: FontWeight.w900,
                      height: 1),
                )),
            Positioned(
                top: 526.783203125,
                left: 177.533203125,
                child: LoadingAnimationWidget.waveDots(
                    color: Color.fromARGB(255, 255, 255, 255), size: 60)),
          ])),
    );
  }
}
