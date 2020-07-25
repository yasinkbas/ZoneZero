//
//  RegisterAuthenticationWorker.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import Foundation

protocol RegisterAuthenticationWorkerLogic {
    func authenticate(viewModel: Register.FormModel.ViewModel) -> Response
}

class RegisterAuthenticationWorker: RegisterAuthenticationWorkerLogic {
    
    func authenticate(viewModel: Register.FormModel.ViewModel) -> Response {
        if let name = viewModel.name,
           let username = viewModel.username,
           let password = viewModel.password,
           let repassword = viewModel.repassword,
           name.count > 3,
           username.count > 3 && username.count < 15,
           password.count > 3 && password.count < 15,
           password == repassword {
            return SuccessResponse()
        }
        
        return ErrorResponse(
            title: "Incorrect entry",
            content: "Please check these fields again. fields character counts must be between 3 and 15 characters"
        )
    }
}
