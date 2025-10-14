//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit
import ControlKitBase

public protocol NetPromoterScoreViewModel: NetPromoterScoreable,
                                           NPSActionable,
                                           NPSSavable {
    var netPromoterScoreService: GenericServiceProtocol { get set }
    var actionService: GenericServiceProtocol { get set }
    var serviceConfig: NetPromoterScoreServiceConfig { get set }
    var response: NetPromoterScoreResponse? { get set }
    var npsModel: NPSModel { get set }
    func saveLastId()
}

public final class DefaultNetPromoterScoreViewModel: NetPromoterScoreViewModel {
    public var netPromoterScoreService: GenericServiceProtocol
    public var serviceConfig: NetPromoterScoreServiceConfig
    public var actionService: GenericServiceProtocol
    public var response: NetPromoterScoreResponse?
    public var score: Int = 0
    public var npsModel: NPSModel
    public init(serviceConfig: NetPromoterScoreServiceConfig,
                netPromoterScoreService: GenericServiceProtocol = GenericService(),
                actionService: GenericServiceProtocol = GenericService(),
                npsModel: NPSModel
    ) {
        self.netPromoterScoreService = netPromoterScoreService
        self.actionService = actionService
        self.serviceConfig = serviceConfig
        self.npsModel = npsModel
    }
    
    public func saveLastId() {
        saveLatestResponseId(id: npsModel.id)
    }
}
