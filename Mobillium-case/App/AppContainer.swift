//
//  AppContainer.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

//let app = AppContainer()

final class AppContainer {
    let router: AppRouter
    
    init(window: UIWindow?) {
        router = AppRouter(window: window)
        setup()
    }
    
    func setup() {
        setUILab()
    }
    
    func setUILab() {
        UILab.Settings.debug = true
    }
}
