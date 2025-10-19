# NetPromoterScoreKit 📊

[![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-lightgrey.svg)](NetPromoterScoreKit.podspec)

A powerful and customizable Net Promoter Score (NPS) component for iOS applications, built with Swift and UIKit. This kit provides a complete solution for collecting customer feedback through NPS surveys with beautiful, customizable UI components.

## 🎯 What is Net Promoter Score (NPS)?

Net Promoter Score is a customer satisfaction metric that measures how likely customers are to recommend your product or service to others. It's calculated by asking customers a simple question:

> "How likely are you to recommend [Company/Product] to a friend or colleague?"

Customers respond on a scale of 0-10, where:
- **9-10**: Promoters (loyal enthusiasts)
- **7-8**: Passives (satisfied but unenthusiastic)
- **0-6**: Detractors (unhappy customers)

**NPS = % Promoters - % Detractors**

## ✨ Features

- 🎨 **Two Beautiful UI Styles**: Star rating and digit-based rating
- 🎛️ **Highly Customizable**: Colors, fonts, text, and layout
- 📱 **iOS Native**: Built with UIKit and Swift
- 🔄 **Async/Await Support**: Modern Swift concurrency
- 📊 **Real-time Analytics**: Track user interactions
- 🎯 **Smart Display Logic**: Prevents duplicate surveys
- 🌐 **Network Integration**: Built-in API communication
- 📝 **Comment Support**: Optional feedback collection
- 🎭 **Modal Presentation**: Flexible presentation styles

## 🚀 Quick Start (2 Lines of Code!)

```swift
let npsKit = NetPromoterScoreKit()
await npsKit.configure(root: self, config: NetPromoterScoreServiceConfig(
    name: "MyApp",
    appId: "your-app-id",
    viewConfig: NetPromoterScoreViewConfig()
))
```

That's it! Your NPS survey is ready to go! 🎉

## 📦 Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ControlKit/NetPromoterScoreKit.git", from: "1.0.0")
]
```

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'NetPromoterScoreKit'
```

## 🎨 Usage Examples

### 1. Simple Usage (Basic Implementation)

```swift
import NetPromoterScoreKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Simple 2-line implementation
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: NetPromoterScoreServiceConfig(
            name: "MyApp",
            appId: "your-app-id",
            viewConfig: NetPromoterScoreViewConfig()
        ))
    }
}
```

### 2. Advanced Usage (Custom Configuration)

```swift
import NetPromoterScoreKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCustomNPSSurvey()
    }
    
    private func showCustomNPSSurvey() {
        // Create custom configuration
        let customConfig = NetPromoterScoreViewConfig()
        
        // Customize colors
        customConfig.buttonScoreColor1 = UIColor.systemOrange
        customConfig.buttonScoreColor2 = UIColor.systemYellow
        customConfig.buttonScoreColor3 = UIColor.systemGreen
        customConfig.buttonScoreColor4 = UIColor.systemBlue
        customConfig.buttonScoreColor5 = UIColor.systemPurple
        
        // Customize gauge colors
        customConfig.gaugeColorCodes = "FF6B6B,4ECDC4,45B7D1"
        
        // Customize text
        customConfig.headerText = "Rate Our Service"
        customConfig.titleText = "Your feedback helps us improve!"
        customConfig.questionText = "How likely are you to recommend us?"
        
        // Customize fonts
        customConfig.headerFont = UIFont.boldSystemFont(ofSize: 20)
        customConfig.titleFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        // Customize buttons
        customConfig.submitButtonTitle = "Send Feedback"
        customConfig.cancelButtonTitle = "Maybe Later"
        customConfig.submitButtonBackColor = UIColor.systemBlue
        customConfig.cancelButtonBackColor = UIColor.systemGray5
        
        // Create service configuration
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "PremiumApp",
            appId: "your-app-id",
            viewConfig: customConfig
        )
        
        // Present NPS survey
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(
            root: self,
            modalPresentationStyle: .overCurrentContext,
            config: serviceConfig
        )
    }
}
```

## 🏗️ Architecture & Components

### Core Architecture

The NetPromoterScoreKit follows a clean, modular architecture:

```
NetPromoterScoreKit
├── 📱 NetPromoterScoreViewController (Main Controller)
├── 🎨 View Components
│   ├── NetPromoterScoreView_Digit (0-10 rating)
│   └── NetPromoterScoreView_Star (Star rating)
├── ⚙️ Configuration
│   ├── NetPromoterScoreServiceConfig (Service settings)
│   └── NetPromoterScoreViewConfig (UI customization)
├── 🔄 ViewModel
│   └── NetPromoterScoreViewModel (Business logic)
├── 🌐 Service Layer
│   ├── NetPromoterScoreRequest (API requests)
│   └── NetPromoterScoreResponse (API responses)
└── 📋 Protocols
    ├── NetPromoterScoreable (Core functionality)
    ├── NPSActionable (User actions)
    └── NPSSavable (Data persistence)
```

### Key Components Analysis

#### 1. **NetPromoterScoreKit** (Main Entry Point)
- **Purpose**: Primary interface for integrating NPS surveys
- **Key Features**: 
  - Async/await configuration
  - Smart duplicate prevention
  - Flexible presentation styles
- **Usage**: Single point of entry for all NPS functionality

