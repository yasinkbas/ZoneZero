//
//  MovieListInteractor.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListBusinessLogic {
    
}

protocol MovieListDataStore {
    
}

class MovieListInteractor: MovieListBusinessLogic, MovieListDataStore {
    var presenter: MovieListPresentationLogic?

    init() {
        
    }
}
