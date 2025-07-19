//
//  BackgroundView.swift
//  SpotifyUI
//
//  Created by Nosher Khalid on 6/27/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: .green, location: 0.001),
                .init(color: .black, location: 0.50)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundView()
}
