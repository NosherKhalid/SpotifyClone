//
//  AlbumModel.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation

// MARK: - New Releases Response
struct NewReleasesResponse: Codable {
    let albums: AlbumsPage
}

// MARK: - Albums Page (Pagination Wrapper)
struct AlbumsPage: Codable {
    let href: String
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
    let items: [Album]
}

// MARK: - Album
struct Album: Codable {
    let albumType: AlbumType
    let totalTracks: Int
    let availableMarkets: [String]
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [SpotifyImage]
    let name: String
    let releaseDate: String
    let releaseDatePrecision: String
    let restrictions: Restrictions?
    let type: String
    let uri: String
    let artists: [Artist]

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case totalTracks = "total_tracks"
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case restrictions, type, uri, artists
    }
}

// MARK: - AlbumType Enum
enum AlbumType: String, Codable {
    case album
    case single
    case compilation
}

// MARK: - Artist
struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let name: String
    let type: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

// MARK: - External URLs
struct ExternalUrls: Codable {
    let spotify: String
}

// MARK: - Spotify Image
struct SpotifyImage: Codable {
    let url: String
    let height: Int?
    let width: Int?
}

// MARK: - Restrictions
struct Restrictions: Codable {
    let reason: String
}
