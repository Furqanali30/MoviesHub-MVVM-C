//
//  HomeMainCell.swift
//  MoviesHub
//
//  Created by MacBook Pro on 19/12/2025.
//

import SwiftUI

extension Home{
    struct HomeMainCell: View {
        let title:String
        let list:[MoviesShows]
        let actionOnSelection:((Int) -> Void)?
        
        var body: some View {
            VStack(alignment:.leading){
                Text(title)
                    .foregroundStyle(.black)
                    .font(.system(size: 25,weight: .bold))
                    .padding(.leading,10)
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(alignment:.top){
                        ForEach(list){item in
                            HomeMoviesCell(item: item) { movieId in
                                if let actionOnSelection{
                                    actionOnSelection(movieId)
                                }
                            }
                        }
                    }
                }
                .frame(height: 380)
            }
        }
    }
    
    #Preview {
        HomeMainCell(title: "", list: [], actionOnSelection: nil)
    }
}
