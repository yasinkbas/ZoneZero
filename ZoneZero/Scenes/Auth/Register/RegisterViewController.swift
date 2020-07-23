//
//  RegisterViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterDisplayLogic: class {
    func processResponseIfValidated(response: Response)
}

class RegisterViewController:ZZViewController<RegisterView, RegisterRouter>, RegisterDisplayLogic {
    
    var interactor: RegisterBusinessLogic?
    
    override func setupListeners() {
        super.setupListeners()
        v?.delegate = self
    }
    
    func processResponseIfValidated(response: Response) {
        if let response = response as? ErrorResponse {
            showAlert(title: response.title, message: response.content, actions: [.ok(nil)])
        } else if let _ = response as? SuccessResponse {
            router?.routeMovieList()
        }
    }
}

extension RegisterViewController: RegisterViewDelegate {
    func registerView(_ registerView: RegisterView, didTapActionButton actionButton: ZZButton, viewModel: Register.FormModel.ViewModel) {
        interactor?.register(viewModel: viewModel)
    }
    
    func registerView(_ registerView: RegisterView, didTapAlternateButton alternateButton: ZZButton, viewModel: Register.FormModel.ViewModel) {
        router?.routeLogin()
    }
}

