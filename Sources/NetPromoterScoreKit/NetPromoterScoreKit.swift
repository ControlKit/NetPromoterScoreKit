// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public let netPromoterScoreKit_Version: String = "1.0.0"
public class NetPromoterScoreKit {
    public init() {
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext,
                          config: NetPromoterScoreServiceConfig) async {
        Task {
            let viewModel = DefaultNetPromoterScoreViewModel(serviceConfig: config)
            let netPromoterScoreVC = NetPromoterScoreViewController(
                viewModel: viewModel,
                config: config
            )
            netPromoterScoreVC.modalPresentationStyle = modalPresentationStyle
            DispatchQueue.main.async {
                root.present(netPromoterScoreVC, animated: true)
            }
        }
    }
}
