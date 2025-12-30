//
//  PrimaryButton.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation
import SwiftUI


struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20,weight: .bold))
                .foregroundStyle(.white)
                .frame(width: UIScreen.safeWidth * 0.8,height: 50)
                .gradientView()
                .clipShape(Capsule())
                .padding(.bottom,20)
        }
    }
}
