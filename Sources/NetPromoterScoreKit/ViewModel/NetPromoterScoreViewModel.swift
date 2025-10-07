//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit
import ControlKitBase

public protocol NetPromoterScoreViewModel: NetPromoterScoreable, NPSActionable {
    var netPromoterScoreService: GenericServiceProtocol { get set }
    var actionService: GenericServiceProtocol { get set }
    var serviceConfig: NetPromoterScoreServiceConfig { get set }
    var response: NetPromoterScoreResponse? { get set }
    var score: Int { get set }
}

public final class DefaultNetPromoterScoreViewModel: NetPromoterScoreViewModel {
    public var netPromoterScoreService: GenericServiceProtocol
    public var serviceConfig: NetPromoterScoreServiceConfig
    public var actionService: GenericServiceProtocol
    public var response: NetPromoterScoreResponse?
    public var score: Int = 0
    public init(serviceConfig: NetPromoterScoreServiceConfig,
                netPromoterScoreService: GenericServiceProtocol = GenericService(),
                actionService: GenericServiceProtocol = GenericService()
    ) {
        self.netPromoterScoreService = netPromoterScoreService
        self.actionService = actionService
        self.serviceConfig = serviceConfig
    }
}
