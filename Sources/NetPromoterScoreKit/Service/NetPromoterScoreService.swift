//
//  NetPromoterScoreServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public protocol NetPromoterScoreServiceProtocol {
    func getNetPromoterScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse?
}

public class NetPromoterScoreService: NetPromoterScoreServiceProtocol {
    public init() {}
    public func getNetPromoterScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return NetPromoterScoreResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                return nil
            }
            if let NetPromoterScoreResponse = try? JSONDecoder().decode(NetPromoterScoreResponse.self, from: data) {
                print(NetPromoterScoreResponse)
                return NetPromoterScoreResponse
            } else {
                print("Invalid Response")
                return nil
            }
        } catch {
            print("Failed to Send POST Request \(error)")
            return nil
        }
    }
}
