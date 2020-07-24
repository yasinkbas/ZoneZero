//
//  LoginPresenter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginPresentationLogic {
    func presentLoginAccess(response: Response, viewRequest: MovieListViewRequest)
}

class LoginPresenter: ZoneZeroPresenter<LoginView, LoginRouter, LoginViewController>, LoginPresentationLogic {
    
    func presentLoginAccess(response: Response, viewRequest: MovieListViewRequest) {
        viewController?.processResponseIfValidated(response: response, viewRequest: viewRequest)
    }
}
