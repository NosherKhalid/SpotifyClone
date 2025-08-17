//
//  SpotifyRepository.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation
import Combine

final class SpotifyRepository {
    private let apiClient: SpotifyAPIClientProtocol
    
    init(apiClient: SpotifyAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getNewReleases() -> AnyPublisher<[Album], Error> {
        apiClient.request(Endpoint.newReleases())
            .map { (response: NewReleasesResponse) in
                response.albums.items
            }
            .eraseToAnyPublisher()
    }
}
