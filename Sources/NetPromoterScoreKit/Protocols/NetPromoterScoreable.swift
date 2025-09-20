//
//  NetPromoterScoretable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol NetPromoterScoreable: AnyObject {
    var netPromoterScoreService: NetPromoterScoreServiceProtocol { get set }
    func getNetPromoterScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse?
}

extension NetPromoterScoreable {
    public func getNetPromoterScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse? {
        return try await netPromoterScoreService.getNetPromoterScore(request: request)
    }
}
