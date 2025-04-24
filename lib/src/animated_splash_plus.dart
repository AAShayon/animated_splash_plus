import 'package:flutter/material.dart';
import 'splash_config.dart';
import 'sun_widget.dart';
import 'animated_text.dart';

/// A highly customizable animated splash screen for Flutter apps.
///
/// Features:
/// - Beautiful sunset animation 🌅
/// - Configurable text animations
/// - Callback when animation completes
///
/// ```dart
/// AnimatedSplashPlus(
///   config: SplashConfig(),
///   onAnimationComplete: () => print("Done!"),
/// )
/// ``
/// A customizable animated splash screen widget for Flutter.
///
/// This widget provides a beautiful sunset effect with animated text and an optional sun image.
class AnimatedSplashPlus extends StatefulWidget {
  /// The configuration for the splash screen.
  final SplashConfig config;

  /// A callback invoked when the splash animation completes.
  final VoidCallback? onAnimationComplete;

  /// Creates a new instance of [AnimatedSplashPlus].
  ///
  /// The [config] parameter is optional and defaults to a new [SplashConfig] instance.
  const AnimatedSplashPlus({
    super.key,
    SplashConfig? config,
    this.onAnimationComplete,
  }) : config = config ?? const SplashConfig();

  @override
  State<AnimatedSplashPlus> createState() => _AnimatedSplashPlusState();
}

class _AnimatedSplashPlusState extends State<AnimatedSplashPlus>
    with TickerProviderStateMixin {
  late AnimationController _sunsetController;
  late Animation<double> _sunsetAnimation;

  late AnimationController _textController;
  late Animation<double> _textAnimation;
  late Animation<double> _welcomeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize sunset animation controller
    _sunsetController = AnimationController(
      vsync: this,
      duration: widget.config.sunsetDuration,
    );

    _sunsetAnimation = CurvedAnimation(
      parent: _sunsetController,
      curve: widget.config.sunsetCurve,
    );

    // Initialize text animation controller
    _textController = AnimationController(
      vsync: this,
      duration: widget.config.textAnimationDuration,
    );

    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOut),
      ),
    );

    _welcomeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start animations in sequence
    _sunsetController.forward().then((_) {
      _textController.forward().then((_) {
        if (widget.onAnimationComplete != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onAnimationComplete!();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _sunsetController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([_sunsetController, _textController]),
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.lerp(
                    widget.config.skyStartTopColor,
                    widget.config.skyEndTopColor,
                    _sunsetAnimation.value,
                  )!,
                  Color.lerp(
                    widget.config.skyStartMiddleColor,
                    widget.config.skyEndMiddleColor,
                    _sunsetAnimation.value,
                  )!,
                  Color.lerp(
                    widget.config.skyStartBottomColor,
                    widget.config.skyEndBottomColor,
                    _sunsetAnimation.value,
                  )!,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // Sun animation
                Positioned(
                  top: screenHeight * 0.3 * _sunsetAnimation.value,
                  left: screenWidth * 0.4,
                  child: CustomSunWidget(
                    animationValue: _sunsetAnimation.value,
                    startColor: widget.config.sunStartColor,
                    endColor: widget.config.sunEndColor,
                    size: widget.config.sunSize,
                    scaleFactor: widget.config.sunScaleFactor,
                    image: widget.config.sunImage, // Pass the optional image
                  ),
                ),

                // App name text - appears after sunset completes
                if (_sunsetController.isCompleted) ...[
                  Center(
                    child: AnimatedAppNameText(
                      animation: _textAnimation,
                      part1: widget.config.appNamePart1,
                      part2: widget.config.appNamePart2,
                      textStyle: widget.config.appNameTextStyle,
                      screenWidth: screenWidth,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.5),
                        )
                      ],
                    ),
                  ),

                  // Subtitle
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Opacity(
                        opacity: _textAnimation.value,
                        child: Text(
                          widget.config.subtitle,
                          style: widget.config.subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),

                  // Welcome text
                  Transform.translate(
                    offset: Offset(
                      0,
                      screenHeight * 0.2 * (1 - _welcomeAnimation.value),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.2),
                        child: Opacity(
                          opacity: _welcomeAnimation.value,
                          child: Text(
                            widget.config.welcomeText,
                            style: widget.config.welcomeTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
