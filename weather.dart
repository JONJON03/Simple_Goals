import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
static const String id = 'WeatherPage';
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Weather Title
              const Text(
                'Weather',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Weather Icon + Temperature + Location
              Column(
                children: const [
                  Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '13°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Capas',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // 4-day forecast box
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    WeatherDayColumn(day: 'Mon', high: '74', low: '67', icon: Icons.cloud),
                    WeatherDayColumn(day: 'Tue', high: '79', low: '76', icon: Icons.cloud),
                    WeatherDayColumn(day: 'Wed', high: '65', low: '64', icon: Icons.grain),
                    WeatherDayColumn(day: 'Thu', high: '66', low: '77', icon: Icons.wb_cloudy),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDayColumn extends StatelessWidget {
  final String day;
  final String high;
  final String low;
  final IconData icon;

  const WeatherDayColumn({
    super.key,
    required this.day,
    required this.high,
    required this.low,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Icon(icon, size: 28, color: Colors.blueGrey),
        Text(high),
        Text(low),
      ],
    );
  }
}
