//
//  AppContainer.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

final class AppContainer {
    let router: AppRouter
    
    init(window: UIWindow?) {
        router = AppRouter(window: window)
        configureNavigationController()
        configureUILab()
    }
    
    func configureNavigationController() {
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func configureUILab() {
        UILab.Settings.debug = true
    }
}
