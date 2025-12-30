//
//  HomeViewModel.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation
import SwiftUI

@Observable
@MainActor
class HomeViewModel{
    
    var popularMovies:[MoviesShows] = []
    var topRatedMovies:[MoviesShows] = []
    var nowPlayingMovies:[MoviesShows] = []
    var upComingMovies:[MoviesShows] = []
    var popularTVShows:[MoviesShows] = []
    var latestTVShows:[MoviesShows] = []
    var isLoaded = false
    var errorMessage: String?
    
    
    private let fetchHomeDataUseCase: FetchHomeDataUseCaseProtocol
    
    init(fetchHomeDataUseCase: FetchHomeDataUseCaseProtocol) {
        self.fetchHomeDataUseCase = fetchHomeDataUseCase
    }
    
    func populateMoviesAndTVShowsData() async{
        guard !isLoaded else { return } // only load once
        isLoaded = true
        
        Task{
            popularMovies = await fetchHomeDataUseCase.fetchPopularMovies()
        }
        Task{
            topRatedMovies = await fetchHomeDataUseCase.fetchTopRatedMovies()
        }
        Task{
            nowPlayingMovies = await fetchHomeDataUseCase.fetchNowPlayingMovies()
        }
        Task{
            upComingMovies = await fetchHomeDataUseCase.fetchUpComingMovies()
        }
        Task{
            popularTVShows = await fetchHomeDataUseCase.fetchPopularTVShows()
        }
        Task{
            latestTVShows = await fetchHomeDataUseCase.fetchLatestTVShows()
        }
    }
}







