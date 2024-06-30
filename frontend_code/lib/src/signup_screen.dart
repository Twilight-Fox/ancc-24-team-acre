import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool? _isChecked = false;

  Future<void> _handleLogin() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Show error message
      return;
    }
    final name = '${_firstNameController.text} ${_lastNameController.text}';
    final email = _emailController.text;
    final password = _passwordController.text;
    final supabase = context.read<SupabaseState>().supabase;
    await supabase.auth.signUp(
        email: email,
        password: password,
        data: <String, String>{'full_name': name});
    await Future.delayed(Duration.zero);
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Signup_screenWidget - FRAME
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: -305.6666259765625,
            left: -296.25,
            child: Container(
                width: 705.017578125,
                height: 580.1435546875,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 171, 0, 1),
                  borderRadius: BorderRadius.all(
                      Radius.elliptical(705.017578125, 580.1435546875)),
                ))),

        // Create Account Text
        const Positioned(
            top: 62.3333740234375,
            left: 17.75,
            child: Text(
              'Create\n Account',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 41.214481353759766,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w900,
                  height: 1),
            )),

        // Sign up with Google
        Positioned(
          top: 193.3333740234375,
          left: 20.75,
          child: ElevatedButton(
            onPressed: () {
              print("Sign up with Google function goes here");
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(359.34, 38.64),
              foregroundColor: const Color.fromRGBO(255, 171, 0, 1),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              side: const BorderSide(
                color: Color.fromRGBO(255, 171, 0, 1),
                width: 2.5759050846099854,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.167478561401367),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 21.8951358795166,
                  height: 21.89530372619629,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/googleIcon.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const Text(
                  'Sign up with Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 171, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 19.319284439086914,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),

        // OR
        Positioned(
            top: 285.6053466796875,
            left: 18,
            child: SizedBox(
              width: 375.83,
              height: 24.6,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Container(
                    height: 1,
                    color: const Color.fromRGBO(131, 131, 131, 1),
                  )),
                  const Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(131, 131, 131, 1),
                        fontFamily: 'Inter',
                        fontSize: 16.774415969848633,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Expanded(
                      child: Container(
                    height: 1,
                    color: const Color.fromRGBO(131, 131, 131, 1),
                  ))
                ],
              ),
            )),

        // First Name
        Positioned(
          top: 342.3333740234375,
          left: 29.359619140625,
          child: SizedBox(
            width: 162,
            child: TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(82, 80, 80, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Last Name
        Positioned(
          top: 342.3333740234375,
          left: 219.976318359375,
          child: SizedBox(
            width: 162,
            child: TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(82, 80, 80, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Email
        Positioned(
          top: 427.03564453125,
          left: 29.359619140625,
          child: SizedBox(
            width: 252,
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(82, 80, 80, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Password
        Positioned(
          top: 515.465576171875,
          left: 29.359619140625,
          child: SizedBox(
            width: 355.56,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(82, 80, 80, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Confirm Password
        Positioned(
          top: 605.03564453125,
          left: 29.359619140625,
          child: SizedBox(
            width: 355.56,
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(82, 80, 80, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Password visibility icons; revisit if have time
        //Positioned(
        //    top: 543.816650390625,
        //    left: 349.9951171875,
        //    child: SvgPicture.asset('assets/images/decryptbutton.svg',
        //        semanticsLabel: 'decryptbutton')),

        //Positioned(
        //    top: 624.816650390625,
        //    left: 349.9951171875,
        //    child: SvgPicture.asset('assets/images/decryptbutton.svg',
        //        semanticsLabel: 'decryptbutton')),

        // Checkbox
        Positioned(
          top: 679.597412109375,
          left: 14.359619140625,
          child: Checkbox(
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue;
                });
              }),
        ),

        // Terms and Conditions
        const Positioned(
            top: 696.597412109375,
            left: 56.40625,
            child: Text(
              'Terms & Conditions',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 15.455434799194336,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),

        // Login Text
        Positioned(
            top: 801.3333740234375,
            left: 41.75,
            child: InkWell(
              onTap: () {
                context.go('/login');
              },
              child: const Text(
                'Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 171, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 25.75905418395996,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(255, 171, 0, 1)),
              ),
            )),

        Positioned(
          top: 780.3333740234375,
          right: 26.75,
          child: SizedBox(
            width: 160,
            height: 65.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 170, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44),
                ),
              ),
              onPressed: () {
                _handleLogin();
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.6,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
