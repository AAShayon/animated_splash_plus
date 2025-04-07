import 'package:flutter/material.dart';

class AnimatedAppNameText extends StatelessWidget {
  final Animation<double> animation;
  final String part1;
  final String part2;
  final TextStyle textStyle;
  final double screenWidth;
  final List<Shadow>? shadows;

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
          Transform.translate(
            offset: Offset(
                -screenWidth * 0.2 * (1 - animation.value), 0),
            child: Text(
              part1,
              style: textStyle.copyWith(shadows: shadows),
            ),
          ),
          const SizedBox(width: 10),
          Transform.translate(
            offset: Offset(
                screenWidth * 0.2 * (1 - animation.value), 0),
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