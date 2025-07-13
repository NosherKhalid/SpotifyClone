//
//  MainPage.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 6/30/25.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text("Main Page")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .font(.largeTitle)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainPage()
}
