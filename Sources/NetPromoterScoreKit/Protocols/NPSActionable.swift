//
//  NPSActionable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
public protocol NPSActionable {
    func setViewAction()
}
public extension NPSActionable where Self: NetPromoterScoreViewModel {
    func setViewAction() {
        Task {
            let request = ActionRequest(appId: serviceConfig.appId, name: serviceConfig.name)
            let _ = try await actionService.action(request: request)
        }
    }
}
