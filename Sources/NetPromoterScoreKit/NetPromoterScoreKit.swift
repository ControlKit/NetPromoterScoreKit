// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine
import ControlKitBase

public let netPromoterScoreKit_Version: String = "1.0.0"
public class NetPromoterScoreKit: NPSFetchable {
    public var npsService: GenericServiceProtocol
    public init(npsService: GenericServiceProtocol = GenericService()) {
        self.npsService = npsService
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext,
                          config: NetPromoterScoreServiceConfig) async {
        Task {
            let request = NPSRequest(appId: config.appId,
                                     name: config.name)
            guard let response = try await self.getNPS(request: request)?.value else {
                return
            }
            guard response.data.id > UserDefaults.standard.string(forKey: getName(config.name)) ?? String() else {
                return
            }
            let viewModel = DefaultNetPromoterScoreViewModel(serviceConfig: config, npsModel: response.data)
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
