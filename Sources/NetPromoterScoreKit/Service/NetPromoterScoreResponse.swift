//
//  NetPromoterScoreResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct NetPromoterScoreResponse: Codable {
    public var data: [NetPromoterScoreModel]?
}
public struct NetPromoterScoreModel: Codable {
    public let id: String
    public let title: LocalString?
    public let termsTitle: LocalString?
    public let termsDescription: LocalString?
    public let acceptButtonTitle: LocalString?
    public let declineButtonTitle: LocalString?
    public let version: String?
    public let created_at: String?
}
