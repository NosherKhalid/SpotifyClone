//
//  FirstTabView.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 7/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(UIColor.black)
                .opacity(0.95)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("Browse")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding(.horizontal, 12)
        }
        .onAppear {
            viewModel.fetchNewReleases()
        }
    }
}

#Preview {
    let client = SpotifyAPIClient(session: .shared, tokenProvider: { AuthManager.shared.accessToken ?? ""})
    let repo = SpotifyRepository(apiClient: client)
    HomeView(viewModel: HomeViewModel(repository: repo))
}
