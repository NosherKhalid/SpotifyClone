//
//  LibraryView.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/13/25.
//

import UIKit
import SnapKit

final class LibraryView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Views
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Library"
        label.textColor = .white
        label.textAlignment = .center
        addSubview(label)
        return label
    }()
    
    private func setupViews() {
        backgroundColor = .link
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
