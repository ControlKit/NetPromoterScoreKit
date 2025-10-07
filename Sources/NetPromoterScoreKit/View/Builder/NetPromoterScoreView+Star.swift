//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit
import ControlKitBase

public class NetPromoterScoreView_Star: UIView, NetPromoterScoreViewProtocol {
    var config: NetPromoterScoreViewConfig
    var viewModel: NetPromoterScoreViewModel
    public var delegate: NetPromoterScoreDelegate?
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
    lazy var hillView: TopHillView = {
        let hillView = TopHillView()
        hillView.fillColor = config.bottomViewBackColor
        hillView.backgroundColor = .clear
        return hillView
    }()
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = config.logoImage != nil ? config.logoImage : ImageHelper.image("sepanta-logo")
        return imageView
    }()
    lazy var smallGaugeIcon: UIImageView = {
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
        label.textAlignment = .center
        label.numberOfLines = 0
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
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.submitButtonBackColor
        button.titleLabel?.textColor = config.submitButtonTitleColor
        button.setTitle(config.submitButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = config.submitButtonFont
        button.setTitleColor(config.submitButtonTitleColor, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.cancelButtonBackColor
        button.titleLabel?.textColor = config.cancelButtonTitleColor
        button.setTitle(config.cancelButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
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
        containerView.addSubview(hillView)
        containerView.addSubview(smallGaugeIcon)
        bottomView.addSubview(questionLabel)
        bottomView.addSubview(rateView)
        addStarToRateView()
        bottomView.addSubview(submitButton)
        bottomView.addSubview(cancelButton)
        commonInit()
        setContainerViewConstraint()
        setLogoImageViewConstraint()
        setHillViewConstraint()
        setSmaillGaugeIconConstraint()
        setBottomViewConstraint()
        setQuestionLabelConstraint()
        setRateViewConstraint()
        setSubmitButtonConstraint()
        setCancelButtonConstraint()
        setupCorners()
    }
    func addStarToRateView() {
        for i in 1...5 {
            rateView.addArrangedSubview(getStarButton(tag: i))
        }
    }
    func getStarButton(tag: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(starPressed), for: .touchUpInside)
        button.setImage(ImageHelper.image("star-gray"), for: .normal)
        button.tag = tag
        button.setTitle(String(), for: .normal)
        return button
    }
    @objc
    func starPressed(_ sender: UIButton) {
        viewModel.score = sender.tag
        rateView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                if button.tag > sender.tag {
                    button.setImage(ImageHelper.image("star-gray"), for: .normal)
                } else {
                    button.setImage(ImageHelper.image("star-fill"), for: .normal)
                }
            }
        }
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
    public func setHillViewConstraint() {
        hillView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: hillView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: hillView,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 101).isActive = true
        NSLayoutConstraint(
            item: hillView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
        NSLayoutConstraint(
            item: hillView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 70).isActive = true
    }
    public func setSmaillGaugeIconConstraint() {
        smallGaugeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: smallGaugeIcon,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: smallGaugeIcon,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 101).isActive = true
        NSLayoutConstraint(
            item: smallGaugeIcon,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
        NSLayoutConstraint(
            item: smallGaugeIcon,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self else { return }
            self.submitButton.roundCorners(
                corners: [.topLeft, .topRight],
                radius: self.config.submitButtonRadius,
                borderColor: self.config.submitButtonBorderColor,
                borderWidth: self.config.submitButtonBorderWidth
            )
            self.cancelButton.roundCorners(
                corners:  [.layerMinXMaxYCorner, .layerMaxXMaxYCorner],
                radius: self.config.cancelButtonRadius,
                borderColor: self.config.cancelButtonBorderColor,
                borderWidth: self.config.cancelButtonBorderWidth
            )
        }
    }
    @objc
    func addScore(_ sender: UIButton) {
        viewModel.score = sender.tag
    }
    
    @objc
    func submitButtonTapped() {
        delegate?.submit(description: String())
    }
    @objc
    func cancelButtonTapped() {
        delegate?.cancel()
    }
}

public class NetPromoterScoreViewConfig_Star: NetPromoterScoreViewConfig {
    public override init() {
        super.init()
        style = .star
        containerViewBackColor = UIColor(r: 115, g: 3, b: 0, a: 1.0)
        questionFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        questionText = "How do you enjoy this app? Tap a star to rate it on the App Store."
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
