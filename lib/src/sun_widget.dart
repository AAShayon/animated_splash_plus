import 'package:flutter/material.dart';

/// A customizable widget that represents a sun with animations.
///
/// This widget can display either a gradient-based sun or an image-based sun,
/// depending on whether an [image] is provided. It supports animations for scaling,
/// color transitions, and shadow effects.
class CustomSunWidget extends StatelessWidget {
  /// The current value of the animation, ranging from 0.0 to 1.0.
  ///
  /// This value determines the state of the sun's animation, including its size,
  /// color transition, and shadow effects.
  final double animationValue;

  /// The starting color of the sun gradient.
  ///
  /// Defaults to [Colors.orange].
  final Color startColor;

  /// The ending color of the sun gradient.
  ///
  /// Defaults to [Colors.red].
  final Color endColor;

  /// The size of the sun widget.
  ///
  /// Defaults to 100 pixels.
  final double size;

  /// The scaling factor applied to the sun during the animation.
  ///
  /// This value determines how much the sun shrinks as the animation progresses.
  /// Defaults to 0.3.
  final double scaleFactor;

  /// Optional shadows applied to the sun widget.
  ///
  /// If not provided, a default shadow will be used based on the [startColor]
  /// and [endColor].
  final List<BoxShadow>? shadows;

  /// An optional image provider for the sun.
  ///
  /// If provided, the image will replace the gradient-based sun. The image will
  /// be clipped into a circular shape and scaled to fit the specified [size].
  final ImageProvider? image;

  /// Creates a new instance of [CustomSunWidget].
  ///
  /// All parameters are optional and have default values.
  const CustomSunWidget({
    super.key,
    required this.animationValue,
    this.startColor = Colors.orange,
    this.endColor = Colors.red,
    this.size = 100,
    this.scaleFactor = 0.3,
    this.shadows,
    this.image, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0 - (animationValue * scaleFactor),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Use image if provided, otherwise use RadialGradient
          image: image != null
              ? DecorationImage(
            image: image!,
            fit: BoxFit.cover, // Ensure the image fits within the circle
          )
              : null,
          gradient: image == null
              ? RadialGradient(
            colors: [
              Color.lerp(startColor, endColor, animationValue)!,
              Color.lerp(
                _adjustColorOpacity(startColor, 0.8),
                _adjustColorOpacity(endColor, 0.8),
                animationValue,
              )!,
            ],
          )
              : null, // No gradient if an image is provided
          boxShadow: shadows ??
              [
                BoxShadow(
                  color: Color.lerp(
                    _adjustColorOpacity(startColor, 0.5),
                    _adjustColorOpacity(endColor, 0.5),
                    animationValue,
                  )!,
                  spreadRadius: 20,
                  blurRadius: 50,
                ),
              ],
        ),
      ),
    );
  }

  /// Adjusts the opacity of a given color using `.withAlpha()` to avoid precision loss.
  ///
  /// This method replaces the deprecated `withOpacity` method to ensure better
  /// precision when modifying the color's alpha channel.
  Color _adjustColorOpacity(Color color, double opacity) {
    assert(opacity >= 0 && opacity <= 1, 'Opacity must be between 0 and 1.');
    return color.withAlpha((opacity * 255).round());
  }
}