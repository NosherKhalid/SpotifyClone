//
//  ApplicationCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 6/30/25.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        AuthManager.shared.refreshAccessTokenIfNeeded { success in
            DispatchQueue.main.async {
                if success {
                    let mainCoordinator = MainCoordinator()
                    self.childCoordinators.append(mainCoordinator)
                    mainCoordinator.start()
                    self.window.rootViewController = mainCoordinator.rootViewController
                } else {
                    let signupCoordinator = SignupCoordinator()
                    self.childCoordinators.append(signupCoordinator)
                    
                    signupCoordinator.onLoginSuccess = { [weak self] in
                        guard let self else { return }
                        self.childCoordinators.removeAll()
                        
                        let mainCoordinator = MainCoordinator()
                        self.childCoordinators.append(mainCoordinator)
                        mainCoordinator.start()
                        self.window.rootViewController = mainCoordinator.rootViewController
                    }
                    
                    signupCoordinator.start()
                    self.window.rootViewController = signupCoordinator.rootViewController
                }
            }
        }
    }
    
    deinit {
        print("🗑️ ApplicationCoordinator deinit")
    }
}


