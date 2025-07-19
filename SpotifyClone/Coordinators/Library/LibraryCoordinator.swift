//
//  LibraryCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/13/25.
//

import UIKit

class LibraryCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    lazy var libraryViewController: LibraryViewController = {
        LibraryViewController()
    }()
    
    init() {
        rootViewController = UINavigationController()
    }
    
    func start() {
        rootViewController.viewControllers = [libraryViewController]
    }
}
