//
//  VotePresenter.swift
//  VoteKit
//
//  Created by Maziar Saadatfar on 8/26/25.
//
import Foundation
import UIKit
import ControlKitBase
public struct NPSPresenter {
    var config: NetPromoterScoreViewConfig
    public init(data: NPSModel?, config: NetPromoterScoreViewConfig) {
        self.config = config
        if let localTitle = data?.title,
            let title = getLocalizeString(localTitle) { self.config.titleText = title }
        
        if let localDescription = data?.description,
            let description = getLocalizeString(localDescription) { self.config.descriptionTitleText = description }
        
        if let localRecommend = data?.recommend,
           let recommend = getLocalizeString(localRecommend) { self.config.questionText = recommend }
        
        if let localMin = data?.min_title,
           let min = getLocalizeString(localMin) { self.config.minTitleText = min }
        if let localMax = data?.max_title,
           let max = getLocalizeString(localMax) { self.config.maxTitleText = max }
        if let localInput = data?.input_label,
           let inputLabel = getLocalizeString(localInput) { self.config.descriptionTitleText = inputLabel }
        
        if let localSubmitButtonTitle = data?.submit_button_title,
           let buttonTitle = getLocalizeString(localSubmitButtonTitle) { self.config.submitButtonTitle = buttonTitle }
        
        if let localCancelButtonTitle = data?.cancel_button_title,
           let cancelButtonTitle = getLocalizeString(localCancelButtonTitle) { self.config.cancelButtonTitle = cancelButtonTitle }
        
        if let icon = data?.icon, let url = URL(string: icon) { setImageToConfig(from: url) }
    }
    
    func getLocalizeString(_ localize: LocalString) -> String? {
        guard let localizeString = localize.first(where: { $0.language == config.lang.rawValue }) else {
            if let defaultLang = localize.first {
                return defaultLang.content
            } else {
                return nil
            }
        }
        return localizeString.content
    }
    
    func setImageToConfig(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            self.config.logoImage = UIImage(data: data)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
