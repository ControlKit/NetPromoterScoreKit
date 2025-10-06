//
//  NetPromoterScoreServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct NetPromoterScoreServiceConfig {
    public init(style: NetPromoterScoreViewStyle = .star,
                name: String,
                appId: String,
                version: String) {
        self.viewConfig = NetPromoterScoreViewStyle.getViewConfigWithStyle(style: style)
        self.name = name
        self.appId = appId
        self.version = version
    }
    public var name: String
    public var appId: String
    public var version: String = Bundle.main.releaseVersionNumber ?? String()
    public var sdkVersion: String = "1.0.0"
    public var viewConfig: NetPromoterScoreViewConfig
}
