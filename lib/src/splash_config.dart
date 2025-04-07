import 'package:flutter/material.dart';

class SplashConfig {
  final String appName;
  final String appNamePart1;
  final String appNamePart2;
  final String subtitle;
  final String welcomeText;
  final Duration sunsetDuration;
  final Duration textAnimationDuration;
  final Color sunStartColor;
  final Color sunEndColor;
  final Color skyStartTopColor;
  final Color skyStartMiddleColor;
  final Color skyStartBottomColor;
  final Color skyEndTopColor;
  final Color skyEndMiddleColor;
  final Color skyEndBottomColor;
  final TextStyle appNameTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle welcomeTextStyle;
  final double sunSize;
  final double sunScaleFactor;
  final Curve sunsetCurve;
  final Curve textAppearCurve;
  final Curve welcomeTextCurve;

  const SplashConfig({
    this.appName = 'Business Manager',
    this.appNamePart1 = 'Business',
    this.appNamePart2 = 'Manager',
    this.subtitle = 'Your Business Solution Partner',
    this.welcomeText = 'Welcome',
    this.sunsetDuration = const Duration(seconds: 3),
    this.textAnimationDuration = const Duration(seconds: 2),
    this.sunStartColor = Colors.orange,
    this.sunEndColor = Colors.red,
    this.skyStartTopColor = const Color(0xFFFFD700),
    this.skyStartMiddleColor = const Color(0xFFFFA500),
    this.skyStartBottomColor = const Color(0xFF4B0082),
    this.skyEndTopColor = const Color(0xFFFF4500),
    this.skyEndMiddleColor = const Color(0xFF8B0000),
    this.skyEndBottomColor = const Color(0xFF000000),
    this.appNameTextStyle = const TextStyle(
      fontSize: 34,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
    this.welcomeTextStyle = const TextStyle(
      fontSize: 28,
      color: Colors.white70,
      fontStyle: FontStyle.italic,
    ),
    this.sunSize = 100,
    this.sunScaleFactor = 0.3,
    this.sunsetCurve = Curves.easeInOut,
    this.textAppearCurve = Curves.easeOut,
    this.welcomeTextCurve = Curves.easeOut,
  });

  SplashConfig copyWith({
    String? appName,
    String? appNamePart1,
    String? appNamePart2,
    String? subtitle,
    String? welcomeText,
    Duration? sunsetDuration,
    Duration? textAnimationDuration,
    Color? sunStartColor,
    Color? sunEndColor,
    Color? skyStartTopColor,
    Color? skyStartMiddleColor,
    Color? skyStartBottomColor,
    Color? skyEndTopColor,
    Color? skyEndMiddleColor,
    Color? skyEndBottomColor,
    TextStyle? appNameTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? welcomeTextStyle,
    double? sunSize,
    double? sunScaleFactor,
    Curve? sunsetCurve,
    Curve? textAppearCurve,
    Curve? welcomeTextCurve,
  }) {
    return SplashConfig(
      appName: appName ?? this.appName,
      appNamePart1: appNamePart1 ?? this.appNamePart1,
      appNamePart2: appNamePart2 ?? this.appNamePart2,
      subtitle: subtitle ?? this.subtitle,
      welcomeText: welcomeText ?? this.welcomeText,
      sunsetDuration: sunsetDuration ?? this.sunsetDuration,
      textAnimationDuration: textAnimationDuration ?? this.textAnimationDuration,
      sunStartColor: sunStartColor ?? this.sunStartColor,
      sunEndColor: sunEndColor ?? this.sunEndColor,
      skyStartTopColor: skyStartTopColor ?? this.skyStartTopColor,
      skyStartMiddleColor: skyStartMiddleColor ?? this.skyStartMiddleColor,
      skyStartBottomColor: skyStartBottomColor ?? this.skyStartBottomColor,
      skyEndTopColor: skyEndTopColor ?? this.skyEndTopColor,
      skyEndMiddleColor: skyEndMiddleColor ?? this.skyEndMiddleColor,
      skyEndBottomColor: skyEndBottomColor ?? this.skyEndBottomColor,
      appNameTextStyle: appNameTextStyle ?? this.appNameTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      welcomeTextStyle: welcomeTextStyle ?? this.welcomeTextStyle,
      sunSize: sunSize ?? this.sunSize,
      sunScaleFactor: sunScaleFactor ?? this.sunScaleFactor,
      sunsetCurve: sunsetCurve ?? this.sunsetCurve,
      textAppearCurve: textAppearCurve ?? this.textAppearCurve,
      welcomeTextCurve: welcomeTextCurve ?? this.welcomeTextCurve,
    );
  }
}