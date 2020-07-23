//
//  MovieListViewController.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListDisplayLogic: class {
    
}

class MovieListViewController : ZoneZeroViewController<MovieListView, MovieListRouter>, MovieListDisplayLogic {
    
    var interactor: MovieListBusinessLogic?
    let cellIdentifier: String = "movieListCell"
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func setupListeners() {
        super.setupListeners()
        v?.tableView.delegate   = self
        v?.tableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SquareImageTableViewCell(
            style: .default,
            reuseIdentifier: cellIdentifier,
            cellType: .annotated(
                title: "Inception",
                content: "Inception is a 2010 science fiction action film[4][5][6] written and directed by Christopher Nolan."),
            bottomPadding: 4
        )
        
        cell.configure(image: UIImage(named: "movieImage1")!)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
