import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

// Login Screen Widget, inherits from StatefulWidget
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class specific to LoginScreen, inherits from State
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool? _isChecked = false;

  // Function to print email and password
  Future<void> _handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final supabase = Provider.of<SupabaseState>(context, listen: false).supabase;
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      await Future.delayed(Duration.zero);
      context.go('/dashboard');
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            // Background Orange Oval
            Positioned(
              left: -(screenSize.width * 0.126),
              top: -(screenSize.height * 0.382),
              child: Container(
                width: screenSize.width * 1.253,
                height: screenSize.height * 0.764,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFFAB00),
                  shape: OvalBorder(),
                ),
              ),
            ),

            // Main Widgets
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Back!
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                    child: SizedBox(
                      width: 202,
                      height: 96,
                      child: Text(
                        'Welcome\n Back!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Login with Google
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Login with Google Function goes here");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F1F1),
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(47),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(44), // Rounded corners
                          ),
                          side: const BorderSide(width: 0),
                          elevation: 2,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // To keep the row's size just as big as its children
                          children: [
                            Image.asset('assets/images/googleIcon.png',
                                width: 24, height: 24),
                            const SizedBox(
                                width: 10), // Space between the icon and text
                            const Text(
                              'Log in with Google',
                              style: TextStyle(
                                color: Color(0xFF7B7B7B), // Text color
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // - OR -
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                              height: 2, color: const Color(0xFFCCCCCC))),
                      const Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Expanded(
                          child: Container(
                              height: 2, color: const Color(0xFFCCCCCC))),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Email
                  TextEntryWidget(
                      hintText: "Email", controller: _emailController),

                  const SizedBox(height: 30),

                  // Password
                  TextEntryWidget(
                      hintText: "Password",
                      controller: _passwordController,
                      obscureText: true),

                  const SizedBox(height: 5),

                  // Stay Signed in / Forgot Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue;
                              });
                            }),
                        const Text(
                          'Stay Signed in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            print("Forgot Password Function goes here");
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 300),

                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.go('/signup');
                          },
                          child: const SizedBox(
                            width: 101,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFFFAB00),
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 170, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(44),
                              ),
                            ),
                            onPressed: () {
                              _handleLogin();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Text Entry Widget
class TextEntryWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const TextEntryWidget(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 60,
          decoration: ShapeDecoration(
            color: Colors.white, // Background color of the text field
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 2, color: Color(0xFFFFAB00)), // Border color and width
              borderRadius: BorderRadius.circular(44), // Rounded corners
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none, // Removes underline
              contentPadding: const EdgeInsets.only(
                  left: 22, top: 11, bottom: 11), // Adjusts the padding
              hintText: hintText, // Placeholder text
              hintStyle: const TextStyle(
                color: Color(0xFF9D9D9D), // Placeholder text color
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            style: const TextStyle(
              color: Colors.black, // Text color
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
