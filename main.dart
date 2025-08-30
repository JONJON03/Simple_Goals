import 'package:flutter/material.dart';
import 'diary.dart';
import 'forgotpassword.dart';
import 'longterm.dart';
import 'quotes.dart';
import 'settings.dart';
import 'shortterm.dart';
import 'startup.dart';
import 'createaccount.dart';
import 'login.dart';
import 'letsfillyourprofile.dart';
import 'homepage.dart';
import 'weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        CreateAccountPage.id: (context) => const CreateAccountPage(),
        LoginPage.id: (context) => const LoginPage(),
        FillProfilePage.id: (context) => const FillProfilePage(),
        HomePage.id: (context) => const HomePage(),
        ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
        WeatherPage.id: (context) => const WeatherPage(),
        DiaryPage.id: (context) => const DiaryPage(),
        QuotesPage.id: (context) => const QuotesPage(),
        LongTermGoalsPage.id: (context) => const LongTermGoalsPage(),
        ShortTermGoalsPage.id: (context) => const ShortTermGoalsPage(),
        SettingsPage.id: (context) => const SettingsPage(),
        

      },
    );
  }
}
