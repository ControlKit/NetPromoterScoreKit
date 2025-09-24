//
//  NetPromoterScoreRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct NetPromoterScoreRequest {
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var voteId: String
    public var route: String = "https://tauri.ir/api/nps/submit"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = netPromoterScoreKit_Version

    public var name: String
    public var score: String
    public var comment: String
    
    var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    
    var params: [String: String] {
        return ["name": name,
                "score": score,
                "comment": comment]
    }
}
