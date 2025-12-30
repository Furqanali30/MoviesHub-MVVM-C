//
//  GradientText.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation
import SwiftUI


extension View {
    func gradientView() -> some View {
        self
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0/255, green: 180/255, blue: 255/255),  // Cyan
                        Color(red: 155/255, green: 90/255, blue: 255/255), // Purple
                        Color(red: 255/255, green: 110/255, blue: 90/255)  // Orange
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}


extension View {
    func gradientText() -> some View {
        modifier(GradientTextModifier())
    }
}


struct GradientTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color(red: 0/255, green: 180/255, blue: 255/255),  // Cyan
                        Color(red: 155/255, green: 90/255, blue: 255/255), // Purple
                        Color(red: 255/255, green: 110/255, blue: 90/255)  // Orange
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

