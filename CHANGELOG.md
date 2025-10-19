# Changelog

All notable changes to NetPromoterScoreKit will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive GitHub documentation
- Multiple usage examples (simple and advanced)
- Component architecture analysis
- Customization guide
- Contributing guidelines

### Changed
- Improved README with better structure
- Enhanced documentation with visual examples
- Better code organization

## [1.0.0] - 2024-01-XX

### Added
- Initial release of NetPromoterScoreKit
- Two UI styles: Star rating and Digit rating (0-10)
- Highly customizable configuration system
- Async/await support for modern Swift
- Smart duplicate prevention system
- Network integration with built-in API communication
- Optional comment collection
- Modal presentation with flexible styles
- Real-time analytics and user interaction tracking
- Support for iOS 13.0+
- Swift Package Manager and CocoaPods support

### Features
- **NetPromoterScoreKit**: Main entry point with async configuration
- **View Components**: 
  - `NetPromoterScoreView_Digit`: 0-10 rating with color-coded buttons
  - `NetPromoterScoreView_Star`: Traditional star rating interface
- **Configuration System**:
  - `NetPromoterScoreViewConfig`: 50+ customizable properties
  - `NetPromoterScoreServiceConfig`: Service-level settings
- **Service Layer**: Built-in API integration and data persistence
- **Protocols**: Clean architecture with protocol-oriented design

### Customization Options
- Colors: Button colors, gauge colors, text colors, background colors
- Fonts: Header, title, question, button fonts
- Text: All text content customizable
- Layout: Spacing, margins, corner radius, animations
- Buttons: Submit/cancel button styling and behavior

### Architecture
- MVVM pattern implementation
- Protocol-oriented programming
- Builder pattern for configuration
- Observer pattern for reactive UI
- Clean separation of concerns

## [0.9.0] - 2024-01-XX (Pre-release)

### Added
- Basic NPS survey functionality
- Simple configuration system
- Basic UI components

### Changed
- Initial implementation
- Basic customization options

## [0.8.0] - 2024-01-XX (Alpha)

### Added
- Core NPS functionality
- Basic UI implementation
- Initial configuration system

### Changed
- Early development version
- Basic features only

---

## Version History

- **1.0.0**: First stable release with full feature set
- **0.9.0**: Pre-release with basic functionality
- **0.8.0**: Alpha version with core features

## Migration Guide

### From 0.9.0 to 1.0.0
No breaking changes. All existing code will continue to work.

### From 0.8.0 to 1.0.0
Minor API changes in configuration. Update your configuration code:

```swift
// Old (0.8.0)
let config = NetPromoterScoreViewConfig()
config.buttonBackColor1 = UIColor.systemOrange

// New (1.0.0)
let config = NetPromoterScoreViewConfig()
config.buttonScoreColor1 = UIColor.systemOrange
```

## Future Roadmap

### Planned Features
- [ ] SwiftUI support
- [ ] Additional UI themes
- [ ] Advanced animations
- [ ] Localization support
- [ ] Accessibility improvements
- [ ] Performance optimizations

### Under Consideration
- [ ] Custom gauge styles
- [ ] Additional rating scales
- [ ] Advanced analytics
- [ ] Custom validation rules
- [ ] Multi-language support

---

For more information about changes, see the [GitHub Releases](https://github.com/ControlKit/NetPromoterScoreKit/releases) page.

## Cross-Platform Support

This iOS library is part of the ControlKit ecosystem:

- **iOS**: [NetPromoterScoreKit](https://github.com/ControlKit/NetPromoterScoreKit) (Swift/UIKit)
- **Android**: [NetPromoterScoreKit-Android](https://github.com/ControlKit/NetPromoterScoreKit-Android) (Kotlin/Compose)

Both libraries maintain API consistency for seamless cross-platform development.

