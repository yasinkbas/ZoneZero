//
//  LoginAuthenticationWorker.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import Foundation

protocol LoginAuthenticationWorkerLogic {
    func authenticate(viewModel: Login.FormModel.ViewModel) -> Response
}

class LoginAuthenticationWorker: LoginAuthenticationWorkerLogic {
    
    func authenticate(viewModel: Login.FormModel.ViewModel) -> Response {
        if let username = viewModel.username,
           let password = viewModel.password,
           username.count > 3 && username.count < 15,
           password.count > 3 && password.count < 15 {
            return SuccessResponse()
        }
        
        return ErrorResponse(
            title: "Incorrect entry",
            content: "Username and password must be bigger than 3 characters and lower than 15 characters."
        )
    }
}
