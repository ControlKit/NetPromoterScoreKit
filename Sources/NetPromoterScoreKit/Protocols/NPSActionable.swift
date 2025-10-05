//
//  NPSActionable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
public protocol NPSActionable {
    func setAction(_ action: NPSAction)
}
public extension NPSActionable where Self: NetPromoterScoreViewModel {
    func setAction(_ action: NPSAction) {
        Task {
            let request = ActionRequest(appId: serviceConfig.appId, name: serviceConfig.name, action: action)
            let _ = try await actionService.action(request: request)
        }
    }
}
