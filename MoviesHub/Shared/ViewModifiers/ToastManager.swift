//
//  ToastManager.swift
//  QrGenie
//
//  Created by MacBook Pro on 11/12/2025.
//

import Foundation
import SwiftUI

@Observable
class ToastManager {
    static let shared = ToastManager()
    
    var isShowing = false
    var message = ""
    
    private init() {}
    
    func show(_ message: String, duration: Double = 2.0) {
        self.message = message
        self.isShowing = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.isShowing = false
        }
    }
}


struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}


struct ToastModifier: ViewModifier {
    @State private var toastManager = ToastManager.shared
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if toastManager.isShowing {
                VStack {
                    Spacer()
                    ToastView(message: toastManager.message)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: toastManager.isShowing)
                .zIndex(999)
            }
        }
    }
}

extension View {
    func toast() -> some View {
        self.modifier(ToastModifier())
    }
}
