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
        let controller = UIHostingController(rootView: HomeView())
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
