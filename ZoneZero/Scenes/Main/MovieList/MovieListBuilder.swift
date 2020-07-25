//
//  MovieListBuilder.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

struct MovieListViewRequest: ZoneZeroViewRequest {
    let username: String
}

class MovieListBuilder: ZoneZeroBuilder {
    func setup(with request: MovieListViewRequest) -> UINavigationController {
        let view            = MovieListView(viewRequest: request)
        let viewController  = MovieListViewController(view: view)
        let interactor      = MovieListInteractor()
        let presenter       = MovieListPresenter()
        let router          = MovieListRouter()
        viewController.interactor = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        viewController.setup()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

