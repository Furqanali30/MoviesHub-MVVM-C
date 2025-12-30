//
//  FetchMovieTVShowsListingUseCase.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
protocol FetchMovieTVShowsListingUseCaseProtocol{
    func execute(mediaType:MediaType) async -> [MoviesShows]
}

class FetchMovieTVShowsListingUseCase:FetchMovieTVShowsListingUseCaseProtocol{
    let movieRepository:MovieRepositoryProtocol
    let tvShowRepository:TVShowsRepositoryProtocol
    init(movieRepository:MovieRepositoryProtocol,tvShowRepository:TVShowsRepositoryProtocol) {
        self.movieRepository = movieRepository
        self.tvShowRepository = tvShowRepository
    }
    
    func execute(mediaType:MediaType) async -> [MoviesShows] {
        
        if mediaType == .MOVIE{
            do{
                return try await movieRepository.fetchPopularMovies().results ?? []
            }catch{
                print("Error in Loading Movies \(error.localizedDescription)")
                return []
            }
        }else{
            do{
                return try await tvShowRepository.fetchPopularTVShows().results ?? []
            }catch {
                print("Error in Loading TV Shows \(error.localizedDescription)")
                return []
            }
        }
    }
}
