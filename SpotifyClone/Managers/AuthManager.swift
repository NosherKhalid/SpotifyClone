//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/15/25.
//

import Foundation
import UIKit
import CommonCrypto

// MARK: - AuthManager.swift
class AuthManager {
    static let shared = AuthManager()

    private let clientID = "af0cf567fc9549c69180d3dd1a39098d"
    private let redirectURI = "spotifyclone://callback"
    private let scopes = "user-read-email user-read-private"
    private let tokenURL = "https://accounts.spotify.com/api/token"

    private var codeVerifier: String?
    private(set) var accessToken: String?

    private init() {}

    func startAuthorization() {
        codeVerifier = generateCodeVerifier()
        guard let codeVerifier = codeVerifier,
              let codeChallenge = generateCodeChallenge(from: codeVerifier) else { return }

        let base = "https://accounts.spotify.com/authorize"
        let state = UUID().uuidString
        let query = "?client_id=\(clientID)&response_type=code&redirect_uri=\(redirectURI)&scope=\(scopes.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&code_challenge_method=S256&code_challenge=\(codeChallenge)&state=\(state)"

        let fullURL = base + query

        if let url = URL(string: fullURL) {
            UIApplication.shared.open(url)
        }
    }

    func handleRedirectURL(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value,
              let verifier = codeVerifier else {
            print("❌ Missing code or verifier")
            return
        }

        exchangeCodeForToken(code: code, codeVerifier: verifier)
    }

    private func exchangeCodeForToken(code: String, codeVerifier: String) {
        guard let url = URL(string: tokenURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let bodyParams = [
            "client_id": clientID,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": redirectURI,
            "code_verifier": codeVerifier
        ]

        let bodyString = bodyParams.map { "\($0)=\($1)" }.joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    print("✅ Token Response: \(json)")
                    self.accessToken = json["access_token"] as? String
                }
            } catch {
                print("❌ Failed to decode token response: \(error)")
            }
        }.resume()
    }

    // MARK: - PKCE Helpers
    private func generateCodeVerifier() -> String {
        let characters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return String((0..<128).compactMap { _ in characters.randomElement() })
    }

    private func generateCodeChallenge(from verifier: String) -> String? {
        guard let data = verifier.data(using: .utf8) else { return nil }

        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }

        let base64 = Data(hash).base64EncodedString()
        return base64.replacingOccurrences(of: "+", with: "-")
                      .replacingOccurrences(of: "/", with: "_")
                      .replacingOccurrences(of: "=", with: "")
    }
}
