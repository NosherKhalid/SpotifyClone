//
//  SceneDelegate.swift
//  CoordinatorPattern
//
//  Created by Nosher Khalid on 6/30/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let coordinator = ApplicationCoordinator(window: window)
        coordinator.start()
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

