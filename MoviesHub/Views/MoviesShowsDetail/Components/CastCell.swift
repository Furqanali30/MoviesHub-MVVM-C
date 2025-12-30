//
//  CastCell.swift
//  MoviesHub
//
//  Created by MacBook Pro on 19/12/2025.
//

import SwiftUI

extension MoviesShowsDetail{
    
    struct CastCell: View {
        
        let item:Cast
        let actionOnSelection: (()->Void)?
        
        var body: some View {
            VStack(spacing:0){
                RemoteImage(path: item.profilePath) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120,height: 140)
                        .clipped()
                }
                
                Text(item.character ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 14,weight: .bold))
                    .frame(width:120)
                    .padding([.top,.bottom],5)
                
                Text(item.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 14,weight: .regular))
                    .frame(width:120)
                    .padding(.bottom,5)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color:._0_D_243_E, radius: 5)
            .onTapGesture {
                if let actionOnSelection{
                    actionOnSelection()
                }
            }
            
        }
    }
    
    #Preview {
        CastCell(item: Cast(), actionOnSelection: nil)
    }
    
}
