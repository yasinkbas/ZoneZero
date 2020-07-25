//
//  MovieListViewController.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol MovieListDisplayLogic: class {
    func displayFetchedMovies(viewModels: [MovieList.Movie.ViewModel])
}

class MovieListViewController : ZoneZeroViewController<MovieListView, MovieListRouter>, MovieListDisplayLogic {
    
    var interactor: MovieListInteractor!
    
    var displayedMovies: [MovieList.Movie.ViewModel] = [] {
        didSet {
            self.v?.tableView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func setup() {
        super.setup()
        interactor.fetchMovies(request: .init())
    }
    
    override func setupListeners() {
        super.setupListeners()
        v?.tableView.delegate   = self
        v?.tableView.dataSource = self
        v?.logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = "Movies"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4037427497, green: 0.1702677981, blue: 0.2085620941, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func displayFetchedMovies(viewModels: [MovieList.Movie.ViewModel]) {
        displayedMovies = viewModels
    }
    
    @objc
    func didTapLogoutButton(_ sender: UIButton) {
        router?.navigateBackLogin()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieViewModel = displayedMovies[indexPath.row]
        
        return MovieTableViewCell(
            style: .default,
            reuseIdentifier: MovieTableViewCell.identifier,
            bottomPadding: 5
        )
        .with(viewModel: movieViewModel)
    }
}
