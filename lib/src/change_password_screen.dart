import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math' as math;

import '../main.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _handleChangePassword() async {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      return;
    }

    if (password != confirmPassword) {
      return;
    }

    final supabase = context.read<SupabaseState>().supabase;
    await supabase.auth.updateUser(UserAttributes(password: password));
    //print('password changed');  
    supabase.auth.signOut()
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Forgot_password_screenWidget - FRAME
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: 1200,
          child: Stack(children: <Widget>[
            Positioned(
                top: -101,
                left: -101,
                child: Container(
                    width: 614,
                    height: 616,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 171, 0, 1),
                      borderRadius: BorderRadius.all(Radius.elliptical(614, 616)),
                    ))),
            
            Positioned(
              top: 468.31298828125,
              left: 9,
              child: Container(
                width: 389.1990051269531,
                height: 65.5639877319336,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(61.37905502319336),
                    topRight: Radius.circular(61.37905502319336),
                    bottomLeft: Radius.circular(61.37905502319336),
                    bottomRight: Radius.circular(61.37905502319336),
                  ),
                  color: const Color.fromRGBO(241, 241, 241, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    width: 2.789957046508789,
                  ),
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm New Password',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(157, 157, 157, 1),
                      fontFamily: 'Inter',
                      fontSize: 22.319656372070312,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: EdgeInsets.only(
                      left:
                          36.89892578125,
                      bottom: 11, 
                      top: 15
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 22.319656372070312,
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 333,
              left: 9,
              child: Container(
                width: 389.1990051269531,
                height: 65.5639877319336,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(61.37905502319336),
                    topRight: Radius.circular(61.37905502319336),
                    bottomLeft: Radius.circular(61.37905502319336),
                    bottomRight: Radius.circular(61.37905502319336),
                  ),
                  color: const Color.fromRGBO(241, 241, 241, 1),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 2.789957046508789,
                  ),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(157, 157, 157, 1),
                      fontFamily: 'Inter',
                      fontSize: 22.319656372070312,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: EdgeInsets.only(
                      left:
                          35.50439453125, 
                      bottom: 11, 
                      top: 15
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 22.319656372070312,
                  ),
                ),
              ),
            ),
            const Positioned(
                top: 354.4951171875,
                left: 329.35595703125,
                child: Image(image: AssetImage('assets/images/decryptButton.png'))),
            const Positioned(
                top: 486.4580078125,
                left: 329.35595703125,
                child: Image(image: AssetImage('assets/images/decryptButton.png'))),
            
            const Positioned(
                top: 99,
                left: 23,
                child: Text(
                  'Reset Your\nPassword',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 43.6363639831543,
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
                    context.go('/settings');
                  },
                  child: Transform.rotate(
                    angle: -50.63650861951021 * (math.pi / 180),
                    child: SvgPicture.asset('assets/images/exitButton.svg',
                        semanticsLabel: 'exitbutton'),
                  ),
                )),
            const Positioned(
                top: 224,
                left: 23,
                child: Text(
                  'Strong Passwords include numbers,\nletters and punctuation marks',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 21.068552017211914,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
              Positioned(
                left: 105,
                top: 660,
                child: ElevatedButton(
                  onPressed: () {
                    _handleChangePassword();
                  },
                  child: Text('CHANGE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 171, 0, 1),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    fixedSize: Size(192, 92)
                  
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
