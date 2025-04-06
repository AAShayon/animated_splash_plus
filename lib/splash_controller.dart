import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final AnimationController _sunsetController;
  final AnimationController _textController;
  final VoidCallback? onComplete;

  SplashController({
    required TickerProvider vsync,
    required Duration sunsetDuration,
    required Duration textAnimationDuration,
    this.onComplete,
  }) :
        _sunsetController = AnimationController(
          vsync: vsync,
          duration: sunsetDuration,
        ),
        _textController = AnimationController(
          vsync: vsync,
          duration: textAnimationDuration,
        ) {
    _init();
  }

  void _init() {
    _sunsetController.forward().then((_) {
      _textController.forward().then((_) {
        onComplete?.call();
      });
    });
  }

  double get sunsetValue => _sunsetController.value;
  double get textValue => _textController.value;
  double get welcomeValue => _textController.value;
  bool get isSunsetComplete => _sunsetController.isCompleted;

  @override
  void dispose() {
    _sunsetController.dispose();
    _textController.dispose();
    super.dispose();
  }
}