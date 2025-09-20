//
//  NetPromoterScoreViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum NetPromoterScoreViewStyle {
    case star
    case digit
    public static func make(viewModel: NetPromoterScoreViewModel,
                            config: NetPromoterScoreViewConfig) -> NetPromoterScoreViewProtocol {
        switch config.style {
        case .star:
            return NetPromoterScoreView_Star(viewModel: viewModel,
                                             config: config)
        case .digit:
            return NetPromoterScoreView_Digit(viewModel: viewModel,
                                              config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: NetPromoterScoreViewStyle, lang: String) -> NetPromoterScoreViewConfig {
        switch style {
        case .star:
            NetPromoterScoreViewConfig_Star(lang: lang)
        case .digit:
            NetPromoterScoreViewConfig_Digit(lang: lang)
        }
    }
}
