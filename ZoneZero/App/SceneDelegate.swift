//
//  SceneDelegate.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window          = UIWindow(windowScene: windowScene)
        let container   = AppContainer(window: window)
        container.router.initializeViewController()
    }

    func sceneDidDisconnect(_ scene: UIScene)       {}
    func sceneDidBecomeActive(_ scene: UIScene)     {}
    func sceneWillResignActive(_ scene: UIScene)    {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene)  {}
    
}

