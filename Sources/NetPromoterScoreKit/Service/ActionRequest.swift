//
//  ActionRequest.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
import ControlKitBase
public struct ActionRequest: GenericRequest {
    public var itemId: String?
    public var extraParameter: String?
    public var httpMethod: ControlKitBase.HTTPMethod = .post
    public var appId: String
    public var name: String
    public var action: ControlKitAction
    public var route: ControlKitItem = .nps
    public var deviceUUID: String = CKDeviceUUID
    public var sdkVersion: String = netPromoterScoreKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    
    public var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    
    public var body: [String: String] {
        return [
            "name": name
        ]
    }
}
  
