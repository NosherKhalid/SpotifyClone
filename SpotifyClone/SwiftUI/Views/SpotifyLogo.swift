//
//  SpotifyLogo.swift
//  SpotifyUI
//
//  Created by Nosher Khalid on 6/25/25.
//

import SwiftUI

struct SpotifyLogo: View {
    var body: some View {
        
        GeometryReader { geometry in
            let size = geometry.size
            let center = CGPoint(x: size.width/2, y: size.height/2)
            let greenCircleRadius = size.width/2
            let arc1Radius = size.width * 0.167
            let arc1LineWidth = size.width * 0.035
            let arc2Radius = size.width * 0.1
            let arc2LineWidth = size.width * 0.03
            
            ZStack {
                Circle()
                    .fill(.green)
                    .frame(width: greenCircleRadius,
                           height: greenCircleRadius)
                    .position(center)
                
                SpotifyArc(
                    center: center,
                    radius: arc1Radius,
                    startingAngle: 280,
                    endlingAngle: 0,
                    clockwise: true)
                .stroke(.black, style: StrokeStyle(lineWidth: arc1LineWidth, lineCap: .round) )
                
                SpotifyArc(
                    center: center,
                    radius: arc2Radius,
                    startingAngle: 300,
                    endlingAngle: 340,
                    clockwise: true)
                .stroke(.black, style: StrokeStyle(lineWidth: arc2LineWidth, lineCap: .round) )
                
                //small dot
                Circle()
                    .fill(.black)
                    .frame(width: size.width * 0.05,
                           height: size.height * 0.05)
                    .position(center)
            }
            .ignoresSafeArea()
        }
    }
    
    struct SpotifyArc: Shape {
        var center: CGPoint
        var radius: CGFloat
        var startingAngle: Double
        var endlingAngle: Double
        var clockwise: Bool = true
        
        func path(in rect: CGRect) -> Path {
            Path() { path in
                path.addArc(
                    center: center,
                    radius: radius,
                    startAngle: .degrees(startingAngle),
                    endAngle: .degrees(endlingAngle),
                    clockwise: clockwise)
            }
        }
    }
}

#Preview {
    SpotifyLogo()
}
