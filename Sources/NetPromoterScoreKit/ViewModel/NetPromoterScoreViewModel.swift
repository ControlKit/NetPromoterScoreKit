//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol NetPromoterScoreViewModel {
    var netPromoterScoreService: NetPromoterScoreServiceProtocol { get set }
    var serviceConfig: NetPromoterScoreServiceConfig { get set }
    var response: NetPromoterScoreResponse? { get set }
    var request: NetPromoterScoreRequest { get }
}

public final class DefaultNetPromoterScoreViewModel: NetPromoterScoreViewModel, NetPromoterScoreable {
    public var netPromoterScoreService: NetPromoterScoreServiceProtocol
    public var serviceConfig: NetPromoterScoreServiceConfig
    public var response: NetPromoterScoreResponse?
    
    public init(serviceConfig: NetPromoterScoreServiceConfig,
                netPromoterScoreService: NetPromoterScoreServiceProtocol = NetPromoterScoreService()
    ) {
        self.netPromoterScoreService = netPromoterScoreService
        self.serviceConfig = serviceConfig
    }
    
    public var request: NetPromoterScoreRequest {
        return NetPromoterScoreRequest(appId: serviceConfig.appId,
                                       route: serviceConfig.route,
                                       sdkVersion: serviceConfig.sdkVersion)
    }
}
