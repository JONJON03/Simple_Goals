import 'package:flutter/material.dart';
import 'settings.dart';
import 'weather.dart';
import 'diary.dart';
import 'quotes.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              iconSize: 20,
              splashRadius: 20,
              icon: const Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, SettingsPage.id);
              },
              tooltip: 'Settings',
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,  // only take as much height as needed
            children: [
              buildFeature(
                icon: Icons.cloud_outlined,
                label: 'Weather',
                onPressed: () {
                  Navigator.pushNamed(context, WeatherPage.id);
                },
              ),
              const SizedBox(height: 40),
              buildFeature(
                icon: Icons.book_outlined,
                label: 'Diary',
                onPressed: () {
                  Navigator.pushNamed(context, DiaryPage.id);
                },
              ),
              const SizedBox(height: 40),
              buildFeature(
                icon: Icons.check_circle_outline,
                label: 'Quotes',
                onPressed: () {
                  Navigator.pushNamed(context, QuotesPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFeature({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Icon(icon, size: 80, color: Colors.white),
        const SizedBox(height: 12),
        SizedBox(
          width: 160,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9B51E0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
