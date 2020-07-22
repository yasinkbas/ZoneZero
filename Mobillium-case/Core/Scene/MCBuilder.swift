//
//  MCBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol MCRoutable { }

protocol MCBuilder: MCRoutable {
    associatedtype View: MCView
    associatedtype Router: MCRouter
    associatedtype Presenter: MCPresenter<View, Router, ViewController>
    associatedtype Interactor: MCInteractor<View, Router, ViewController, Presenter>
    associatedtype ViewController: MCViewController<View, Router>
    associatedtype Buildable: MCBuildable
    
    func make() -> Buildable
}

protocol MCBuildable { }

extension UIViewController: MCBuildable { }
