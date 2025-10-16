//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class NetPromoterScoreViewConfig {
    public init() {}
    public var contentViewBackColor: UIColor = UIColor(r: 167, g: 167, b: 167, a: 0.8)
    public var containerViewBackColor: UIColor = .white
    public var containerViewRadius: CGFloat = 20.0
    public var gaugeViewBackColor: UIColor = .clear
    public var gaugeColorCodes: String = "fbd7aa,f7923c,ea580b"
    public var bottomViewBackColor: UIColor = UIColor(r: 245, g: 254, b: 255, a: 1.0)
    public var rateViewBackColor: UIColor = .clear
    public var logoImage: UIImage?
    public var gaugeImage: UIImage?
    public var digitFont = UIFont.systemFont(ofSize: 10, weight: .semibold)
    
    public var headerFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    public var headerText = "Rate the service"
    public var headerColor: UIColor = .black
    
    public var titleFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    public var titleText = "Your feedback will  help us get better!"
    public var titleColor: UIColor = .black
    
    public var questionFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public var questionText = "How much would you recommend our company to your friends and family?"
    public var questionTitleColor: UIColor = UIColor(r: 11, g: 11, b: 11, a: 1.0)
    
    public var minTitleFont = UIFont.systemFont(ofSize: 11, weight: .regular)
    public var minTitleText = "NOT AT ALL LIKELY"
    public var minTitleColor: UIColor = UIColor(r: 84, g: 84, b: 84, a: 1.0)
    
    public var maxTitleFont = UIFont.systemFont(ofSize: 11, weight: .regular)
    public var maxTitleText = "EXTREME LIKELY"
    public var maxTitleColor: UIColor = UIColor(r: 84, g: 84, b: 84, a: 1.0)
    
    public var descriptionTitleFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
    public var descriptionTitleText = "Describe what motivated your review (optional)"
    public var descriptionTitleColor: UIColor = UIColor(r: 11, g: 11, b: 11, a: 1.0)
    
    public var descriptionTextViewPlaceholderFont = UIFont.systemFont(ofSize: 10, weight: .medium)
    public var descriptionTextViewPlaceholderText = "Please write your complaint in 500 characters."
    public var descriptionTextViewBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198, a: 1.0)
    public var descriptionTextViewPlaceholderColor: UIColor = UIColor(r: 198, g: 198, b: 198, a: 1.0)
    
    public var rateButtonBorderColor: UIColor = UIColor(r: 167, g: 167, b: 167, a: 1.0)
    public var rateButtonFont = UIFont.systemFont(ofSize: 10, weight: .semibold)
    public var rateButtonTitleColor: UIColor = .black
    public var rateButtonBackColor: UIColor = .clear
    public var rateButtonRadius: CGFloat = 10.0
    public var rateButtonBorderWidth: CGFloat = 0.5
    
    // MARK: - Button Score Colors (5 separate colors for different score ranges)
    public var buttonScoreColor1: UIColor = UIColor(r: 254, g: 215, b: 170) // For scores 1-2
    public var buttonScoreColor2: UIColor = UIColor(r: 248, g: 185, b: 113) // For score 3
    public var buttonScoreColor3: UIColor = UIColor(r: 251, g: 146, b: 60)  // For scores 4-6
    public var buttonScoreColor4: UIColor = UIColor(r: 253, g: 124, b: 56)  // For score 7
    public var buttonScoreColor5: UIColor = UIColor(r: 234, g: 88, b: 12)   // For scores 8-10
    
    public var textViewFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    public var textViewColor: UIColor = .black
    public var textViewBackColor: UIColor = .clear
    public var textViewRadius: CGFloat = 10.0
    public var textViewBorderWidth: CGFloat = 1
    public var textViewBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    
    public var submitButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    public var submitButtonTitle = "Submit"
    public var submitButtonTitleColor: UIColor = .white
    public var submitButtonBackColor: UIColor = UIColor(r: 18, g: 127, b: 254)
    public var submitButtonRadius: CGFloat = 10.0
    public var submitButtonBorderWidth: CGFloat = 1
    public var submitButtonBorderColor: UIColor = .clear
    
    public var cancelButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    public var cancelButtonTitle = "Not now"
    public var cancelButtonTitleColor: UIColor = UIColor(r: 167, g: 167, b: 167)
    public var cancelButtonBorderColor: UIColor = UIColor(r: 167, g: 167, b: 167)
    public var cancelButtonBackColor: UIColor = .clear
    public var cancelButtonBorderWidth: CGFloat = 1.0
    public var cancelButtonRadius: CGFloat = 10.0
    
    public var successMessage: String = "Thanks for submiting! We appreciate your feedback."
    public var errorMessage: String = "Failed to submit. Please try again later.\n"
    
    // MARK: - Alert View Configuration
    // Container
    public var alertContainerBackgroundColor: UIColor = .white
    public var alertContainerCornerRadius: CGFloat = 16
    public var alertContainerWidth: CGFloat = 300
    public var alertContainerShadowColor: UIColor = .black
    public var alertContainerShadowOpacity: Float = 0.2
    public var alertContainerShadowOffset: CGSize = CGSize(width: 0, height: 4)
    public var alertContainerShadowRadius: CGFloat = 12
    
    // Overlay
    public var alertOverlayBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    
    // Icon
    public var alertIconSize: CGFloat = 60
    public var alertIconTopMargin: CGFloat = 32
    public var alertSuccessIconName: String = "checkmark-circle-fill"
    public var alertErrorIconName: String = "xmark-circle-fill"
    public var alertSuccessIconColor: UIColor = .systemGreen
    public var alertErrorIconColor: UIColor = .systemRed
    
    // Message
    public var alertMessageFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    public var alertMessageColor: UIColor = .gray
    public var alertMessageTopMargin: CGFloat = 12
    
    // Button
    public var alertButtonFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    public var alertButtonTitle: String = "OK"
    public var alertButtonCornerRadius: CGFloat = 8
    public var alertButtonHeight: CGFloat = 48
    public var alertButtonTopMargin: CGFloat = 24
    public var alertButtonBottomMargin: CGFloat = 24
    public var alertSuccessButtonBackgroundColor: UIColor = .systemGreen
    public var alertErrorButtonBackgroundColor: UIColor = .systemRed
    public var alertButtonTitleColor: UIColor = .white
    
    // Spacing
    public var alertHorizontalPadding: CGFloat = 24
    
    // Animation
    public var alertFadeAnimationDuration: TimeInterval = 0.3
    public var alertScaleAnimationDuration: TimeInterval = 0.5
    public var alertScaleAnimationDamping: CGFloat = 0.7
    public var alertScaleAnimationVelocity: CGFloat = 0.5
    public var alertInitialScale: CGFloat = 0.8
}
