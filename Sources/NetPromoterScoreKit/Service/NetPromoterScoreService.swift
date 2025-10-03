//
//  NetPromoterScoreServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public protocol NetPromoterScoreServiceProtocol {
    func setScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse?
}

public class NetPromoterScoreService: NetPromoterScoreServiceProtocol {
    public init() {}
    public func setScore(request: NetPromoterScoreRequest) async throws -> NetPromoterScoreResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return NetPromoterScoreResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.headers
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            req.httpMethod = "POST"
            req.httpBody = try JSONEncoder().encode(request.params)
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("NPS Response --> 204")
                return nil
            }
            if let response = try? JSONDecoder().decode(NetPromoterScoreResponse.self, from: data) {
                print("NPS Response --> 200")
                print(response)
                return response
            } else {
                print("NPS Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Send POST NPS Request \(error)")
            return nil
        }
    }
}
