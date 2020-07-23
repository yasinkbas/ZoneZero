//
//  LoginPresenter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginPresentationLogic {
    func presentLoginAccess(response: Response)
}

class LoginPresenter: ZZPresenter<LoginView, LoginRouter, LoginViewController>, LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentLoginAccess(response: Response) {
        viewController?.processResponseIfValidated(response: response)
    }
}
