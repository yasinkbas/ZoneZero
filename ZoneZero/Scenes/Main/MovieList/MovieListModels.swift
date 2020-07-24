//
//  MovieListModels.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

enum MovieList {
    enum Movie {
        struct Request { }
        struct ViewModel {
            let image: UIImage
            let title: String
            let content: String
        }
    }
}

extension ZoneZeroTableViewDataSource where Model == MovieList.Movie.ViewModel {
    static func make(for movies: [MovieList.Movie.ViewModel], reuseIdentifier: String = "movie") -> ZoneZeroTableViewDataSource {
        ZoneZeroTableViewDataSource(
            models: movies,
            reuseIdentifier: reuseIdentifier
        ) { movie, cell in
            cell.textLabel?.text = movie.title
            cell.detailTextLabel?.text = movie.content
        }
    }
}
