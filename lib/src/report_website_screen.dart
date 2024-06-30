import 'package:flutter/material.dart';

class ReportWebsiteScreen extends StatelessWidget {
  const ReportWebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 163,
            top: 61,
            child: SizedBox(
              width: 221,
              height: 70,
              child: Text(
                'Report Website',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 25,
            top: 175,
            child: SizedBox(
              width: 138,
              height: 31,
              child: Text(
                'Categories:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.52,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 62,
            top: 281,
            child: SizedBox(
              width: 280,
              height: 469,
              child: Text(
                'phishing/scam\n\ninvalid domain\n\nmalware\n\nCopyright Infringement\n\nspam\n\npiracy\n\nIllegal Content\n\n\n\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.52,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 283,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 331,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 379,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 427,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 475,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 523,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 334,
            top: 571,
            child: Container(
              width: 16.90,
              height: 16.90,
              decoration: ShapeDecoration(
                color: const Color(0x00F1F1F1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.30),
                  borderRadius: BorderRadius.circular(3.90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 93,
            top: 750,
            child: Container(
              width: 226,
              height: 67,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFAB00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 26,
            top: 769,
            child: SizedBox(
              width: 359.62,
              height: 43.38,
              child: Text(
                'REPORT',
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
        ],
      ),
    );
  }
}
