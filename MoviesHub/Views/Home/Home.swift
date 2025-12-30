//
//  Home.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct Home: View {
    @Environment(NavigationManager.self) private var navManager
    var screenWidthAlignment = UIScreen.safeWidth * 0.8
    @State private var searchText: String = ""
    
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:0){
            
            HStack(alignment:.center){
                Text("Vimio")
                    .font(.system(size: 40,weight: .bold))
                    .padding(10)
                    .animatedGradientText(duration: 2)
                
                Spacer()
                
                Text("Movies")
                    .font(.system(size: 15,weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.trailing,20)
                    .onTapGesture {
                        navManager.push(.MoviesShowsListing(mediaType: .MOVIE))
                    }
                
                Text("TV Shows")
                    .font(.system(size: 15,weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.trailing,20)
                    .onTapGesture {
                        navManager.push(.MoviesShowsListing(mediaType: .TVShow))
                    }
                
            }
            .background(Color._0_D_243_E)
            
            ScrollView{
                
                VStack{
                    
                    //Banner View
                    VStack{
                        ZStack{
                            Image(.homeBanner)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.safeWidth)
                            
                            VStack(alignment:.leading){
                                Text("Welcome.")
                                    .font(.system(size: 25,weight: .bold))
                                    .foregroundStyle(.white)
                                
                                Text("Millions of Movie, TV Show and people to discover.")
                                    .font(.system(size: 15,weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding([.top,.bottom],10)
                                
                                HStack{
                                    TextField("Movies, TV Shows", text: $searchText)
                                        .font(.system(size: 14))
                                        .padding()
                                        .foregroundColor(.gray)
                                    
                                    Text("Search")
                                        .font(.system(size: 14,weight: .semibold))
                                        .foregroundStyle(Color.white)
                                        .frame(height: 40)
                                        .padding([.leading,.trailing],15)
                                        .background(Color._61_CCB_6)
                                        .clipShape(Capsule())
                                    
                                }
                                .background(Color.white)
                                .frame(width: screenWidthAlignment,height: 40)
                                .clipShape(Capsule())
                                .padding([.bottom,.top],10)
                                
                            }
                            .frame(width: screenWidthAlignment)
                        }
                        
                        
                    }
                    .frame(height: 200)
                    
                    if viewModel.popularMovies.count > 0{
                        //Popular
                        HomeMainCell(title: "Popular", list: viewModel.popularMovies) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .MOVIE))
                        }
                    }
                    
                    if viewModel.topRatedMovies.count > 0{
                        //Top Rated
                        HomeMainCell(title: "Top Rated", list: viewModel.topRatedMovies) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .MOVIE))
                        }
                    }
                    
                    if viewModel.nowPlayingMovies.count > 0{
                        //Now Playing
                        HomeMainCell(title: "Now Playing", list: viewModel.nowPlayingMovies) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .MOVIE))
                        }
                    }
                    
                    if viewModel.upComingMovies.count > 0{
                        //Upcoming
                        HomeMainCell(title: "Upcoming", list: viewModel.upComingMovies) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .MOVIE))
                        }
                    }
                    
                    if viewModel.popularTVShows.count > 0{
                        //Popular TV Shows
                        HomeMainCell(title: "Popular TV Shows", list: viewModel.popularTVShows) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .TVShow))
                        }
                    }
                    
                    if viewModel.latestTVShows.count > 0{
                        //Latest TV Shows
                        HomeMainCell(title: "Latest TV Shows", list: viewModel.latestTVShows) { movieId in
                            navManager.push(.MoviesShowsDetail(mediaId: movieId, mediaType: .TVShow))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            
        }
        .onAppear{
            Task{
                await viewModel.populateMoviesAndTVShowsData()
            }
        }
        
    }
}

#Preview {
    Home(viewModel: HomeViewModel(fetchHomeDataUseCase: DependencyContainer().fetchHomeDataUseCase))
        .environment(NavigationManager())
}
