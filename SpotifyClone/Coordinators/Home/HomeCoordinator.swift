//
//  FirstTabCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/1/25.
//

import UIKit
import SwiftUI

class HomeCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    lazy var homeViewController: UIViewController = {
        let client = SpotifyAPIClient(tokenProvider: { AuthManager.shared.accessToken ?? "" })
        let repository = SpotifyRepository(apiClient: client)
        let controller = UIHostingController(rootView: HomeView(viewModel: HomeViewModel(repository: repository)))
        return controller
    }()
    
    init() {
        rootViewController = UINavigationController()
    }
    
    func start() {
        print("Home View")
        rootViewController.setViewControllers([homeViewController], animated: true)
    }
}
