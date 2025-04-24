import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() => runApp(const MyApp());

/// The main application widget.
///
/// This widget serves as the entry point for the Flutter app. It initializes
/// the [MaterialApp] and sets up the [AnimatedSplashPlus] as the home screen.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  ///
  /// This widget is stateless and does not require any parameters.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Builds the widget tree for the app.
    ///
    /// This method returns a [MaterialApp] configured with the [AnimatedSplashPlus]
    /// widget as the home screen. The splash screen is customized using the
    /// [SplashConfig] class, and a callback is provided for when the animation
    /// completes.
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
          log('Splash animation completed'); // Add your callback logic here
          // You can add navigation logic here
        },
      ),
    );
  }
}