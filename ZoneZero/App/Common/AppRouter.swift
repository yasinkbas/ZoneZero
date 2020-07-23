//
//  AppRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func initializeViewController() {
        window?.rootViewController = RegisterBuilder().setup()
        window?.makeKeyAndVisible()
    }
}
