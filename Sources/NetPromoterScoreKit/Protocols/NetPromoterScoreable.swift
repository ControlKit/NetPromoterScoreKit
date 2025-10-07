//
//  NetPromoterScoretable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation
import ControlKitBase
public protocol NetPromoterScoreable: AnyObject {
    var netPromoterScoreService: GenericServiceProtocol { get set }
    func setScore(viewRequest: NetPromoterScoreViewRequest) async throws -> Result<NetPromoterScoreResponse>?
}

extension NetPromoterScoreable where Self: NetPromoterScoreViewModel {
    public func setScore(viewRequest: NetPromoterScoreViewRequest) async throws -> Result<NetPromoterScoreResponse>? {
        let request = NetPromoterScoreRequest(
            appId: serviceConfig.appId,
            name: serviceConfig.name,
            score: String(score),
            viewRequest: viewRequest
        )
        return try await netPromoterScoreService.execute(request: request)
    }
}
