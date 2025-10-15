//
//  NetPromoterScoreServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct NetPromoterScoreServiceConfig {
    public init(name: String,
                appId: String,
                viewConfig: NetPromoterScoreViewConfig) {
        self.viewConfig = viewConfig
        self.name = name
        self.appId = appId
    }
    public var name: String
    public var appId: String
    public var version: String = Bundle.main.releaseVersionNumber ?? String()
    public var sdkVersion: String = netPromoterScoreKit_Version
    public var viewConfig: NetPromoterScoreViewConfig
}
