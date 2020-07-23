//
//  MovieListBuilder.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class MovieListBuilder: ZZBuilder {
    func setup() -> MovieListViewController {
        let view = MovieListView()
        let viewController = MovieListViewController(view: view)
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}

