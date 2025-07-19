//
//  SignupCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/15/25.
//

import Foundation
import SwiftUI

class SignupCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    
    init() {
        rootViewController = UINavigationController()
    }
    
    func start() {
        let controller = UIHostingController(rootView: SignUpView())
        rootViewController.viewControllers = [controller]
    }
}
