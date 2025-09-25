//
//  NetPromoterScoreViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit
public protocol NetPromoterScoreDelegate: AnyObject {
    func submit(description: String)
    func cancel()
}

public protocol NetPromoterScoreViewProtocol: UIView {
    var delegate: NetPromoterScoreDelegate? { get set }
}

public extension NetPromoterScoreViewProtocol {
}
