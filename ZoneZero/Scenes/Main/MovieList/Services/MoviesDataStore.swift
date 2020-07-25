//
//  MoviesDataStore.swift
//  ZoneZero
//
//  Created by yasinkbas on 24.07.2020.
//

import Foundation

class MoviesDataStore {
    static var movies: [MovieList.Movie.ViewModel]  =
        [
            .init(
                image: #imageLiteral(resourceName: "12-angry-men"),
                title: "12 angry men",
                imdb: 8.9,
                director: "Sidney Lumet",
                writers: "Reginald Rose",
                stars: "Henry Fonda, Lee J. Cobb, Martin Balsam"
            ),
            .init(
                image: #imageLiteral(resourceName: "fight-club"),
                title: "Fight Club",
                imdb: 8.8,
                director: "David Fincher",
                writers: "Chuck Palahniuk (novel), Jim Uhls (screenplay)",
                stars: "Brad Pitt, Edward Norton, Meat Loaf "
            ),
            .init(
                image: #imageLiteral(resourceName: "goodfellas"),
                title: "Goodfellas",
                imdb: 8.7,
                director: "Martin Scorsese",
                writers: "Nicholas Pileggi (book), Nicholas Pileggi (screenplay)",
                stars: "Robert De Niro, Ray Liotta, Joe Pesci"
            ),
            .init(
                image: #imageLiteral(resourceName: "inception"),
                title: "Inception",
                imdb: 8.8,
                director: "Christopher Nolan",
                writers: "Christopher Nolan",
                stars: "Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page"
            ),
            .init(
                image: #imageLiteral(resourceName: "interstellar"),
                title: "Interstellar",
                imdb: 8.6,
                director: "Christopher Nolan",
                writers: "Jonathan Nolan, Christopher Nolan",
                stars: "Matthew McConaughey, Anne Hathaway, Jessica Chastain"
            ),
            .init(
                image: #imageLiteral(resourceName: "matrix"),
                title: "The Matrix",
                imdb: 8.7,
                director: "Lana Wachowski (as The Wachowski Brothers), Lilly Wachowski (as The Wachowski Brothers)",
                writers: "Lilly Wachowski (as The Wachowski Brothers), Lana Wachowski (as The Wachowski Brothers)",
                stars: "Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss"
            ),
            .init(
                image: #imageLiteral(resourceName: "the-dark-knight"),
                title: "The Dark Knight",
                imdb: 9.0,
                director: "Christopher Nolan",
                writers: "Jonathan Nolan (screenplay), Christopher Nolan (screenplay)",
                stars: "Christian Bale, Heath Ledger, Aaron Eckhart "
            ),
            .init(
                image: #imageLiteral(resourceName: "the-lord-of-the-rings"),
                title: "The Lord Of The Rings",
                imdb: 8.9,
                director: "Peter Jackson",
                writers: "J.R.R. Tolkien (novel), Fran Walsh (screenplay)",
                stars: "Elijah Wood, Viggo Mortensen, Ian McKellen "
            ),
            .init(
                image: #imageLiteral(resourceName: "the-pianist"),
                title: "The Pianist",
                imdb: 8.5,
                director: "Roman Polanski",
                writers: "Ronald Harwood (screenplay), Wladyslaw Szpilman (book)",
                stars: "Adrien Brody, Thomas Kretschmann, Frank Finlay"
            ),
            .init(
                image: #imageLiteral(resourceName: "the-prestige"),
                title: "The Prestige",
                imdb: 8.5,
                director: "Christopher Nolan",
                writers: "Jonathan Nolan (screenplay), Christopher Nolan (screenplay)",
                stars: "Christian Bale, Hugh Jackman, Scarlett Johansson"
            )
        ].shuffled()
}
