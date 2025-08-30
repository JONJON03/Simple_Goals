import 'package:flutter/material.dart';
import 'createaccount.dart';
import 'forgotpassword.dart';
import 'letsfillyourprofile.dart'; // Make sure this import exists

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';

  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to capture the input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Form key to validate input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(  // Wrap in SingleChildScrollView to prevent overflow
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,  // Attach form key for validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/logoo.png'),
                  radius: 100,
                ),
                const SizedBox(height: 30),

                // Email or Phone Field
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email or Phone',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.white10,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or phone';
                    }
                    // You can add email validation here
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white10,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Validate the form
                    if (_formKey.currentState?.validate() ?? false) {
                      // If the form is valid, navigate to FillProfilePage
                      Navigator.pushNamed(context, FillProfilePage.id);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 15),

                // Forgot Password Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgotPasswordPage.id);
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Signup Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CreateAccountPage.id);
                  },
                  child: const Text(
                    'Signup!',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
