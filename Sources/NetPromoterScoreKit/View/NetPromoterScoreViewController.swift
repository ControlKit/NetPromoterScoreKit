//
//  NetPromoterScoreViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class NetPromoterScoreViewController: UIViewController, NetPromoterScoreDelegate {
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
        let netPromoterScoreView = NetPromoterScoreViewStyle.make(viewModel: viewModel,
                                                                  config: config.viewConfig)
        view.addSubview(netPromoterScoreView)
        netPromoterScoreView.fixInView(view)
        netPromoterScoreView.delegate = self
        viewModel.setViewAction()
    }
    
    func submit(description: String) {
        Task {
            let req = NetPromoterScoreViewRequest(comment: description)
            let _ = try await viewModel.setScore(viewRequest: req)
            dismiss(animated: true)
        }
    }
    
    func cancel() {
        dismiss(animated: true)
    }
}
