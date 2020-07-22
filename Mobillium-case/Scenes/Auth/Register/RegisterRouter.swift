//
//  RegisterRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

@objc protocol RegisterRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeLogin()
    func routeMovieList()
}

protocol RegisterDataPassing {
    var dataStore: RegisterDataStore? { get }
}

class RegisterRouter: MCRouter, RegisterRoutingLogic, RegisterDataPassing {
    weak var viewController: RegisterViewController?
    var dataStore: RegisterDataStore?
    
    // MARK: Routing
    
    func routeLogin() {
        route(viewController, builder: LoginBuilder(), presentationStyle: .toLeft)
    }
    
    func routeMovieList() {
        // TODO: route movielist scene
    }
}
