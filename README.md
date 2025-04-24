# Animated Splash Plus

[![pub package](https://img.shields.io/pub/v/animated_splash_plus.svg)](https://pub.dev/packages/animated_splash_plus)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


A beautiful, customizable animated splash screen package for Flutter applications.
## Features

- 🌅 Smooth sunset gradient background animation
- ✨ Customizable text animations (slide-in, fade-in)
- 🎨 Configurable colors, fonts, and durations
- ⚙️ Optional center widget during initial animation
- 🔄 Completion callback for navigation

## Demo


![Animated Splash Demo](https://raw.githubusercontent.com/AAShayon/animated_splash_plus/master/assets/animatedsplash.gif)

*Animated Splash Screen*

## Installation

Add to your `pubspec.yaml`:

dependencies:
  animated_splash_plus: ^1.0.3

## Usage

Basic Usage

```dart
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
  ```
Example Project
For a complete working example, see the example directory in this repository.

To run the example:

1.Clone the repository.
2.Navigate to the example folder.
3.Run flutter pub get.
4.Run flutter run.

## Customization Options

| Parameter               | Type          | Description                                                           | Default Value                |
|--------------------------|---------------|-----------------------------------------------------------------------|-------------------------------|
| `appName`                | `String`      | Full name of the app displayed during the splash screen              | `"Business Manager"`         |
| `appNamePart1`           | `String`      | First part of the app name (e.g., "Business")                         | `"Business"`                 |
| `appNamePart2`           | `String`      | Second part of the app name (e.g., "Manager")                         | `"Manager"`                  |
| `subtitle`               | `String?`     | Optional subtitle text displayed below the app name                  | `"Your Business Solution Partner"` |
| `welcomeText`            | `String`      | Text displayed at the bottom (e.g., "Welcome")                        | `"Welcome"`                  |
| `sunsetDuration`         | `Duration`    | Duration of the sunset gradient background animation                  | `Duration(seconds: 3)`       |
| `textAnimationDuration`  | `Duration`    | Duration of text animations (slide-in, fade-in)                        | `Duration(seconds: 2)`       |
| `sunStartColor`          | `Color`       | Starting color of the sun                                              | `Colors.orange`              |
| `sunEndColor`            | `Color`       | Ending color of the sun                                                | `Colors.red`                 |
| `skyStartTopColor`       | `Color`       | Top color of the sky at animation start                                | `Color(0xFFFFD700)`          |
| `skyStartMiddleColor`    | `Color`       | Middle color of the sky at animation start                             | `Color(0xFFFFA500)`          |
| `skyStartBottomColor`    | `Color`       | Bottom color of the sky at animation start                             | `Color(0xFF4B0082)`          |
| `skyEndTopColor`         | `Color`       | Top color of the sky at animation end                                  | `Color(0xFFFF4500)`          |
| `skyEndMiddleColor`      | `Color`       | Middle color of the sky at animation end                               | `Color(0xFF8B0000)`          |
| `skyEndBottomColor`      | `Color`       | Bottom color of the sky at animation end                               | `Color(0xFF000000)`          |
| `appNameTextStyle`       | `TextStyle`   | Text style for the app name                                            | `fontSize: 34, fontWeight: bold, color: white` |
| `subtitleTextStyle`      | `TextStyle`   | Text style for the subtitle                                            | `fontSize: 16, color: white70` |
| `welcomeTextStyle`       | `TextStyle`   | Text style for the welcome text                                        | `fontSize: 28, fontStyle: italic, color: white70` |
| `sunSize`                | `double`      | Size of the animated sun                                               | `100`                       |
| `sunScaleFactor`         | `double`      | Scaling factor for the sun during the animation                        | `0.3`                       |
| `sunsetCurve`            | `Curve`       | Animation curve for the sunset background                             | `Curves.easeInOut`           |
| `textAppearCurve`        | `Curve`       | Animation curve for the text appearance                               | `Curves.easeOut`             |
| `welcomeTextCurve`       | `Curve`       | Animation curve for the welcome text                                  | `Curves.easeOut`             |
| `sunImage`               | `ImageProvider?`| Optional image provider for the sun widget                            | `null`                      |
| `onComplete`             | `VoidCallback?` | Callback when the splash animation completes                          | `null`                      |



Example Usage (example/lib/main.dart)


Here’s an example of how to use the updated AnimatedSplashPlus widget with advanced customization:
``` 
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
          appName: 'My Awesome App',
          sunImage:AssetImage('assets/images/sun.png') ,
          appNamePart1: 'My',
          appNamePart2: 'App',
          subtitle: 'Your Ultimate Solution',
          welcomeText: 'Loading...',
          sunsetDuration: const Duration(seconds: 4),
          textAnimationDuration: const Duration(seconds: 3),
          sunStartColor: Colors.yellow,
          sunEndColor: Colors.deepOrange,
          skyStartTopColor: const Color(0xFF87CEEB),
          skyStartMiddleColor: const Color(0xFF00BFFF),
          skyStartBottomColor: const Color(0xFF1E90FF),
          skyEndTopColor: const Color(0xFF4682B4),
          skyEndMiddleColor: const Color(0xFF0000CD),
          skyEndBottomColor: const Color(0xFF00008B),
          appNameTextStyle: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
          welcomeTextStyle: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.white70,
          ),
          sunSize: 120,
          sunScaleFactor: 0.4,
          sunsetCurve: Curves.easeInOutCubic,
          textAppearCurve: Curves.easeInOutQuad,
          welcomeTextCurve: Curves.easeInOutQuart,
        ),
        onAnimationComplete: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the app!')),
    );
  }
}
```
Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.
