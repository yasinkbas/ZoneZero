//
//  RegisterRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterRoutingLogic {
    func navigateLogin()
    func navigateMovieList(with request: MovieListViewRequest)
}

class RegisterRouter: ZoneZeroRouter, RegisterRoutingLogic {
    weak var viewController: RegisterViewController?
    
    func navigateLogin() {
        route(viewController, to: LoginBuilder().setup(with: .init()), presentationStyle: .toLeft)
    }
    
    func navigateMovieList(with request: MovieListViewRequest) {
        route(viewController, to: MovieListBuilder().setup(with: request), presentationStyle: .show)
    }
}
