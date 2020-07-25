//
//  LoginViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginDisplayLogic: class {
    func processResponseIfValidated(response: Response, viewRequest: MovieListViewRequest)
}

class LoginViewController : ZoneZeroViewController<LoginView, LoginRouter>, LoginDisplayLogic {
    
    var interactor: LoginInteractor?
    
    override var isHideKeyboardWhenTapped: Bool {
        get { true }
        set { }
    }
    
    override func setupListeners() {
        super.setupListeners()
        v?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        v?.resetForm()
    }
    
    func processResponseIfValidated(response: Response, viewRequest: MovieListViewRequest) {
        if let response = response as? ErrorResponse {
            alert(title: response.title, message: response.content, actions: [.ok(nil)])
        } else if let _ = response as? SuccessResponse {
            router?.navigateMovieList(with: viewRequest)
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginView(_ loginView: LoginView, didTapActionButton actionButton: ZoneZeroButton, viewModel: Login.FormModel.ViewModel) {
        interactor?.login(viewModel: viewModel)
    }
    
    func loginView(_ loginView: LoginView, didTapAlternateButton alternateButton: ZoneZeroButton, formModel: Login.FormModel.ViewModel) {
        router?.navigateRegister()
    }
}
