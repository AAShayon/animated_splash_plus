import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() {
  testWidgets('Should render splash screen with basic text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSplashPlus(
          config: SplashConfig(
            appNamePart1: 'Business',
            appNamePart2: 'Manager',
            subtitle: 'Your Business Solution Partner',
            welcomeText: 'Welcome',
          ),
        ),
      ),
    );

    // Need to pump multiple times to complete animations
    await tester.pumpAndSettle();

    expect(find.text('Business'), findsOneWidget);
    expect(find.text('Manager'), findsOneWidget);
    expect(find.text('Your Business Solution Partner'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('Should work with default parameters', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSplashPlus(),
      ),
    );

    await tester.pumpAndSettle();

    // Check for default values
    expect(find.text('Business'), findsOneWidget);
    expect(find.text('Manager'), findsOneWidget);
    expect(find.text('Your Business Solution Partner'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('Should handle custom text values', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSplashPlus(
          config: SplashConfig(
            appNamePart1: 'My',
            appNamePart2: 'App',
            subtitle: 'Custom Subtitle',
            welcomeText: 'Loading...',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('My'), findsOneWidget);
    expect(find.text('App'), findsOneWidget);
    expect(find.text('Custom Subtitle'), findsOneWidget);
    expect(find.text('Loading...'), findsOneWidget);
  });
}
