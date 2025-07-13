//
//  FirstTabView.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/1/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemBlue)
            Text("Home View")
                .font(.title)
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
