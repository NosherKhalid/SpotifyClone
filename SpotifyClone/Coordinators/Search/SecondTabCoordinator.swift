//
//  SecondTabCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/1/25.
//

import UIKit
import SwiftUI

class SearchCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    lazy var searchViewController: UIViewController = {
        let vc = UIHostingController(rootView: SearchView())
        return vc
    }()
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        navigationController.viewControllers = [searchViewController]
    }
}
