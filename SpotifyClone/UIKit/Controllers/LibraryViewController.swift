//
//  LibraryViewController.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/13/25.
//

import UIKit

class LibraryViewController: UIViewController  {
    
    private let libraryView = LibraryView()
    
    override func viewDidLoad() {
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(libraryView)
        libraryView.frame = view.bounds
        
//        libraryView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
    }
}
