import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAB00),
      body: Stack(
        children: [
          const Positioned(
            left: 25,
            top: 472,
            child: SizedBox(
              width: 368,
              height: 64,
              child: Text(
                'Website is Reported Successfully',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 101,
            top: 398,
            child: SizedBox(
              width: 210,
              height: 64,
              child: Text(
                'Success',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 162,
            top: 298,
            child: Image(image: AssetImage('assets/images/noIssueFound.png'),)
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
        ],
      ),
    );
  }
}
