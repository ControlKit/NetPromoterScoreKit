//
//  NPSFetchable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 10/14/25.
//
import ControlKitBase
public protocol NPSFetchable: AnyObject {
    var npsService: GenericServiceProtocol { get }
    func getNPS(request: NPSRequest) async throws -> Result<NPSResponse>?
}
public extension NPSFetchable {
    func getNPS(request: NPSRequest) async throws -> Result<NPSResponse>? {
        return try await npsService.execute(request: request)
    }
}
