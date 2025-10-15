//
//  NetPromoterScoreResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct NPSResponse: Codable {
    public var data: NPSModel
}
public struct NPSModel: Codable {
    public let id: String
    public let name: String
    public let title: LocalString
    public let description: LocalString
    public let recommend: LocalString
    public let icon: String
    public let min_title: LocalString
    public let max_title: LocalString
    public let input_label: LocalString
    public let submit_button_title: LocalString
    public let cancel_button_title: LocalString
    public let type: String
    public let created_at: String?
}
