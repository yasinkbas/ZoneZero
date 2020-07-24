//
//  MovieListRouter.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListRoutingLogic {
    func navigateBackLogin()
}

class MovieListRouter: ZoneZeroRouter, MovieListRoutingLogic {
    weak var viewController: MovieListViewController?
    
    func navigateBackLogin() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
