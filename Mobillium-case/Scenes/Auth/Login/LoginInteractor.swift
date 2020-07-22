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

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var authenticationWorker: LoginAuthenticationWorker
    
    init() {
        authenticationWorker = LoginAuthenticationWorker()
    }

    func login(viewModel: Login.FormModel.ViewModel) {
        let response = authenticationWorker.authenticate(viewModel: viewModel)
        
        presenter?.presentLoginAccess(response: response)
    }
}
