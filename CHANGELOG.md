## 1.0.2

### Enhancements
- Added detailed customization options for the sunset gradient background animation:
    - `skyStartTopColor`
    - `skyStartMiddleColor`
    - `skyStartBottomColor`
    - `skyEndTopColor`
    - `skyEndMiddleColor`
    - `skyEndBottomColor`
- Introduced customizable text styles:
    - `appNameTextStyle`
    - `subtitleTextStyle`
    - `welcomeTextStyle`
- Included `sunSize` and `sunScaleFactor` parameters for adjusting the size and scaling behavior of the animated sun.
- Added support for custom animation curves:
    - `sunsetCurve`
    - `textAppearCurve`
    - `welcomeTextCurve`
- Improved typography and animation control for a more flexible and polished splash experience.

### Bug Fixes
- Resolved issues with text alignment and positioning during animations.
- Fixed potential null safety warnings in the `SplashConfig` class by providing default values for all parameters.
