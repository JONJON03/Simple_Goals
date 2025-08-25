import 'package:flutter/material.dart';
import 'createaccount.dart';
import 'forgotpassword.dart';
import 'letsfillyourprofile.dart'; // Make sure this import exists

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/logoo.png'),
                radius: 100,
              ),
              const SizedBox(height: 30),

              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email or Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  // ✅ Navigate to FillProfilePage instead of HomePage
                  Navigator.pushNamed(context, FillProfilePage.id);
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
    );
  }
}
