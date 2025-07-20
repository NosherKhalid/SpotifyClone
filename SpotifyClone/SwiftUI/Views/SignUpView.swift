//
//  SignUpView.swift
//  SpotifyUI
//
//  Created by Nosher Khalid on 6/27/25.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 24) {
                Spacer()
                SpotifyLogo()
                    .frame(width: 100, height: 50)
                VStack(spacing: 0) {
                    Text("Millions of Songs")
                        .font(.custom("Lufga-Medium", size: 40))
                    Text("Free on Spotify.")
                        .font(.custom("Lufga-Medium", size: 38))
                }
                .foregroundStyle(.white)
                
                Button("Sign in with Spotify"){
//                    AuthManager.shared.startAuthorization()
                         AuthManager.shared.simulateLoginForTesting()
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .foregroundStyle(.black)
                .font(.custom("Lufga-Regular", size: 14))
                .background(.green)
                .clipShape(Capsule())
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    SignUpView()
}
