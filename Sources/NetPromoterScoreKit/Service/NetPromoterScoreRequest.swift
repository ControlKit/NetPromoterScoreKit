//
//  NetPromoterScoreRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct NetPromoterScoreRequest: GenericRequest {
    public var appId: String
    public var itemId: String?
    public var route: ControlKitItem = .nps
    public var extraParameter: String? = "submit"
    public var httpMethod: HTTPMethod = .post
    public var deviceUUID: String = CKDeviceUUID
    public var sdkVersion: String = netPromoterScoreKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()

    public var name: String
    public var score: String
    public var comment: String
    
    public var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    
    public var body: [String: String] {
        return ["name": name,
                "score": score,
                "comment": comment]
    }
    
    init(
        appId: String,
        name: String,
        score: String,
        viewRequest: NetPromoterScoreViewRequest
    ) {
        self.appId = appId
        self.name = name
        self.score = score
        self.comment = viewRequest.comment
    }
}

public struct NetPromoterScoreViewRequest {
    public var comment: String
}
