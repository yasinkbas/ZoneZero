//
//  MovieListRouter.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

@objc protocol MovieListRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MovieListRouter: ZoneZeroRouter, MovieListRoutingLogic, MovieListDataPassing {
    weak var viewController: MovieListViewController?
    var dataStore: MovieListDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: MovieListViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: MovieListDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
