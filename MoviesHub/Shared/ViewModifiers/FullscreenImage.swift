//
//  FullscreenImage.swift
//  MoviesHub
//
//  Created by MacBook Pro on 24/12/2025.
//

import Foundation
import SwiftUI


struct FullscreenImageModifier: ViewModifier {
    let image: Image
    @State private var selectedImage: FullscreenImageItem?

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                selectedImage = FullscreenImageItem(image: image)
            }
            .fullScreenCover(item: $selectedImage) { item in
                FullscreenImageView(image: item.image)
            }
    }
}

struct FullscreenImageItem: Identifiable {
    let id = UUID()
    let image: Image
}


extension View {
    func fullscreenImage(image: Image) -> some View {
        modifier(FullscreenImageModifier(image: image))
    }
}

