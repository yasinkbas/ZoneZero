//
//  LoginRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginRoutingLogic {
    func navigateRegister()
    func navigateMovieList(with request: MovieListViewRequest)
}

class LoginRouter: ZoneZeroRouter, LoginRoutingLogic {
    weak var viewController: LoginViewController?
    
    func navigateRegister() {
        route(viewController, to: RegisterBuilder().setup(with: .init()), presentationStyle: .toRight)
    }
    
    func navigateMovieList(with request: MovieListViewRequest) {
        route(viewController, to: MovieListBuilder().setup(with: request), presentationStyle: .show)
    }
}
