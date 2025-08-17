//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedMusicContent: MusicContent? = nil
    
    func selectMusicContent(_ item: MusicContent) {
        selectedMusicContent = item
    }
}

enum MusicContent: String, CaseIterable {
    case music = "Music"
    case podcast = "Podcasts & Shows"
}
