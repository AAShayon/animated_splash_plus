## 1.0.3

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
- **Sun Image Support:** Added the ability to use an image for the sun, replacing the previous gradient-only sun. This is achieved by introducing an optional `sunImage` parameter to the `SplashConfig` and `CustomSunWidget`.
- **Improved Text Animations:** Refactored `AnimatedAppNameText` to enhance the text animation quality, making it more fluid and engaging.
- **Enhanced Color Management**: Replaced `withOpacity` with `withAlpha` to improve color management.
- **Code Documentation:** Improved inline documentation across multiple classes (`AnimatedAppNameText`, `CustomSunWidget`, `SplashConfig`) to enhance readability and maintainability.

### Bug Fixes
- Resolved issues with text alignment and positioning during animations.
- Fixed potential null safety warnings in the `SplashConfig` class by providing default values for all parameters.