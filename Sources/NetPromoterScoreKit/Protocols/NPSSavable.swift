//
//  NPSSavable.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 10/14/25.
//
import Foundation
public protocol NPSSavable {
    func saveLatestId(id: String, name: String)
}
public extension NPSSavable {
    func saveLatestId(id: String, name: String) {
        UserDefaults.standard.set(id, forKey: name)
    }
}
func getName(_ name: String) -> String {
    return "CK_NPS_Name_\(name)"
}
