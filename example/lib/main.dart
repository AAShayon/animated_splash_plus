import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashPlus(
        config: SplashConfig(
          appName: 'Business Manager',
          appNamePart1: 'Business',
          appNamePart2: 'Manager',
          subtitle: 'Your Business Solution Partner',
          welcomeText: 'Welcome',
          // Add any other customizations here
          // sunsetDuration: Duration(seconds: 4),
          // textAnimationDuration: Duration(seconds: 2),
          // sunStartColor: Colors.yellow,
          // sunEndColor: Colors.red,
        ),
        // Optional: Add a callback when animation completes
        onAnimationComplete: () {
          log('Splash animation completed');//add your call back here
          // You can add navigation logic here
        },
      ),
    );
  }
}