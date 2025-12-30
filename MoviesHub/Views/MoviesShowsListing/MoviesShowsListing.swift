//
//  MoviesShowsListing.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct MoviesShowsListing: View {
    @Environment(NavigationManager.self) private var navManager
    let screenAlignmentSize = UIScreen.safeWidth * 0.8
    @State private var viewModel:MoviesShowsListingViewModel
    
    init(viewModel:MoviesShowsListingViewModel){
        _viewModel = State(initialValue: viewModel)
    }
    
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            //HeaderView
            HeaderView(navManager: navManager)
            
            VStack(alignment:.leading,spacing: 0){
                
                Text(viewModel.mediaType == .MOVIE ? "Movies" : "TV Shows")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 20,weight: .bold))
                    .padding(.bottom,10)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    LazyVStack{
                        ForEach(viewModel.movieList){ item in
                            MoviesShowsCell(item: item) {
                                if let id = item.id{
                                    navManager.push(.MoviesShowsDetail(mediaId: id, mediaType: viewModel.mediaType))
                                }
                            }
                            .padding(.bottom,10)
                        }
                    }
                }
                
            }
            .padding([.leading,.trailing,.top],20)
            
        }
        .task {
            await viewModel.populateData()
        }
    }
}

#Preview {
    MoviesShowsListing(viewModel: DependencyContainer().makeMoviesShowsListingViewModel(mediaType: MediaType.MOVIE))
        .environment(NavigationManager())
}
