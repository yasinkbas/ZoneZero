//
//  LoginViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginDisplayLogic: class {
    func processResponseIfValidated(response: Response)
}

class LoginViewController : MCViewController<LoginView, LoginRouter>, LoginDisplayLogic {
    
    var interactor: LoginInteractor?
    
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

extension LoginViewController: LoginViewDelegate {
    func loginView(_ loginView: LoginView, didTapActionButton actionButton: MCButton, viewModel: Login.FormModel.ViewModel) {
        interactor?.login(viewModel: viewModel)
    }
    
    func loginView(_ loginView: LoginView, didTapAlternateButton alternateButton: MCButton, formModel: Login.FormModel.ViewModel) {
        router?.routeBackRegister()
    }
}
