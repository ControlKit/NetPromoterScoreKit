// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class NetPromoterScoreKit {
    public init() {
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: NetPromoterScoreServiceConfig) async {
        Task {
            let viewModel = DefaultNetPromoterScoreViewModel(serviceConfig: config)
            let netPromoterScoreVC = NetPromoterScoreViewController(
                viewModel: viewModel,
                config: config
            )
            if config.viewConfig.style == .star {
                netPromoterScoreVC.modalPresentationStyle = .overCurrentContext
            } else {
                netPromoterScoreVC.modalPresentationStyle = modalPresentationStyle
            }
            DispatchQueue.main.async {
                root.present(netPromoterScoreVC, animated: true)
            }
        }
    }
}
