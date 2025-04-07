import 'package:flutter/material.dart';

class CustomSunWidget extends StatelessWidget {
  final double animationValue;
  final Color startColor;
  final Color endColor;
  final double size;
  final double scaleFactor;
  final List<BoxShadow>? shadows;

  const CustomSunWidget({
    super.key,
    required this.animationValue,
    this.startColor = Colors.orange,
    this.endColor = Colors.red,
    this.size = 100,
    this.scaleFactor = 0.3,
    this.shadows,
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
          gradient: RadialGradient(
            colors: [
              Color.lerp(startColor, endColor, animationValue)!,
              Color.lerp(
                startColor.withOpacity(0.8),
                endColor.withOpacity(0.8),
                animationValue,
              )!,
            ],
          ),
          boxShadow: shadows ??
              [
                BoxShadow(
                  color: Color.lerp(
                    startColor.withOpacity(0.5),
                    endColor.withOpacity(0.5),
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
}