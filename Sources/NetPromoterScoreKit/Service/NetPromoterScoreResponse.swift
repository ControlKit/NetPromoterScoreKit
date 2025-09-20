//
//  NetPromoterScoreResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias NetPromoterScoreLocalString = [NetPromoterScoreLocalizedText]

public struct NetPromoterScoreResponse: Codable {
    public var data: [NetPromoterScoreModel]?
}
public struct NetPromoterScoreModel: Codable {
    public let id: String
    public let title: NetPromoterScoreLocalString?
    public let termsTitle: NetPromoterScoreLocalString?
    public let termsDescription: NetPromoterScoreLocalString?
    public let acceptButtonTitle: NetPromoterScoreLocalString?
    public let declineButtonTitle: NetPromoterScoreLocalString?
    public let version: String?
    public let created_at: String?
}
public struct NetPromoterScoreLocalizedText: Codable {
    public let language: String?
    public let content: String?
}
