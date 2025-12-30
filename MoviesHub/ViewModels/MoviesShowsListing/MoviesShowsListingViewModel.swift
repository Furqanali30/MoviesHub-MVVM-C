//
//  MoviesShowsListingViewModel.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation

@Observable
@MainActor
class MoviesShowsListingViewModel{
    var mediaType:MediaType
    var movieList:[MoviesShows] = []
    var isLoading = false
    var errorMessage: String?
    
    private let fetchMovieTVShowsListingUseCase: FetchMovieTVShowsListingUseCaseProtocol
  
    
    init(mediaType:MediaType, fetchMovieTVShowsListingUseCase: FetchMovieTVShowsListingUseCaseProtocol) {
        self.fetchMovieTVShowsListingUseCase = fetchMovieTVShowsListingUseCase
        self.mediaType = mediaType
    }
    
    func populateData() async{
        isLoading = true
        defer{
            isLoading = false
        }
        movieList = await fetchMovieTVShowsListingUseCase.execute(mediaType: mediaType)
    }
}


