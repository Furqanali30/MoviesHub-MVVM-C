//
//  CastListingCell.swift
//  MoviesHub
//
//  Created by MacBook Pro on 20/12/2025.
//

import SwiftUI

struct CastListingCell: View {
    let item:Cast
    let action:(()->Void)?
    
    var body: some View {
        HStack(spacing:10){
            RemoteImage(path: item.profilePath) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }
              
            
            VStack(alignment: .leading,spacing: 0){
                Text(item.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 16,weight: .bold))
                
                Text(item.character ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 16,weight: .regular))
                    .padding(.top,5)
            }
            
            Spacer()
        }
        .padding(.top,5)
        .onTapGesture {
            if let action{
                action()
            }
        }
    }
}

#Preview {
    CastListingCell(item: Cast(), action: nil)
}
