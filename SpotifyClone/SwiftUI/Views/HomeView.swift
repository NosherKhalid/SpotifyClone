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
        ZStack {
            Color(UIColor.black)
                .opacity(0.95)
                .ignoresSafeArea()
            
            VStack (spacing: 15) {
                // Top HStack
                HStack {
                    // Text
                    Text("Hello User!")
                        .font(.title)
                        .fontDesign(.default)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // Buttons
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            Image(systemName: "bell")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "timer.circle")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                    }
                    .tint(.white)
                }
                .padding(.top, 20)
                
                // Content Type
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(MusicContent.allCases, id: \.rawValue) { item in
                            CapsuleLabel(text: item.rawValue, isSelected: item == viewModel.selectedMusicContent)
                                .onTapGesture {
                                    viewModel.selectMusicContent(item)
                                }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 12)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
