import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_splash_plus/animated_splash_plus.dart';

void main() {
  testWidgets('Should render splash screen with basic text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSplashPlus(
          firstText: 'Business',
          secondText: 'Manager',
          subtitle: 'Your Business Solution',
          welcomeText: 'Loading...',
          // Skip animations for testing
          sunsetDuration: Duration.zero,
          textAnimationDuration: Duration.zero,
        ),
      ),
    );

    // Need to pump to complete animations
    await tester.pump();

    expect(find.text('Business'), findsOneWidget);
    expect(find.text('Manager'), findsOneWidget);
    expect(find.text('Your Business Solution'), findsOneWidget);
    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('Should work without optional parameters', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSplashPlus(
          firstText: 'App',
          secondText: 'Name',
          sunsetDuration: Duration.zero,
          textAnimationDuration: Duration.zero,
        ),
      ),
    );

    await tester.pump();

    expect(find.text('App'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Loading...'), findsNothing);
  });
}