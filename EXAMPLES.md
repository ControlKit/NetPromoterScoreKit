# NetPromoterScoreKit Examples 📚

This document provides comprehensive examples and use cases for the NetPromoterScoreKit.

## 🌐 Cross-Platform Development

This project is part of the ControlKit ecosystem, providing consistent NPS experiences across platforms:

- **iOS**: [NetPromoterScoreKit](https://github.com/ControlKit/NetPromoterScoreKit) (Swift/UIKit)
- **Android**: [NetPromoterScoreKit-Android](https://github.com/ControlKit/NetPromoterScoreKit-Android) (Kotlin/Compose)

Both libraries share the same configuration system and API design, making cross-platform development seamless.

## 🚀 Basic Examples

### Example 1: Minimal Setup
```swift
import NetPromoterScoreKit

class BasicViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBasicNPS()
    }
    
    private func showBasicNPS() {
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: NetPromoterScoreServiceConfig(
            name: "MyApp",
            appId: "your-app-id",
            viewConfig: NetPromoterScoreViewConfig()
        ))
    }
}
```

### Example 2: With Custom Timing
```swift
class TimedViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Show NPS after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.showNPS()
        }
    }
    
    private func showNPS() {
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: NetPromoterScoreServiceConfig(
            name: "TimedApp",
            appId: "your-app-id",
            viewConfig: NetPromoterScoreViewConfig()
        ))
    }
}
```

## 🎨 Advanced Customization Examples

### Example 3: Branded Theme
```swift
class BrandedViewController: UIViewController {
    private func showBrandedNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Brand colors
        config.buttonScoreColor1 = UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0)
        config.buttonScoreColor2 = UIColor(red: 0.3, green: 0.7, blue: 0.9, alpha: 1.0)
        config.buttonScoreColor3 = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        config.buttonScoreColor4 = UIColor(red: 0.5, green: 0.9, blue: 1.0, alpha: 1.0)
        config.buttonScoreColor5 = UIColor(red: 0.6, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Brand fonts
        config.headerFont = UIFont(name: "Helvetica-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        config.titleFont = UIFont(name: "Helvetica-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
        
        // Brand text
        config.headerText = "Welcome to Our Brand"
        config.titleText = "Help us improve your experience"
        config.questionText = "How likely are you to recommend our brand?"
        
        // Brand buttons
        config.submitButtonTitle = "Share Feedback"
        config.cancelButtonTitle = "Not Now"
        config.submitButtonBackColor = UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0)
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "BrandedApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 4: Dark Mode Support
```swift
class DarkModeViewController: UIViewController {
    private func showDarkModeNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Dark mode colors
        config.containerViewBackColor = UIColor.systemBackground
        config.contentViewBackColor = UIColor.black.withAlphaComponent(0.8)
        
        // Dark mode text colors
        config.headerColor = UIColor.label
        config.titleColor = UIColor.label
        config.questionTitleColor = UIColor.label
        
        // Dark mode button colors
        config.buttonScoreColor1 = UIColor.systemOrange
        config.buttonScoreColor2 = UIColor.systemYellow
        config.buttonScoreColor3 = UIColor.systemGreen
        config.buttonScoreColor4 = UIColor.systemBlue
        config.buttonScoreColor5 = UIColor.systemPurple
        
        // Dark mode gauge
        config.gaugeColorCodes = "FF9500,FFCC00,34C759,007AFF,5856D6"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "DarkModeApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 5: Multi-language Support
```swift
class LocalizedViewController: UIViewController {
    private func showLocalizedNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Localized text
        config.headerText = NSLocalizedString("nps.header", comment: "NPS Header")
        config.titleText = NSLocalizedString("nps.title", comment: "NPS Title")
        config.questionText = NSLocalizedString("nps.question", comment: "NPS Question")
        config.submitButtonTitle = NSLocalizedString("nps.submit", comment: "Submit Button")
        config.cancelButtonTitle = NSLocalizedString("nps.cancel", comment: "Cancel Button")
        
        // Localized labels
        config.minTitleText = NSLocalizedString("nps.min", comment: "Min Label")
        config.maxTitleText = NSLocalizedString("nps.max", comment: "Max Label")
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "LocalizedApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

## 🎯 Use Case Examples

### Example 6: Post-Purchase Survey
```swift
class PurchaseViewController: UIViewController {
    func purchaseCompleted() {
        // Show NPS after successful purchase
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showPostPurchaseNPS()
        }
    }
    
    private func showPostPurchaseNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Purchase-specific text
        config.headerText = "Thank You for Your Purchase!"
        config.titleText = "We'd love to hear about your experience"
        config.questionText = "How likely are you to recommend our store to friends?"
        
        // Success colors
        config.buttonScoreColor1 = UIColor.systemGreen
        config.buttonScoreColor2 = UIColor.systemGreen
        config.buttonScoreColor3 = UIColor.systemGreen
        config.buttonScoreColor4 = UIColor.systemGreen
        config.buttonScoreColor5 = UIColor.systemGreen
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "PostPurchase",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 7: App Store Review Prompt
```swift
class ReviewViewController: UIViewController {
    private func showReviewPromptNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Review-specific text
        config.headerText = "Love Our App?"
        config.titleText = "Your feedback helps us improve"
        config.questionText = "How likely are you to recommend our app?"
        
        // App store colors
        config.buttonScoreColor1 = UIColor.systemBlue
        config.buttonScoreColor2 = UIColor.systemBlue
        config.buttonScoreColor3 = UIColor.systemBlue
        config.buttonScoreColor4 = UIColor.systemBlue
        config.buttonScoreColor5 = UIColor.systemBlue
        
        // Custom buttons
        config.submitButtonTitle = "Rate on App Store"
        config.cancelButtonTitle = "Maybe Later"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "AppStoreReview",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 8: Customer Support Follow-up
```swift
class SupportViewController: UIViewController {
    func supportTicketClosed() {
        // Show NPS after support ticket is closed
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showSupportFollowUpNPS()
        }
    }
    
    private func showSupportFollowUpNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Support-specific text
        config.headerText = "Support Ticket Resolved"
        config.titleText = "How was your support experience?"
        config.questionText = "How likely are you to recommend our support team?"
        
        // Support colors
        config.buttonScoreColor1 = UIColor.systemOrange
        config.buttonScoreColor2 = UIColor.systemYellow
        config.buttonScoreColor3 = UIColor.systemGreen
        config.buttonScoreColor4 = UIColor.systemBlue
        config.buttonScoreColor5 = UIColor.systemPurple
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "SupportFollowUp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

## 🔧 Integration Examples

### Example 9: Tab Bar Integration
```swift
class TabBarViewController: UITabBarController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Show NPS on specific tab
        if selectedIndex == 0 {
            showNPSForMainTab()
        }
    }
    
    private func showNPSForMainTab() {
        let config = NetPromoterScoreViewConfig()
        config.headerText = "Main Tab Experience"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "MainTab",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 10: Navigation Controller Integration
```swift
class NavigationViewController: UINavigationController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Show NPS after navigation
        if viewControllers.count > 1 {
            showNavigationNPS()
        }
    }
    
    private func showNavigationNPS() {
        let config = NetPromoterScoreViewConfig()
        config.headerText = "Navigation Experience"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "Navigation",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

## 📊 Analytics Integration

### Example 11: Custom Analytics
```swift
class AnalyticsViewController: UIViewController {
    private func showNPSWithAnalytics() {
        let config = NetPromoterScoreViewConfig()
        
        // Track NPS display
        Analytics.track("nps_survey_displayed", properties: [
            "screen": "main",
            "user_type": "premium"
        ])
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "AnalyticsApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

## 🎨 Custom Styling Examples

### Example 12: Minimalist Design
```swift
class MinimalistViewController: UIViewController {
    private func showMinimalistNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Minimalist colors
        config.containerViewBackColor = UIColor.white
        config.buttonScoreColor1 = UIColor.systemGray2
        config.buttonScoreColor2 = UIColor.systemGray3
        config.buttonScoreColor3 = UIColor.systemGray4
        config.buttonScoreColor4 = UIColor.systemGray5
        config.buttonScoreColor5 = UIColor.systemGray6
        
        // Minimalist fonts
        config.headerFont = UIFont.systemFont(ofSize: 16, weight: .light)
        config.titleFont = UIFont.systemFont(ofSize: 14, weight: .light)
        
        // Minimalist text
        config.headerText = "Feedback"
        config.titleText = "Rate your experience"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "MinimalistApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

### Example 13: Colorful Design
```swift
class ColorfulViewController: UIViewController {
    private func showColorfulNPS() {
        let config = NetPromoterScoreViewConfig()
        
        // Rainbow colors
        config.buttonScoreColor1 = UIColor.systemRed
        config.buttonScoreColor2 = UIColor.systemOrange
        config.buttonScoreColor3 = UIColor.systemYellow
        config.buttonScoreColor4 = UIColor.systemGreen
        config.buttonScoreColor5 = UIColor.systemBlue
        
        // Colorful gauge
        config.gaugeColorCodes = "FF3B30,FF9500,FFCC00,34C759,007AFF"
        
        // Fun text
        config.headerText = "🎉 Rate Your Experience!"
        config.titleText = "Help us make it even better!"
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "ColorfulApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

## 🔄 Conditional Display Examples

### Example 14: User Segment Based
```swift
class SegmentViewController: UIViewController {
    private func showSegmentBasedNPS() {
        let userSegment = getUserSegment()
        
        let config = NetPromoterScoreViewConfig()
        
        switch userSegment {
        case "premium":
            config.headerText = "Premium Experience"
            config.buttonScoreColor1 = UIColor.systemGold
        case "free":
            config.headerText = "Free Experience"
            config.buttonScoreColor1 = UIColor.systemBlue
        default:
            config.headerText = "General Experience"
        }
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "SegmentApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
    
    private func getUserSegment() -> String {
        // Your user segmentation logic
        return "premium"
    }
}
```

## 📱 Platform Specific Examples

### Example 15: iPhone vs iPad
```swift
class PlatformViewController: UIViewController {
    private func showPlatformSpecificNPS() {
        let config = NetPromoterScoreViewConfig()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            // iPad specific configuration
            config.alertContainerWidth = 400
            config.headerFont = UIFont.systemFont(ofSize: 24, weight: .bold)
            config.titleFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        } else {
            // iPhone specific configuration
            config.alertContainerWidth = 300
            config.headerFont = UIFont.systemFont(ofSize: 20, weight: .bold)
            config.titleFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: "PlatformApp",
            appId: "your-app-id",
            viewConfig: config
        )
        
        let npsKit = NetPromoterScoreKit()
        await npsKit.configure(root: self, config: serviceConfig)
    }
}
```

---

These examples demonstrate the flexibility and power of the NetPromoterScoreKit. You can mix and match these approaches to create the perfect NPS experience for your app!

