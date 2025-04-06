import 'package:flutter/material.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashPlus(
        firstText: 'Business',
        secondText: 'Manager',
        subtitle: 'Your Business Solution',
        welcomeText: 'Loading...',
        onComplete: () {
          // Navigate to your main app
        },
      ),
    );
  }
}