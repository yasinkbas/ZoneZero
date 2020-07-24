//
//  MovieListDataProvidingWorker.swift
//  ZoneZero
//
//  Created by yasinkbas on 24.07.2020.
//

import Foundation

protocol MovieListDataProvidingWorkerLogic {
    func fetchMovies(handler: ([MovieList.Movie.ViewModel]) -> Void)
}

class MovieListDataProvidingWorker: MovieListDataProvidingWorkerLogic {
    
    func fetchMovies(handler: ([MovieList.Movie.ViewModel]) -> Void) {
        let viewModels = MoviesDataStore.movies
        handler(viewModels)
    }
}
