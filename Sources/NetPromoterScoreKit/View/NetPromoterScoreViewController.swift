//
//  NetPromoterScoreViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class NetPromoterScoreViewController: UIViewController {
    var viewModel: NetPromoterScoreViewModel
    let config: NetPromoterScoreServiceConfig

    init(viewModel: NetPromoterScoreViewModel, config: NetPromoterScoreServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let NetPromoterScoreView = NetPromoterScoreViewStyle.make(viewModel: viewModel,
                                                    config: config.viewConfig)
        view.addSubview(NetPromoterScoreView)
        NetPromoterScoreView.fixInView(view)
        Task {
            viewModel.response = try await viewModel.netPromoterScoreService.getNetPromoterScore(request: viewModel.request)
        }
    }
}