#### 2. **View Components** (UI Layer)
- **NetPromoterScoreView_Digit**: 
  - 0-10 rating scale with color-coded buttons
  - Customizable gauge visualization
  - Interactive feedback collection
- **NetPromoterScoreView_Star**: 
  - Traditional star rating interface
  - Smooth animations and interactions

#### 3. **Configuration System** (Customization)
- **NetPromoterScoreViewConfig**: 
  - 50+ customizable properties
  - Colors, fonts, text, spacing
  - Button styles and behaviors
- **NetPromoterScoreServiceConfig**: 
  - Service-level settings
  - App identification
  - Version tracking

#### 4. **Service Layer** (Data Management)
- **Network Communication**: Built-in API integration
- **Data Persistence**: UserDefaults for tracking
- **Error Handling**: Comprehensive error management
- **Analytics**: User interaction tracking

### Design Patterns Used

1. **MVVM Pattern**: Clean separation of concerns
2. **Protocol-Oriented Programming**: Flexible and testable
3. **Builder Pattern**: Easy configuration and customization
4. **Observer Pattern**: Reactive UI updates
5. **Singleton Pattern**: Shared service instances

## 🎛️ Customization Options

### Visual Customization

```swift
let config = NetPromoterScoreViewConfig()

// Colors
config.buttonScoreColor1 = UIColor.systemOrange
config.buttonScoreColor2 = UIColor.systemYellow
config.buttonScoreColor3 = UIColor.systemGreen
config.buttonScoreColor4 = UIColor.systemBlue
config.buttonScoreColor5 = UIColor.systemPurple

// Gauge customization
config.gaugeColorCodes = "FF6B6B,4ECDC4,45B7D1"

// Text customization
config.headerText = "Rate Our Service"
config.titleText = "Your feedback matters!"
config.questionText = "How likely are you to recommend us?"

// Font customization
config.headerFont = UIFont.boldSystemFont(ofSize: 20)
config.titleFont = UIFont.systemFont(ofSize: 16, weight: .medium)
config.questionFont = UIFont.systemFont(ofSize: 14, weight: .regular)

// Button customization
config.submitButtonTitle = "Send Feedback"
config.cancelButtonTitle = "Maybe Later"
config.submitButtonBackColor = UIColor.systemBlue
config.cancelButtonRadius = 10.0
```

### Layout Customization

```swift
// Container styling
config.containerViewBackColor = UIColor.systemBackground
config.containerViewRadius = 20.0

// Spacing and margins
config.alertHorizontalPadding = 24
config.alertContainerWidth = 300

// Animation settings
config.alertFadeAnimationDuration = 0.3
config.alertScaleAnimationDuration = 0.5
```

## 📊 Analytics & Tracking

The kit automatically tracks:

- **User Interactions**: Button taps, score selections
- **Survey Completion**: Success/failure rates
- **Duplicate Prevention**: Smart ID tracking
- **Performance Metrics**: Load times, response rates

## 🔧 Advanced Configuration

### Custom Service Integration

```swift
// Custom service implementation
class CustomNPSService: GenericServiceProtocol {
    func execute<T>(request: T) async throws -> Result<NetPromoterScoreResponse>? {
        // Your custom implementation
        return nil
    }
}

// Usage with custom service
let customService = CustomNPSService()
let npsKit = NetPromoterScoreKit(npsService: customService)
```

### Conditional Display Logic

```swift
// Smart display based on user behavior
if shouldShowNPSSurvey() {
    await npsKit.configure(root: self, config: serviceConfig)
}

private func shouldShowNPSSurvey() -> Bool {
    // Your custom logic
    return UserDefaults.standard.bool(forKey: "hasShownNPS") == false
}
```

## 🎨 UI Styles

### Digit Style (Default)
- Clean 0-10 rating interface
- Color-coded score ranges
- Interactive gauge visualization
- Optional comment collection

### Star Style
- Traditional 5-star rating
- Smooth animations
- Visual feedback
- Customizable star colors

## 📱 Requirements

- iOS 13.0+
- Swift 5.0+
- Xcode 12.0+

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](https://github.com/ControlKit/NetPromoterScoreKit/blob/main/CONTRIBUTING.md) for details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/ControlKit/NetPromoterScoreKit/blob/main/LICENSE) file for details.

## 🙏 Acknowledgments

- Built with ❤️ using Swift and UIKit
- Inspired by modern iOS design principles
- Community-driven development

## 📱 Cross-Platform Support

This project is part of the ControlKit ecosystem, providing NPS solutions for both platforms:

- **iOS**: [NetPromoterScoreKit](https://github.com/ControlKit/NetPromoterScoreKit) (Swift/UIKit)
- **Android**: [NetPromoterScoreKit-Android](https://github.com/ControlKit/NetPromoterScoreKit-Android) (Kotlin/Compose)

Both libraries share the same API design and configuration system, making it easy to maintain consistent NPS experiences across your iOS and Android apps.

## 📞 Support

- 📧 Email: support@controlkit.com
- 🐛 Issues: [GitHub Issues](https://github.com/ControlKit/NetPromoterScoreKit/issues)
- 📖 Documentation: [Full Documentation](https://github.com/ControlKit/NetPromoterScoreKit/wiki)
- 🌐 Website: [ControlKit](https://controlkit.com)

---

**Made with ❤️ for the iOS community**