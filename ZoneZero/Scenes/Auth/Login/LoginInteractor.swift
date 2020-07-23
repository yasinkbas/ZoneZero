//
//  LoginInteractor.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginBusinessLogic {
    func login(viewModel: Login.FormModel.ViewModel)
}

protocol LoginDataStore { }

class LoginInteractor: ZZInteractor<LoginView, LoginRouter, LoginViewController, LoginPresenter>, LoginBusinessLogic, LoginDataStore {
    
    var authenticationWorker: LoginAuthenticationWorker
    
    override init() {
        authenticationWorker = LoginAuthenticationWorker()
        super.init()
    }

    func login(viewModel: Login.FormModel.ViewModel) {
        let response = authenticationWorker.authenticate(viewModel: viewModel)
        
        presenter?.presentLoginAccess(response: response)
    }
}
