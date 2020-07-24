//
//  MovieListInteractor.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListBusinessLogic {
    func fetchMovies(request: MovieList.Movie.Request)
}

protocol MovieListDataStore {
    var movies: [MovieList.Movie.ViewModel]? { get }
}

class MovieListInteractor: ZoneZeroInteractor<
    MovieListView,
    MovieListRouter,
    MovieListViewController,
    MovieListPresenter
>, MovieListBusinessLogic, MovieListDataStore {
    
    var dataProvidingWorker: MovieListDataProvidingWorker
    
    var movies: [MovieList.Movie.ViewModel]? {
        didSet {
            self.presenter?.presentFetchedMovies(reponse: movies!)
        }
    }
    
    override init() {
        dataProvidingWorker = MovieListDataProvidingWorker()
        super.init()
    }
    
    func fetchMovies(request: MovieList.Movie.Request) {
        
        dataProvidingWorker.fetchMovies { movies in
            self.movies = movies
        }
    }
}
