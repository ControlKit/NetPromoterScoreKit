//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public class NetPromoterScoreView_Star: UIView, NetPromoterScoreViewProtocol {
    var config: NetPromoterScoreViewConfig
    var viewModel: NetPromoterScoreViewModel
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    lazy var containerView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.containerViewBackColor
        contentView.setCurvedView(cornerRadius: config.containerViewRadius)
        return contentView
    }()
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = config.logoImage != nil ? config.logoImage : ImageHelper.image("logo")
        return imageView
    }()
    lazy var smallGageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = config.gaugeImage != nil ? config.gaugeImage : ImageHelper.image("score-outline")
        return imageView
    }()
    lazy var bottomView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.bottomViewBackColor
        return contentView
    }()
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = config.questionFont
        label.text = config.questionText
        label.textColor = config.questionTitleColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var rateView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    var starButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.setImage(ImageHelper.image("star"), for: .normal)
        button.setTitle(String(), for: .normal)
        return button
    }()
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.submitButtonBackColor
        button.titleLabel?.textColor = config.submitButtonTitleColor
        button.setTitle(config.submitButtonTitle, for: .normal)
        
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.setCurvedView(
            cornerRadius: .zero,
            borderWidth: config.submitButtonBorderWidth,
            borderColor: config.submitButtonBorderColor
        )
        button.titleLabel?.font = config.submitButtonFont
        button.setTitleColor(config.submitButtonTitleColor, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.cancelButtonBackColor
        button.titleLabel?.textColor = config.cancelButtonTitleColor
        button.setTitle(config.cancelButtonTitle, for: .normal)
        button.setCurvedView(
            cornerRadius: .zero,
            borderWidth: config.submitButtonBorderWidth,
            borderColor: config.submitButtonBorderColor
        )
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.cancelButtonFont
        button.setTitleColor(config.cancelButtonTitleColor, for: .normal)
        return button
    }()
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public required init(viewModel: NetPromoterScoreViewModel,
                         config: NetPromoterScoreViewConfig) {
        self.config = config
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func commonInit() {
        contentView.fixInView(self)
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(containerView)
        containerView.addSubview(logoImageView)
        containerView.addSubview(bottomView)
        bottomView.addSubview(questionLabel)
        bottomView.addSubview(rateView)
        bottomView.addSubview(submitButton)
        bottomView.addSubview(cancelButton)
        commonInit()
        setContainerViewConstraint()
        setLogoImageViewConstraint()
        setBottomViewConstraint()
        setQuestionLabelConstraint()
        setRateViewConstraint()
        setSubmitButtonConstraint()
        setCancelButtonConstraint()
        setupCorners()
    }
    public func setContainerViewConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: containerView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: 0).isActive = true
        containerView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 0).isActive = true
        containerView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 595).isActive = true
    }
    public func setLogoImageViewConstraint() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: logoImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: logoImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 33).isActive = true
        NSLayoutConstraint(
            item: logoImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 56).isActive = true
        NSLayoutConstraint(
            item: logoImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 56).isActive = true
    }
    public func setBottomViewConstraint() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: bottomView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .bottom,
            multiplier: 1,
            constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: bottomView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 482).isActive = true
    }
    public func setQuestionLabelConstraint() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: questionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: bottomView,
            attribute: .top,
            multiplier: 1,
            constant: 70).isActive = true
        questionLabel.leadingAnchor.constraint(
            equalTo: bottomView.leadingAnchor,
            constant: 50).isActive = true
        questionLabel.trailingAnchor.constraint(
            equalTo: bottomView.trailingAnchor,
            constant: -50).isActive = true
        NSLayoutConstraint(
            item: questionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    public func setRateViewConstraint() {
        rateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: rateView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: bottomView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: rateView,
            attribute: .top,
            relatedBy: .equal,
            toItem: questionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 45).isActive = true
        NSLayoutConstraint(
            item: rateView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 35).isActive = true
    }
    public func setSubmitButtonConstraint() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: submitButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: bottomView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: submitButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: rateView,
            attribute: .bottom,
            multiplier: 1,
            constant: 66).isActive = true
        NSLayoutConstraint(
            item: submitButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 42).isActive = true
        NSLayoutConstraint(
            item: submitButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 253).isActive = true
    }
    public func setCancelButtonConstraint() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: submitButton,
            attribute: .bottom,
            multiplier: 1,
            constant: 8).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 42).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 253).isActive = true
    }
    public func setupCorners() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.submitButton.roundCorners(corners: [.topLeft, .topRight], radius: self.config.submitButtonRadius)
            self.cancelButton.roundCorners(corners: [.bottomLeft, .bottomRight], radius: self.config.submitButtonRadius)
        }
    }
}

public class NetPromoterScoreViewConfig_Star: NetPromoterScoreViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .star
        questionFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        questionText = "Net Promoter Score"
        questionTitleColor = .black
        
        submitButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        submitButtonTitle = "Submit"
        submitButtonTitleColor = .black
        submitButtonBackColor = UIColor(r: 172, g: 172, b: 172)
        submitButtonRadius = 20.0
        submitButtonBorderWidth = 1
        submitButtonBorderColor = .clear
        
        cancelButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        cancelButtonTitle = "Not now"
        cancelButtonTitleColor = UIColor(r: 167, g: 167, b: 167)
        cancelButtonBorderColor = UIColor(r: 172, g: 172, b: 172)
        cancelButtonBackColor = .clear
        cancelButtonBorderWidth = 1.0
        cancelButtonRadius = 20.0
    }
}

class ImageHelper {
    static var resolvedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: self)
#endif
    }
    
    static func image(_ name: String) -> UIImage? {
        return UIImage(named: name,
                       in: resolvedBundle,
                       compatibleWith: nil)
    }
}
