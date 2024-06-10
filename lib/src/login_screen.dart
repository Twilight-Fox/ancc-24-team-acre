import 'package:flutter/material.dart';

// Login Screen Widget, inherits from StatefulWidget
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class specific to LoginScreen, inherits from State
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Function to print email and password
  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Email: $email, Password: $password');
  }
  
  // Sample default login screen from FlutterViz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0), 
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    color: Theme.of(context).colorScheme.onSurface, 
                  ),
                ),
                const SizedBox(height: 30.0), 
                LoginTextField(hintText: "Email", controller: _emailController), // State (Variable)
                const SizedBox(height: 16.0),
                LoginTextField(hintText: "Password", obscureText: true, controller: _passwordController), // State (Variable)
                const SizedBox(height: 30.0),
                LoginButton(onPressed: () => {_handleLogin()}, text: "Login"), // State (Variable)
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Don't Have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.black, // Use Colors class for common colors
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () => {print("Sign up function goes here")},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                          color: Color(0xffff5630), // Use theme color
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Create separate LoginTextField widget for code reusability
class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const LoginTextField({super.key, required this.hintText, this.obscureText = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
    );
  }
}  

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Callback for button press

  const LoginButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red, // Adjust color as needed
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      textColor: Colors.white,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

