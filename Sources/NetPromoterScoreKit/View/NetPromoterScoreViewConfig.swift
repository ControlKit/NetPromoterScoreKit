//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class NetPromoterScoreViewConfig {
    public init(lang: String) {
        self.lang = lang
    }
    
    public let lang: String
    public var style: NetPromoterScoreViewStyle = .star
    public var contentViewBackColor: UIColor = UIColor(r: 167, g: 167, b: 167, a: 0.8)
    public var containerViewBackColor: UIColor = .white
    public var containerViewRadius: CGFloat = 20.0
    public var gaugeViewBackColor: UIColor = UIColor(r: 115, g: 3, b: 0, a: 1.0)
    public var bottomViewBackColor: UIColor = UIColor(r: 245, g: 254, b: 255, a: 1.0)
    public var rateViewBackColor: UIColor = .clear
    public var logoImage: UIImage?
    public var gaugeImage: UIImage?
    public var digitFont = UIFont.systemFont(ofSize: 10, weight: .semibold)
    
    public var headerFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    public var headerText = "Rate the service"
    public var headerColor: UIColor = .black
    
    public var titleFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
    
    public var descriptionTitleFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public var descriptionTitleText = "Describe what motivated your review (optional)"
    public var descriptionTitleColor: UIColor = UIColor(r: 11, g: 11, b: 11, a: 1.0)
    
    public var descriptionTextViewBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198, a: 1.0)
    public var descriptionTextViewPlaceholderColor: UIColor = UIColor(r: 198, g: 198, b: 198, a: 1.0)
    
    public var rateButtonBorderColor: UIColor = UIColor(r: 167, g: 167, b: 167, a: 1.0)
    public var rateButtonFont = UIFont.systemFont(ofSize: 10, weight: .semibold)
    public var rateButtonTitleColor: UIColor = .black
    public var rateButtonBackColor: UIColor = .clear
    public var rateButtonRadius: CGFloat = 10.0
    public var rateButtonBorderWidth: CGFloat = 0.5
    
    public var textViewFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    public var textViewColor: UIColor = .black
    public var textViewBackColor: UIColor = .clear
    public var textViewRadius: CGFloat = 10.0
    public var textViewBorderWidth: CGFloat = 1
    public var textViewBorderColor: UIColor = .clear
    
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
}
