//
//  RegisterInteractor.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterBusinessLogic {
    func register(viewModel: Register.FormModel.ViewModel)
}

protocol RegisterDataStore { }

class RegisterInteractor:
    ZZInteractor<
        RegisterView,
        RegisterRouter,
        RegisterViewController,
        RegisterPresenter
    >, RegisterBusinessLogic, RegisterDataStore {
    var authenticationWorker: RegisterAuthenticationWorkerLogic
    
    override init() {
        authenticationWorker = RegisterAuthenticationWorker()
        super.init()
    }
    
    func register(viewModel: Register.FormModel.ViewModel) {
        let response = authenticationWorker.authenticate(viewModel: viewModel)
        presenter?.presentRegisterAccess(response: response)
    }
}
