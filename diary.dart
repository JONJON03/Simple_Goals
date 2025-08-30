import 'package:flutter/material.dart';
import 'package:simple_goals/homepage.dart';

import 'longterm.dart';
import 'shortterm.dart';

class DiaryPage extends StatelessWidget {
  static const String id = 'DiaryPage';
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Diary',
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
                Navigator.pushNamed(context, HomePage.id);
              },
              tooltip: 'Settings',
            ),
          ),
        ],
      ),

      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Long-Term Goals Icon
              const Icon(
                Icons.flag,  // flag icon for long-term goals
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 10),

              // Long-Term Goals Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LongTermGoalsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Long-Term Goals',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Short-Term Goals Icon
              const Icon(
                Icons.track_changes,  // replaced bullseye with track_changes
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 10),

              // Short-Term Goals Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShortTermGoalsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Short-Term Goals',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
