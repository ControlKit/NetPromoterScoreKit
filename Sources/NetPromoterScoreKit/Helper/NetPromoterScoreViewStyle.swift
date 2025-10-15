//
//  NetPromoterScoreViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum NetPromoterScoreViewStyle: String {
    case star = "STARS"
    case digit = "DIGITS"
    public static func make(viewModel: NetPromoterScoreViewModel,
                            config: NetPromoterScoreViewConfig,
                            type: NetPromoterScoreViewStyle) -> NetPromoterScoreViewProtocol {
        switch type {
        case .star:
            return NetPromoterScoreView_Star(viewModel: viewModel,
                                             config: config)
        case .digit:
            return NetPromoterScoreView_Digit(viewModel: viewModel,
                                              config: config)
        }
    }
}
