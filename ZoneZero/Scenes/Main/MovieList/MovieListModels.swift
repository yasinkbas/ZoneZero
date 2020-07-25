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
        struct ViewModel: CustomStringConvertible {
            let image: UIImage
            let title: String
            let imdb: Float
            let director: String
            let writers: String
            let stars: String
            
            var description: String {
                "title: \(title) \nimdb: \(imdb) \ndirector(s): \(director)"
            }
        }
    }
}
