import 'package:flutter/material.dart';
import 'splash_controller.dart';

class AnimatedSplashPlus extends StatefulWidget {
  final String firstText;
  final String secondText;
  final String? subtitle;
  final String welcomeText;

  final Color firstTextColor;
  final Color secondTextColor;
  final Color? subtitleColor;
  final Color welcomeTextColor;

  final double firstTextSize;
  final double secondTextSize;
  final double? subtitleSize;
  final double welcomeTextSize;

  final Duration sunsetDuration;
  final Duration textAnimationDuration;

  final Widget? customCenterWidget;
  final List<Color>? gradientColors;

  final VoidCallback? onComplete;

  const AnimatedSplashPlus({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.subtitle,
    this.welcomeText = "Welcome",
    this.firstTextColor = Colors.white,
    this.secondTextColor = Colors.white,
    this.subtitleColor,
    this.welcomeTextColor = Colors.white70,
    this.firstTextSize = 34,
    this.secondTextSize = 34,
    this.subtitleSize = 16,
    this.welcomeTextSize = 28,
    this.sunsetDuration = const Duration(seconds: 3),
    this.textAnimationDuration = const Duration(seconds: 2),
    this.customCenterWidget,
    this.gradientColors,
    this.onComplete,
  }) : super(key: key);

  @override
  _AnimatedSplashPlusState createState() => _AnimatedSplashPlusState();
}

class _AnimatedSplashPlusState extends State<AnimatedSplashPlus>
    with TickerProviderStateMixin {
  late SplashController _controller;

  @override
  void initState() {
    _controller = SplashController(
      vsync: this,
      sunsetDuration: widget.sunsetDuration,
      textAnimationDuration: widget.textAnimationDuration,
      onComplete: widget.onComplete,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAnimatedSplash(),
    );
  }

  Widget _buildAnimatedSplash() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.gradientColors ?? _defaultGradientColors(),
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: _buildContentStack(),
        );
      },
    );
  }

  List<Color> _defaultGradientColors() {
    return [
      Color.lerp(const Color(0xFFFFD700), const Color(0xFFFF4500), _controller.sunsetValue)!,
      Color.lerp(const Color(0xFFFFA500), const Color(0xFF8B0000), _controller.sunsetValue)!,
      Color.lerp(const Color(0xFF4B0082), const Color(0xFF000000), _controller.sunsetValue)!,
    ];
  }

  Widget _buildContentStack() {
    return Stack(
      children: [
        if (widget.customCenterWidget != null)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 * _controller.sunsetValue,
            left: MediaQuery.of(context).size.width * 0.4,
            child: widget.customCenterWidget!,
          ),

        if (_controller.isSunsetComplete) _buildTextAnimations(),
      ],
    );
  }

  Widget _buildTextAnimations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildMainTextRow(),
        if (widget.subtitle != null) _buildSubtitle(),
        _buildWelcomeText(),
      ],
    );
  }

  Widget _buildMainTextRow() {
    return Opacity(
      opacity: _controller.textValue,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(-_getOffsetValue(_controller.textValue), 0),
            child: Text(
              widget.firstText,
              style: TextStyle(
                fontSize: widget.firstTextSize,
                color: widget.firstTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Transform.translate(
            offset: Offset(_getOffsetValue(_controller.textValue), 0),
            child: Text(
              widget.secondText,
              style: TextStyle(
                fontSize: widget.secondTextSize,
                color: widget.secondTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getOffsetValue(double animationValue) {
    return MediaQuery.of(context).size.width * 0.2 * (1 - animationValue);
  }

  Widget _buildSubtitle() {
    return Opacity(
      opacity: _controller.textValue,
      child: Text(
        widget.subtitle!,
        style: TextStyle(
          fontSize: widget.subtitleSize,
          color: widget.subtitleColor ?? widget.welcomeTextColor,
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Transform.translate(
      offset: Offset(0, _getWelcomeOffsetValue(_controller.welcomeValue)),
      child: Opacity(
        opacity: _controller.welcomeValue,
        child: Text(
          widget.welcomeText,
          style: TextStyle(
            fontSize: widget.welcomeTextSize,
            color: widget.welcomeTextColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  double _getWelcomeOffsetValue(double animationValue) {
    return MediaQuery.of(context).size.height * 0.2 * (1 - animationValue);
  }
}