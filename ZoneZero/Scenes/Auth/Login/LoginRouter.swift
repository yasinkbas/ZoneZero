//
//  LoginRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeMovieList()
    func routeBackRegister()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: ZoneZeroRouter, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeBackRegister() {
        route(viewController, builder: RegisterBuilder(), presentationStyle: .toRight)
    }
    
    func routeMovieList() {
        // TODO: route movielist scene
    }
}
