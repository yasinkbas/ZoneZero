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
            content: "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence."
        ),
        .init(
            image: #imageLiteral(resourceName: "fight-club"),
            title: "Fight Club",
            content: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more."
        ),
        .init(
            image: #imageLiteral(resourceName: "goodfellas"),
            title: "Goodfellas",
            content: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate."
        ),
        .init(
            image: #imageLiteral(resourceName: "inception"),
            title: "Inception",
            content: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O."
        ),
        .init(
            image: #imageLiteral(resourceName: "interstellar"),
            title: "Interstellar",
            content: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."
        ),
        .init(
            image: #imageLiteral(resourceName: "matrix"),
            title: "Matrix",
            content: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
        ),
        .init(
            image: #imageLiteral(resourceName: "the-dark-knight"),
            title: "The Dark Knight",
            content: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice."
        ),
        .init(
            image: #imageLiteral(resourceName: "the-lord-of-the-rings"),
            title: "The Lord Of The Rings",
            content: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."
        ),
        .init(
            image: #imageLiteral(resourceName: "the-pianist"),
            title: "The Pianist",
            content: "A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II."
        ),
        .init(
            image: #imageLiteral(resourceName: "the-prestige"),
            title: "The Prestige",
            content: "After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other."
        ),
    ].shuffled()
}
