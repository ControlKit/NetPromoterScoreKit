//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//
import Foundation
import UIKit

public class NetPromoterScoreView_Digit: UIView, NetPromoterScoreViewProtocol {
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
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = config.headerFont
        label.text = config.headerText
        label.textColor = config.headerColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = config.titleFont
        label.text = config.titleText
        label.textColor = config.titleColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    lazy var gaugeView: ABGaugeView = {
        let gaugeView = ABGaugeView()
        gaugeView.backgroundColor = config.gaugeViewBackColor
        gaugeView.applyShadow = false
        gaugeView.isRoundCap = false
        return gaugeView
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
    
    lazy var minLabel: UILabel = {
        let label = UILabel()
        label.font = config.minTitleFont
        label.text = config.minTitleText
        label.textColor = config.minTitleColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    lazy var maxLabel: UILabel = {
        let label = UILabel()
        label.font = config.maxTitleFont
        label.text = config.maxTitleText
        label.textColor = config.maxTitleColor
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    lazy var rateView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }()
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = config.descriptionTitleFont
        label.text = config.descriptionTitleText
        label.textColor = config.descriptionTitleColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = config.descriptionTitleFont
        textView.textColor = config.textViewColor
        textView.backgroundColor = config.textViewBackColor
        textView.textAlignment = .left
        textView.setCurvedView(
            cornerRadius: config.textViewRadius,
            borderWidth: config.textViewBorderWidth,
            borderColor: config.textViewBorderColor
        )
        return textView
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.submitButtonBackColor
        button.titleLabel?.textColor = config.submitButtonTitleColor
        button.setTitle(config.submitButtonTitle, for: .normal)
        button.setCurvedView(
            cornerRadius: config.submitButtonRadius,
            borderWidth: config.submitButtonBorderWidth,
            borderColor: config.submitButtonBorderColor
        )
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
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
            cornerRadius: config.cancelButtonRadius,
            borderWidth: config.cancelButtonBorderWidth,
            borderColor: config.cancelButtonBorderColor
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
        containerView.addSubview(headerLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(gaugeView)
        containerView.addSubview(questionLabel)
        containerView.addSubview(maxLabel)
        containerView.addSubview(minLabel)
        containerView.addSubview(rateView)
        addDigitsToRateView()
        containerView.addSubview(descriptionTitleLabel)
        containerView.addSubview(descriptionTextView)
        containerView.addSubview(submitButton)
        containerView.addSubview(cancelButton)
        commonInit()
        setContainerViewConstraint()
        setHeaderLabelConstraint()
        setTitleLabelConstraint()
        setGaugeViewConstraint()
        setQuestionLabelConstraint()
        setMinLabelConstraint()
        setMaxLabelConstraint()
        setRateViewConstraint()
        setDescriptionLabelConstraint()
        setTextViewConstraint()
        setSubmitButtonConstraint()
        setCancelButtonConstraint()
    }
    func addDigitsToRateView() {
        for i in 1...10 {
            rateView.addArrangedSubview(getDigitButton(tag: i))
        }
    }
    func getDigitButton(tag: Int) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 28.17, height: 32)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(digitPressed), for: .touchUpInside)
        button.setTitle(String(tag), for: .normal)
        button.setTitleColor(UIColor(r: 11, g: 11, b: 11), for: .normal)
        button.titleLabel?.font = config.digitFont
        button.tag = tag
        button.setCurvedView(
            cornerRadius: 10,
            borderWidth: 0.5,
            borderColor: UIColor(r: 167, g: 167, b: 167)
        )
        return button
    }
    func getButtonBackColor(tag: Int) -> UIColor {
        switch tag {
        case 1...2:
            return UIColor(r: 254, g: 215, b: 170)
        case 3:
            return UIColor(r: 248, g: 185, b: 113)
        case 4...6:
            return UIColor(r: 251, g: 146, b: 60)
        case 7:
            return UIColor(r: 253, g: 124, b: 56)
        case 8...10:
            return UIColor(r: 234, g: 88, b: 12)
        default:
            return .clear
        }
    }
    @objc
    func digitPressed(_ sender: UIButton) {
        rateView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                gaugeView.needleValue = CGFloat(sender.tag) * 10
                if button.tag > sender.tag {
                    button.backgroundColor = .clear
                } else {
                    button.backgroundColor = getButtonBackColor(tag: button.tag)
                }
            }
        }
    }
    public func setContainerViewConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: containerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0).isActive = true
        containerView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        containerView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 700).isActive = true
    }
    public func setHeaderLabelConstraint() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: headerLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 30).isActive = true
        headerLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 30).isActive = true
        headerLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -30).isActive = true
        NSLayoutConstraint(
            item: headerLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }  
    public func setTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -30).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    public func setGaugeViewConstraint() {
        gaugeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: gaugeView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: gaugeView,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 30).isActive = true
        NSLayoutConstraint(
            item: gaugeView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 90).isActive = true
        NSLayoutConstraint(
            item: gaugeView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 110).isActive = true
    }
    public func setQuestionLabelConstraint() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: questionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: gaugeView,
            attribute: .bottom,
            multiplier: 1,
            constant: -20).isActive = true
        questionLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 30).isActive = true
        questionLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -30).isActive = true
        NSLayoutConstraint(
            item: questionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    public func setMinLabelConstraint() {
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: minLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: questionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 23).isActive = true
        minLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 30).isActive = true
        NSLayoutConstraint(
            item: minLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 15).isActive = true
    }
    public func setMaxLabelConstraint() {
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: maxLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: questionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 23).isActive = true
        maxLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -30).isActive = true
        NSLayoutConstraint(
            item: maxLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 15).isActive = true
    }
    public func setRateViewConstraint() {
        rateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: rateView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: rateView,
            attribute: .top,
            relatedBy: .equal,
            toItem: minLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 8).isActive = true
        NSLayoutConstraint(
            item: rateView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 32).isActive = true
        NSLayoutConstraint(
            item: rateView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 292).isActive = true
    }
    public func setDescriptionLabelConstraint() {
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionTitleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: rateView,
            attribute: .bottom,
            multiplier: 1,
            constant: 30).isActive = true
        descriptionTitleLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 30).isActive = true
        descriptionTitleLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -30).isActive = true
        NSLayoutConstraint(
            item: descriptionTitleLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 15).isActive = true
    }
    public func setTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionTextView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
    descriptionTextView.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: 30).isActive = true
    descriptionTextView.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -30).isActive = true
        NSLayoutConstraint(
            item: descriptionTextView,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionTitleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 8).isActive = true
        NSLayoutConstraint(
            item: descriptionTextView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100).isActive = true
    }
    public func setSubmitButtonConstraint() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: submitButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: submitButton,
            attribute: .top,
            relatedBy: .greaterThanOrEqual,
            toItem: descriptionTextView,
            attribute: .bottom,
            multiplier: 1,
            constant: 40).isActive = true
        NSLayoutConstraint(
            item: submitButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 36).isActive = true
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
            constant: 15).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .bottom,
            multiplier: 1,
            constant: -50).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 36).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 253).isActive = true
    }
}

public class NetPromoterScoreViewConfig_Digit: NetPromoterScoreViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .digit
    }
}
