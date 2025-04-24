import 'package:flutter/material.dart';

/// A customizable animated text widget for displaying an app name in two parts.
///
/// This widget animates the appearance of two text parts (`part1` and `part2`)
/// by translating them from opposite directions and fading them into view.
/// It supports custom text styles, shadows, and animations.
class AnimatedAppNameText extends StatelessWidget {
  /// The animation controlling the opacity and translation of the text.
  ///
  /// The value of this animation determines how much the text has faded in and
  /// how far it has moved toward its final position.
  final Animation<double> animation;

  /// The first part of the app name (e.g., "Business").
  final String part1;

  /// The second part of the app name (e.g., "Manager").
  final String part2;

  /// The text style applied to both parts of the app name.
  final TextStyle textStyle;

  /// The width of the screen, used to calculate the translation distance.
  final double screenWidth;

  /// Optional shadows applied to the text.
  ///
  /// If provided, these shadows will be applied to both parts of the app name.
  final List<Shadow>? shadows;

  /// Creates a new instance of [AnimatedAppNameText].
  ///
  /// All parameters are required except [shadows], which is optional.
  const AnimatedAppNameText({
    super.key,
    required this.animation,
    required this.part1,
    required this.part2,
    required this.textStyle,
    required this.screenWidth,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First part of the app name
          Transform.translate(
            offset: Offset(-screenWidth * 0.2 * (1 - animation.value), 0),
            child: Text(
              part1,
              style: textStyle.copyWith(shadows: shadows),
            ),
          ),
          const SizedBox(width: 10),
          // Second part of the app name
          Transform.translate(
            offset: Offset(screenWidth * 0.2 * (1 - animation.value), 0),
            child: Text(
              part2,
              style: textStyle.copyWith(shadows: shadows),
            ),
          ),
        ],
      ),
    );
  }
}