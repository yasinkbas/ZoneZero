//
//  RegisterPresenter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterPresentationLogic {
    func presentRegisterAccess(response: Response)
}

class RegisterPresenter: MCPresenter<RegisterView, RegisterRouter, RegisterViewController>, RegisterPresentationLogic {
    weak var viewController: RegisterDisplayLogic?
    
    func presentRegisterAccess(response: Response) {
        viewController?.processResponseIfValidated(response: response)
    }
}
