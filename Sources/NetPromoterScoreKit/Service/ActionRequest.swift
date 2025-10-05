//
//  ActionRequest.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionRequest {
    public var appId: String
    public var name: String
    public var action: NPSAction
    public var route: String = "https://tauri.ir/api/nps/"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = netPromoterScoreKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    
    var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    
    var params: [String: String] {
        return [
            "name": name
        ]
    }
}
public enum NPSAction: String {
    case view
    case submit
    case cancel
}
  
