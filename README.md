## Features

- 🌅 Smooth sunset gradient background animation
- ✨ Customizable text animations (slide-in, fade-in)
- 🎨 Configurable colors, fonts, and durations
- ⚙️ Optional center widget during initial animation
- 🔄 Completion callback for navigation

## Installation

Add to your `pubspec.yaml`:

dependencies:
  animated_splash_plus: ^1.0.0

## Usage

Basic Usage

```dart
import 'package:animated_splash_plus/animated_splash_plus.dart';

MaterialApp(
  home: AnimatedSplashPlus(
    firstText: 'Business',
    secondText: 'Manager',
    subtitle: 'Your Business Solution',
    welcomeText: 'Loading...',
    onComplete: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    },
  ),
);
```
Advanced Usage with Customizations
 ``` AnimatedSplashPlus(
  firstText: 'Hello',
  secondText: 'World',
  firstTextColor: Colors.blue,
  secondTextColor: Colors.green,
  sunsetDuration: Duration(seconds: 2),
  textAnimationDuration: Duration(seconds: 1),
  customCenterWidget: FlutterLogo(size: 100),
  gradientColors: [Colors.purple, Colors.pink, Colors.deepOrange],
);
  ```
Example Project
For a complete working example, see the example directory in this repository.

To run the example:

1.Clone the repository.
2.Navigate to the example folder.
3.Run flutter pub get.
4.Run flutter run.

## Customization Options

| Parameter             | Type           | Description                        | Default Value            |
|------------------------|----------------|------------------------------------|---------------------------|
| `firstText`            | `String`       | First text to display              | **Required**              |
| `secondText`           | `String`       | Second text to display             | **Required**              |
| `subtitle`             | `String?`      | Optional subtitle text             | `null`                    |
| `welcomeText`          | `String`       | Welcome/bottom text                | `"Welcome"`               |
| `firstTextColor`       | `Color`        | Color of first text                | `Colors.white`            |
| `secondTextColor`      | `Color`        | Color of second text               | `Colors.white`            |
| `subtitleColor`        | `Color?`       | Color of subtitle                  | `Colors.white70`          |
| `welcomeTextColor`     | `Color`        | Color of welcome text              | `Colors.white70`          |
| `sunsetDuration`       | `Duration`     | Background animation duration      | `Duration(seconds: 3)`    |
| `textAnimationDuration`| `Duration`     | Text animations duration           | `Duration(seconds: 2)`    |
| `customCenterWidget`   | `Widget?`      | Custom widget during initial phase | `null`                    |
| `gradientColors`       | `List<Color>?` | Custom gradient colors             | Sunset gradient           |
| `onComplete`           | `VoidCallback?`| Animation completion callback      | `null`                    |



## Example Code Structure

example/
├── lib/
│   └── main.dart         # Main example code
├── test/
│   └── widget_test.dart  # Example tests
└── pubspec.yaml          # Example dependencies


Example App Code (example/lib/main.dart)

``` import 'package:flutter/material.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Splash Plus Demo',
      home: AnimatedSplashPlus(
        firstText: 'Business',
        secondText: 'Manager',
        subtitle: 'Your Business Solution',
        welcomeText: 'Loading...',
        onComplete: () {
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
