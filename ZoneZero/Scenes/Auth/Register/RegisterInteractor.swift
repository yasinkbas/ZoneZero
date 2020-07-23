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

class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    var presenter: RegisterPresentationLogic?
    var authenticationWorker: RegisterAuthenticationWorkerLogic
    
    init() {
        authenticationWorker = RegisterAuthenticationWorker()
    }
    
    func register(viewModel: Register.FormModel.ViewModel) {
        let response = authenticationWorker.authenticate(viewModel: viewModel)
        presenter?.presentRegisterAccess(response: response)
    }
}
