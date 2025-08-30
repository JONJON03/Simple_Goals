import 'package:flutter/material.dart';
import 'login.dart';

class CreateAccountPage extends StatefulWidget {
  static const String id = 'CreateAccountPage';

  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // Controllers to capture the input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Form key to validate input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validation for email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone';
    }
    // Email format validation
    String emailPattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Form(
          key: _formKey,  // Attach form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO & TITLE
              const Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/logoo.png'),
                      height: 120,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // "Create Your Account" centered
              const Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Georgia',
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.white24,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Email/Phone Field
              TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                  hintText: 'Email or Phone',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: validateEmail,
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate the form
                    if (_formKey.currentState?.validate() ?? false) {
                      // If the form is valid, save the data (e.g., save to backend)
                      String email = emailController.text;
                      String password = passwordController.text;

                      // For now, just print the values to the console (replace with backend logic)
                      // ignore: avoid_print
                      print('Email: $email');
                      // ignore: avoid_print
                      print('Password: $password');

                      // After saving, navigate to LoginPage
                      Navigator.pushNamed(context, LoginPage.id);
                    } else {
                      // If the form is invalid, show a Snackbar error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B51E0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
