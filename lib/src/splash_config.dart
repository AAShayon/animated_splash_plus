import 'package:flutter/material.dart';


/// A configuration class for customizing the [AnimatedSplashPlus] widget.
///
/// This class allows you to define various properties for the splash screen,
/// including colors, animations, text styles, and an optional sun image.
class SplashConfig {
  /// The full name of the app displayed on the splash screen.
  final String appName;

  /// The first part of the app name (e.g., "Business").
  final String appNamePart1;

  /// The second part of the app name (e.g., "Manager").
  final String appNamePart2;

  /// The subtitle displayed below the app name.
  final String subtitle;

  /// The welcome text displayed during the splash animation.
  final String welcomeText;

  /// The duration of the sunset animation.
  final Duration sunsetDuration;

  /// The duration of the text animation.
  final Duration textAnimationDuration;

  /// The starting color of the sun.
  final Color sunStartColor;

  /// The ending color of the sun.
  final Color sunEndColor;

  /// The top color of the sky at the start of the animation.
  final Color skyStartTopColor;

  /// The middle color of the sky at the start of the animation.
  final Color skyStartMiddleColor;

  /// The bottom color of the sky at the start of the animation.
  final Color skyStartBottomColor;

  /// The top color of the sky at the end of the animation.
  final Color skyEndTopColor;

  /// The middle color of the sky at the end of the animation.
  final Color skyEndMiddleColor;

  /// The bottom color of the sky at the end of the animation.
  final Color skyEndBottomColor;

  /// The text style for the app name.
  final TextStyle appNameTextStyle;

  /// The text style for the subtitle.
  final TextStyle subtitleTextStyle;

  /// The text style for the welcome text.
  final TextStyle welcomeTextStyle;

  /// The size of the sun widget.
  final double sunSize;

  /// The scaling factor applied to the sun during the sunset animation.
  final double sunScaleFactor;

  /// The curve used for the sunset animation.
  final Curve sunsetCurve;

  /// The curve used for the text appearance animation.
  final Curve textAppearCurve;

  /// The curve used for the welcome text animation.
  final Curve welcomeTextCurve;

  /// An optional image provider for the sun widget.
  ///
  /// If provided, this image will replace the gradient-based sun.
  final ImageProvider? sunImage;

  /// Creates a new instance of [SplashConfig].
  ///
  /// All parameters are optional and have default values.
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
    this.sunImage, // Optional image provider for the sun
  });

  /// Creates a copy of this [SplashConfig] with specified fields replaced.
  ///
  /// Use this method to modify specific properties while keeping the rest unchanged.
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
    ImageProvider? sunImage, // Add sunImage to copyWith
  }) {
    return SplashConfig(
      appName: appName ?? this.appName,
      appNamePart1: appNamePart1 ?? this.appNamePart1,
      appNamePart2: appNamePart2 ?? this.appNamePart2,
      subtitle: subtitle ?? this.subtitle,
      welcomeText: welcomeText ?? this.welcomeText,
      sunsetDuration: sunsetDuration ?? this.sunsetDuration,
      textAnimationDuration:
      textAnimationDuration ?? this.textAnimationDuration,
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
      sunImage: sunImage ?? this.sunImage, // Add sunImage to copyWith
    );
  }
}
