//
//  RemoteImage.swift
//  MoviesHub
//
//  Created by MacBook Pro on 20/12/2025.
//

import Foundation
import SwiftUI

@ViewBuilder
func RemoteImage(
    path: String?,
    basePath: String = MockAPIs.imageBasePath,
    failureImage: ImageResource = .appIconWithoutName,
    @ViewBuilder imageModifier: @escaping (Image) -> some View
) -> some View {
    if let path = path,
       let url = URL(string: basePath + path) {
        AsyncImage(url: url) { phase in
            imageModifier(phase.image ?? Image(failureImage))
        }
    } else {
        imageModifier(Image(failureImage))
    }
}


struct FullscreenImageView: View {
    @Environment(\.dismiss) private var dismiss
    let image: Image

    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1

    var body: some View {
        ZStack(alignment: .topLeading) {

            Color.black.ignoresSafeArea()

            image
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = max(1, lastScale * value)
                        }
                        .onEnded { _ in
                            lastScale = scale
                        }
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Back button
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .bold))
                    .padding(12)
                    .background(.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.leading, 16)
            .padding(.top, 50)
        }
    }
}
