//
//  NPSSavable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 10/14/25.
//
import Foundation
public protocol NPSSavable {
    func saveLatestId(id: String)
}
public extension NPSSavable {
    func saveLatestId(id: String) {
        UserDefaults.standard.set(id, forKey: latestNPSKey)
    }
}
