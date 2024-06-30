import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = 'username';
  String _email = 'email';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final supabase = context.read<SupabaseState>().supabase;
    final userID = context.read<SupabaseState>().userID;

    if (userID == null) {
      return;
    }
    var response = await supabase
        .from('profiles')
        .select('username, email')
        .eq('id', userID);

    setState(() {
      _username = response[0]['username'];
      _email = response[0]['email'];
    });
  }

  void _handleLogOut() async {
    final supabase = context.read<SupabaseState>().supabase;
    supabase.auth.signOut();
    context.go('/');
  }

  Widget build(BuildContext context) {
    // Figma Flutter Generator Profile_screenWidget - FRAME
    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned(
            top: -218.058349609375,
            left: -139.0578155517578,
            child: Container(
                width: 689.1157836914062,
                height: 567.058349609375,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 171, 0, 1),
                  borderRadius: BorderRadius.all(
                      Radius.elliptical(689.1157836914062, 567.058349609375)),
                ))),
        const Positioned(
            top: 57.01563262939453,
            left: 12.558333396911621,
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 36.53333282470703,
                  fontWeight: FontWeight.w900,
                  height: 1),
            )),
        Positioned(
            top: 236.683349609375,
            left: 61.64990234375,
            child: Container(
                width: 286.5583190917969,
                height: 204.35833740234375,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.549999237060547),
                    topRight: Radius.circular(20.549999237060547),
                    bottomLeft: Radius.circular(20.549999237060547),
                    bottomRight: Radius.circular(20.549999237060547),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ))),
        Positioned(
            top: 186.449951171875,
            left: 133.5751953125,
            child: Container(
                width: 133.5749969482422,
                height: 124.44166564941406,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.40833282470703),
                    topRight: Radius.circular(19.40833282470703),
                    bottomLeft: Radius.circular(19.40833282470703),
                    bottomRight: Radius.circular(19.40833282470703),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: -31.9666690826416,
                      left: -18.266664505004883,
                      child: Container(
                          width: 170.10833740234375,
                          height: 195.22500610351562,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/profilePicture.png'),
                                fit: BoxFit.fitWidth),
                          ))),
                ]))),
        const Positioned(
            top: 332,
            left: 302,
            child: Image(
              image: AssetImage('assets/images/editIcon.png'),
            )),
        Positioned(
            top: 330.300048828125,
            left: 120.1748046875,
            child: Text(
              _username,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 27.399999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 381.675048828125,
            left: 125.5751953125,
            child: Text(
              _email,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 18.266666412353516,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 262.5833435058594,
            left: 274,
            child: Container(
                width: 34.25,
                height: 31.96666717529297,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0),
                  borderRadius: BorderRadius.all(
                      Radius.elliptical(34.25, 31.96666717529297)),
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
                  fontWeight: FontWeight.normal,
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
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 801,
            left: 317,
            child: SvgPicture.asset('assets/images/profileicon.svg',
                semanticsLabel: 'profileicon')),
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
            top: 801,
            left: 190,
            child: InkWell(
              onTap: () {
                context.go('/settings');
              },
              child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/settingsIcon.png'),
                        fit: BoxFit.fitWidth),
                  )),
            )),
        Positioned(
          top: 553,
          left: 88,
          child: SizedBox(
            width: 230,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                _handleLogOut();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.558333396911621),
                    side: const BorderSide(
                        color: Color.fromRGBO(255, 171, 0, 1),
                        width: 2.2833333015441895),
                  ),
                ),
                elevation: WidgetStateProperty.all(0),
              ),
              child: const Text(
                'LOG OUT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 171, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 27.399999618530273,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
