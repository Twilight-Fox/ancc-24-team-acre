import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Code to delete the item goes here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('DELETE'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without deleting
              },
              child: const Text('CANCEL'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Settings_screenWidget - FRAME
    return Scaffold(
      body: Container(
          width: 411,
          height: 890,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 171, 0, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 139,
                left: 0,
                child: Container(
                    width: 411,
                    height: 806,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(43.383331298828125),
                        topRight: Radius.circular(43.383331298828125),
                        bottomLeft: Radius.circular(43.383331298828125),
                        bottomRight: Radius.circular(43.383331298828125),
                      ),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ))),
            Positioned(
                top: 770,
                left: -2,
                child: Container(
                    width: 411,
                    height: 146,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(43.383331298828125),
                        topRight: Radius.circular(43.383331298828125),
                        bottomLeft: Radius.circular(43.383331298828125),
                        bottomRight: Radius.circular(43.383331298828125),
                      ),
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ))),
            const Positioned(
                top: 852.15673828125,
                left: 43,
                child: Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14.550652503967285,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            const Positioned(
                top: 852,
                left: 182,
                child: Text(
                  'Setting',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14.550652503967285,
                      fontWeight: FontWeight.w400,
                      height: 1),
                )),
            const Positioned(
                top: 852,
                left: 312,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14.550652503967285,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 801,
                left: 317,
                child: InkWell(
                  onTap: () {
                    context.go('/profile');
                  },
                  child: SvgPicture.asset('assets/images/profileicon.svg',
                      semanticsLabel: 'profileicon'),
                )),
            Positioned(
                top: 801,
                left: 64,
                child: InkWell(
                  onTap: () {
                    context.go('/dashboard');
                  },
                  child: SvgPicture.asset('assets/images/homeicon.svg',
                      semanticsLabel: 'homeicon'),
                )),
            Positioned(
                top: 803,
                left: 186,
                child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/settingsIcon.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            const Positioned(
                top: 224,
                left: 140,
                child: Text(
                  'Setting',
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
              top: 326.191650390625,
              left: 0,
              child: InkWell(
                onTap: () {
                  context.go('/change_password');
                },
                child: Stack(
                  children: [
                    Container(
                      width: 411,
                      height: 74.20833587646484,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(182, 182, 182, 1),
                          width: 1.1416666507720947,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 27.9749755859375,
                      left: 89.7998046875,
                      child: Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 22.833332061767578,
                          fontWeight: FontWeight.w900,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 19.964599609375,
                      left: 39.95849609375,
                      child: SvgPicture.asset(
                        'assets/images/key.svg',
                        semanticsLabel: 'key',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 0,
              child: InkWell(
                onTap: () {
                  showDeleteConfirmationDialog(context);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 411,
                      height: 74.20833587646484,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(182, 182, 182, 1),
                          width: 1.1416666507720947,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 19,
                      left: 40,
                      child: SvgPicture.asset('assets/images/deleteIcon.svg',
                          semanticsLabel: 'deleteicon'),
                    ),
                    const Positioned(
                      top: 26.2333984375,
                      left: 89.4833984375,
                      child: Text(
                        'Delete Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 22.833332061767578,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w900,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
