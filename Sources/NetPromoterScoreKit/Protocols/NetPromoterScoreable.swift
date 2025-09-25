//
//  NetPromoterScoretable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol NetPromoterScoreable: AnyObject {
    var netPromoterScoreService: NetPromoterScoreServiceProtocol { get set }
    func setScore(viewRequest: NetPromoterScoreViewRequest) async throws -> NetPromoterScoreResponse?
}

extension NetPromoterScoreable where Self: NetPromoterScoreViewModel {
    public func setScore(viewRequest: NetPromoterScoreViewRequest) async throws -> NetPromoterScoreResponse? {
        let request = NetPromoterScoreRequest(
            appId: serviceConfig.appId,
            name: serviceConfig.name,
            score: String(score),
            viewRequest: viewRequest
        )
        return try await netPromoterScoreService.setScore(request: request)
    }
}
