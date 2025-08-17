//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    var repository: SpotifyRepository
    var cancellables: Set<AnyCancellable> = []
    
    init(repository: SpotifyRepository) {
        self.repository = repository
    }
    
    func fetchNewReleases() {
        repository.getNewReleases()
            .sink { completion in
                switch completion {
                case .finished: break
                    
                case .failure(let error): print(error)
                    
                }
            } receiveValue: { albums in
                AppLogger.shared.prettyPrint(albums)
            }
            .store(in: &cancellables)

    }
}
