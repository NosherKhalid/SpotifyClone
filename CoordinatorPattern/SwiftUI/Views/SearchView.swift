//
//  SecondTabView.swift
//  CoordinatorPattern
//
//  Created by Nosher Khalid on 7/1/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color(UIColor.link)
            Text("Search View")
                .font(.title)
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SearchView()
}
