//
//  SignupCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/15/25.
//

import Foundation
import SwiftUI
import Combine

class SignupCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    var onLoginSuccess: () -> () = {}
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        rootViewController = UINavigationController()
    }
    
    func start() {
        let controller = UIHostingController(rootView: SignUpView())
        rootViewController.viewControllers = [controller]
        bind()
    }
    
    private func bind() {
        
        if AuthManager.shared.isLoggedIn.value {
            self.onLoginSuccess()
        }

        AuthManager.shared.isLoggedIn
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoggedIn in
                if isLoggedIn {
                    self?.onLoginSuccess()
                }
            }
            .store(in: &cancellables)
    }
    
    deinit {
        print("🗑️ SignupCoordinator deinit")
    }
}
