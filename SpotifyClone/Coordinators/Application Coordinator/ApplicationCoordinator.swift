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
        
        let signupCoordinator = SignupCoordinator()
        self.childCoordinators.append(signupCoordinator)
        
        signupCoordinator.onLoginSuccess = { [weak self] in
            debugPrint("DEBUG: Load login screen")
        }
        
        signupCoordinator.start()
        window.rootViewController = signupCoordinator.rootViewController
    }
    
    deinit {
        print("🗑️ ApplicationCoordinator deinit")
    }
}


