//
//  MainCoordinator.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 6/30/25.
//

import SwiftUI
import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var rootViewController: UITabBarController
    
    init() {
        rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .black.withAlphaComponent(0.9)
        rootViewController.tabBar.tintColor = .white
    }
    
    func start() {
        setup()
    }
    
    private func setup() {
        let hc = HomeCoordinator()
        hc.start()
        
        self.childCoordinators.append(hc)
        
        // Home
        let homeVC = hc.homeViewController
        setTab(vc: homeVC,
               title: "Home",
               defaultImage: "home",
               selectedImage: "home_filled")
        
        
        // Search
        let sc = SearchCoordinator()
        sc.start()
        
        self.childCoordinators.append(sc)
        let searchVC = sc.searchViewController
        setTab(vc: searchVC, title: "Search", defaultImage: "search", selectedImage: "search_white")
        
        
        // Library
        let lc = LibraryCoordinator()
        lc.start()
        
        let libraryVC = lc.libraryViewController
        setTab(vc: libraryVC,
               title: "Library",
               defaultImage: "music.note.list",
               selectedImage: "music.note.list")
        
        self.rootViewController.viewControllers = [homeVC, searchVC, libraryVC]
        
    }
    
    private func setTab(vc: UIViewController, title: String, defaultImage: String, selectedImage: String) {
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: defaultImage), selectedImage: UIImage(named: selectedImage))
        vc.tabBarItem = tabBarItem
    }
}
