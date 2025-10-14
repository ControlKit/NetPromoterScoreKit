//
//  NetPromoterScoreViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit
import ControlKitBase

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
        viewModel.setAction(.view)
    }
    
    func submit(description: String) {
        Task {
            do {
                viewModel.setAction(.submit)
                viewModel.saveLastId()
                let req = NetPromoterScoreViewRequest(comment: description)
                let _ = try await viewModel.setScore(viewRequest: req)
                DispatchQueue.main.async {
                    self.showSuccessAlert()
                }
            } catch {
                DispatchQueue.main.async {
                    self.showErrorAlert(error: error)
                }
            }
        }
    }
    
    private func showSuccessAlert() {
        let alertView = AlertView(config: config.viewConfig)
        alertView.configure(
            type: .success,
            message: config.viewConfig.successMessage,
            onDismiss: { [weak self] in
                self?.dismiss(animated: true)
            }
        )
        alertView.show(in: self.view)
    }
    
    private func showErrorAlert(error: Error) {
        let alertView = AlertView(config: config.viewConfig)
        alertView.configure(
            type: .error,
            message: config.viewConfig.errorMessage + error.localizedDescription,
            onDismiss: nil
        )
        alertView.show(in: self.view)
    }
    
    func cancel() {
        viewModel.setAction(.cancel)
        dismiss(animated: true)
    }
}
