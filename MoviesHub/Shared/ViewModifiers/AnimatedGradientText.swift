//
//  AnimatedGradientText.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation
import SwiftUI

extension View {
    func animatedGradientText(
//        colors: [Color],
        duration: Double = 4
    ) -> some View {
//        modifier(AnimatedGradientTextModifier(colors: colors, duration: duration))
        modifier(AnimatedGradientTextModifier(duration: duration))
    }
}


struct AnimatedGradientTextModifier: ViewModifier {
//    let colors: [Color]
    let duration: Double

    @State private var animate = false

    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color(red: 0/255, green: 180/255, blue: 255/255),  // Cyan
                        Color(red: 155/255, green: 90/255, blue: 255/255), // Purple
                        Color(red: 255/255, green: 110/255, blue: 90/255)  // Orange
                    ],
                    startPoint: animate ? .topLeading : .topTrailing,
                    endPoint: animate ? .topTrailing : .topLeading
                )
            )
            .onAppear {
                withAnimation(
                    .linear(duration: duration)
                        .repeatForever(autoreverses: true)
                ) {
                    animate.toggle()
                }
            }
    }
}

