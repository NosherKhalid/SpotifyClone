//
//  EndPoint.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put  = "PUT"
    case delete = "DELETE"
}

enum NetworkError: LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unauthorized
    case serverError(Int)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .requestFailed: return "Network request failed."
        case .decodingFailed: return "Failed to decode response."
        case .unauthorized: return "Unauthorized request."
        case .serverError(let code): return "Server error with status code \(code)."
        case .unknown(let error): return error.localizedDescription
        }
    }
}

struct Endpoint {
    let path: String
    let method: HTTPMethod
    var queryItems: [URLQueryItem] = []
    var headers: [String: String] = [:]
    
    func urlRequest(baseURL: URL, accessToken: String) -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        return request
    }
}

extension Endpoint {
    static func newReleases(limit: Int = 20, offset: Int = 0) -> Endpoint {
        Endpoint(
            path: "browse/new-releases",
            method: .get,
            queryItems: [
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "offset", value: "\(offset)")
            ]
        )
    }
    
    static func featuredPlaylists(limit: Int = 20) -> Endpoint {
        Endpoint(
            path: "browse/featured-playlists",
            method: .get,
            queryItems: [
                URLQueryItem(name: "limit", value: "\(limit)")
            ]
        )
    }
}
