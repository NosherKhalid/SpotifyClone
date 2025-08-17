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
                    let homeCoordinator = HomeCoordinator()
                    self.childCoordinators.append(homeCoordinator)
                    homeCoordinator.start()
                    self.window.rootViewController = homeCoordinator.rootViewController
                } else {
                    let signupCoordinator = SignupCoordinator()
                    self.childCoordinators.append(signupCoordinator)
                    
                    signupCoordinator.onLoginSuccess = { [weak self] in
                        guard self != nil else { return }
                        debugPrint("DEBUG: Show Home Screen")
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


