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
    
    var username: String
    var interactor: MovieListInteractor!
    
    let cellIdentifier: String = "movieListCell"
    
    var displayedMovies: [MovieList.Movie.ViewModel] = [] {
        didSet {
            self.v?.tableView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    init(view: MovieListView, username: String) {
        self.username = username
        super.init(view: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        super.setup()
        interactor.fetchMovies(request: .init())
    }
    
    override func setupListeners() {
        super.setupListeners()
        v?.tableView.delegate   = self
        v?.tableView.dataSource = self
        v?.goLogoutButton.addTarget(self, action: #selector(didTapGoLogoutButton), for: .touchUpInside)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = "Movies"
        v?.configure(username: username)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func displayFetchedMovies(viewModels: [MovieList.Movie.ViewModel]) {
        displayedMovies = viewModels
        print(viewModels)
    }
    
    @objc
    func didTapGoLogoutButton(_ sender: UIButton) {
        router?.navigateBackLogin()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieViewModel = displayedMovies[indexPath.row]
        
        let cell = SquareImageTableViewCell(
            style: .default,
            reuseIdentifier: cellIdentifier,
            cellType: .annotated(
                title: movieViewModel.title,
                content: movieViewModel.content
            ),
            bottomPadding: 20
        )
        
        cell.configure(image: movieViewModel.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
