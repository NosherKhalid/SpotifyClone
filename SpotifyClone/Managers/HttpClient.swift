//
//  NetworkManager.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//


import Foundation
import Combine

protocol SpotifyAPIClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error>
}

final class SpotifyAPIClient: SpotifyAPIClientProtocol {
    private let baseURL = URL(string: "https://api.spotify.com/v1/")!
    private let session: URLSession
    private let tokenProvider: () -> String   // inject access token dynamically
    
    init(session: URLSession = .shared, tokenProvider: @escaping () -> String) {
        self.session = session
        self.tokenProvider = tokenProvider
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error> {
        let accessToken = tokenProvider()
        let request = endpoint.urlRequest(baseURL: baseURL, accessToken: accessToken)
        
        return session.dataTaskPublisher(for: request)
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse else {
                    throw NetworkError.requestFailed
                }
                
                switch response.statusCode {
                case 200..<300:
                    return output.data
                case 401:
                    throw NetworkError.unauthorized
                case 400..<500:
                    throw NetworkError.requestFailed
                case 500..<600:
                    throw NetworkError.serverError(response.statusCode)
                default:
                    throw NetworkError.requestFailed
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                if error is DecodingError {
                    return NetworkError.decodingFailed
                }
                if let netError = error as? NetworkError {
                    return netError
                }
                return NetworkError.unknown(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
