import 'package:flutter/material.dart';
import 'createaccount.dart'; // <-- make sure this is imported

class WelcomeScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/logoo.png'),
                  radius: 110,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        // ✅ Navigate to CreateAccountPage here
                        Navigator.pushNamed(context, CreateAccountPage.id);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
