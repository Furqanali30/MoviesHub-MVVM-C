//
//  HomeMoviesCell.swift
//  MoviesHub
//
//  Created by MacBook Pro on 19/12/2025.
//

import SwiftUI

extension Home{
    struct HomeMoviesCell: View {
        let item:MoviesShows
        let action: ((Int)->Void)?
        var itemTemplatePhotoWidth = ((UIScreen.safeWidth) / 2)
        @State private var selectedImage: FullscreenImageItem?
        @State private var showFullscreen = false
        var body: some View {
            VStack{
                RemoteImage(path: item.posterPath) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: itemTemplatePhotoWidth,height: itemTemplatePhotoWidth * 1.3)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                      
                }
                
                
                
                HStack{
                    Text(item.popularity ?? "NA")
                        .foregroundStyle(.white)
                        .font(.system(size: 15,weight: .semibold))
                        .padding(10)
                }.gradientView()
                    .clipShape(Circle())
                    .padding(.top,-30)
                
                VStack(spacing: 0) {
                    Text(item.name ?? "NA")
                        .foregroundColor(.black)
                        .font(.system(size: 17,weight: .bold))
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding([.leading,.trailing],10)
                    
                    
                    Text(item.releaseDate ?? "NA")
                        .foregroundStyle(._676767)
                        .font(.system(size: 14,weight: .semibold))
                        .padding(.top,10)
                    
                }
            }
            .frame(width: itemTemplatePhotoWidth)
            .padding([.leading,.trailing],5)
            .onTapGesture {
                if let action, let id = item.id{
                    action(id)
                }
            }
           
        }
    }
    
    #Preview {
        HomeMoviesCell(item: MoviesShows(),action: nil)
    }
}
