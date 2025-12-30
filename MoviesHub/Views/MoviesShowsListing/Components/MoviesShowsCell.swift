//
//  MoviesShowsCell.swift
//  MoviesHub
//
//  Created by MacBook Pro on 20/12/2025.
//

import SwiftUI

extension MoviesShowsListing {
    struct MoviesShowsCell: View {
        
        let item:MoviesShows
        let actionOnSelection: (() -> Void)?
        
        var body: some View {
            HStack(spacing: 0) {
                RemoteImage(path: item.posterPath) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90,height: 120)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(alignment: .leading,spacing: 0){
                    
                    Text(item.name ?? "NA")
                        .foregroundStyle(.black)
                        .font(.system(size: 16,weight: .bold))
                    
                    Text(item.releaseDate ?? "NA")
                        .foregroundStyle(._676767)
                        .font(.system(size: 15,weight: .regular))
                        .padding([.top,],2)
                        .padding([.bottom],10)
                    
                    Text(item.overview ?? "NA")
                        .foregroundStyle(.black)
                        .font(.system(size: 15,weight: .regular))
                        .lineLimit(2)
                }
                .padding([.leading,.trailing],10)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.C_4_C_4_C_4, lineWidth: 1)
            )
            .onTapGesture {
                if let actionOnSelection{
                    actionOnSelection()
                }
            }
            
        }
    }
    
    #Preview {
        MoviesShowsCell(item: MoviesShows(), actionOnSelection: nil)
    }
    
}
