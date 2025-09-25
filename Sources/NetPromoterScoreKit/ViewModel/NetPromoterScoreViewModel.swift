//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol NetPromoterScoreViewModel: NetPromoterScoreable, NPSActionable {
    var netPromoterScoreService: NetPromoterScoreServiceProtocol { get set }
    var actionService: ActionServiceProtocol { get set }
    var serviceConfig: NetPromoterScoreServiceConfig { get set }
    var response: NetPromoterScoreResponse? { get set }
    var score: Int { get set }
}

public final class DefaultNetPromoterScoreViewModel: NetPromoterScoreViewModel {
    public var netPromoterScoreService: NetPromoterScoreServiceProtocol
    public var serviceConfig: NetPromoterScoreServiceConfig
    public var actionService: ActionServiceProtocol
    public var response: NetPromoterScoreResponse?
    public var score: Int = 0
    public init(serviceConfig: NetPromoterScoreServiceConfig,
                netPromoterScoreService: NetPromoterScoreServiceProtocol = NetPromoterScoreService(),
                actionService: ActionServiceProtocol = ActionService()
    ) {
        self.netPromoterScoreService = netPromoterScoreService
        self.actionService = actionService
        self.serviceConfig = serviceConfig
    }
}
