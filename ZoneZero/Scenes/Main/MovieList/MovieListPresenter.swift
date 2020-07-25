//
//  MovieListPresenter.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListPresentationLogic {
    func presentFetchedMovies(reponse: [MovieList.Movie.ViewModel])
}

class MovieListPresenter: ZoneZeroPresenter<MovieListView, MovieListRouter, MovieListViewController>, MovieListPresentationLogic {
    
    func presentFetchedMovies(reponse: [MovieList.Movie.ViewModel]) {
        viewController?.displayFetchedMovies(viewModels: reponse)
    }
}
