//
//  SceneDelegate.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 6/30/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let coordinator = ApplicationCoordinator(window: window)
        self.applicationCoordinator = coordinator
        coordinator.start()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
           guard let url = URLContexts.first?.url else { return }
           if url.scheme == "spotifyclone" {
               AuthManager.shared.handleRedirectURL(url)
           }
       }
}

