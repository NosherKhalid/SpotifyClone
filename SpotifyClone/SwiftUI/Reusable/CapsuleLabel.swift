//
//  CapsuleLabel.swift
//  SpotifyClone
//
//  Created by Nosher Khalid on 8/17/25.
//

import SwiftUI

struct CapsuleLabel: View {
    let text: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.regular)
            .padding(.horizontal, 12)
            .padding(.vertical, 3.5)
            .foregroundColor(isSelected ? .black : .white)
            .background(isSelected ? .green : .gray)
            .clipShape(Capsule())
    }
}

#Preview {
    CapsuleLabel(text: "Music")
}
