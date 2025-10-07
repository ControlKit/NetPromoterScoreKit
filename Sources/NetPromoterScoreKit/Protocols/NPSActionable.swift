//
//  NPSActionable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
import ControlKitBase
public protocol NPSActionable {
    func setAction(_ action: ControlKitAction)
}
public extension NPSActionable where Self: NetPromoterScoreViewModel {
    func setAction(_ action: ControlKitAction) {
        Task {
            var request = ActionRequest(
                appId: serviceConfig.appId,
                name: serviceConfig.name,
                action: action
            )
            request.extraParameter = "\(request.action.rawValue)"
            let result: Result<ActionResponse> = try await actionService.execute(request: request)
            
        }
    }
}
