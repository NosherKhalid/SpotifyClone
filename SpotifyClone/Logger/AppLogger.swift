//
//  AppLogger.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import Foundation

import os

final class AppLogger {
    
    static let shared = AppLogger()
    private init() {}
    
    private let logger = Logger(subsystem: "com.yourapp.spotify", category: "debug")
    
    // MARK: - Section Logging
    func log(_ message: String, title: String = "DEBUG") {
        print("\n🔹 \(title) ---------------------")
        print(message)
        print("--------------------------------\n")
    }
    
    // MARK: - Dump (Indented)
    func dump<T>(_ value: T, title: String = "DUMP") {
        print("\n🔹 \(title) ---------------------")
        Swift.dump(value)
        print("--------------------------------\n")
    }
    
    // MARK: - Pretty JSON (for Codable)
    func prettyPrint<T: Encodable>(_ value: T, title: String = "JSON") {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        
        if let data = try? encoder.encode(value),
           let json = String(data: data, encoding: .utf8) {
            print("\n📦 \(title) ---------------------")
            print(json)
            print("--------------------------------\n")
        } else {
            print("⚠️ Failed to encode value for pretty print")
        }
    }
    
    // MARK: - Production Logging
    func systemLog(_ message: String, level: OSLogType = .debug) {
        logger.log(level: level, "\(message, privacy: .public)")
    }
}
