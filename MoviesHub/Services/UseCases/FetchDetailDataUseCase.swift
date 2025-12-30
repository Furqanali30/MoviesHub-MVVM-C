//
//  FetchDetailDataUseCase.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
protocol FetchDetailDataUseCaseProtocol{
    func fetchMediaDetails(mediaType:MediaType,mediaId:Int) async -> MoviesShows?
    func fetchCastAndCrew(mediaType:MediaType,mediaId:Int) async -> [Cast]
}

class FetchDetailDataUseCase:FetchDetailDataUseCaseProtocol{
    private let movieRepository: MovieRepositoryProtocol
    private let tvShowsRepository: TVShowsRepositoryProtocol
    private let castAndCrewRepository: CastAndCrewRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol, tvShowsRepository: TVShowsRepositoryProtocol, castAndCrewRepository: CastAndCrewRepositoryProtocol) {
        self.movieRepository = movieRepository
        self.tvShowsRepository = tvShowsRepository
        self.castAndCrewRepository = castAndCrewRepository
    }
    
    
    func fetchMediaDetails(mediaType: MediaType, mediaId: Int) async -> MoviesShows? {
        do {
            return try await (mediaType == .MOVIE) ? movieRepository.fetchMovieDetails(id: mediaId) : tvShowsRepository.fetchTVShowsDetails(id: mediaId)
        } catch {
            print("\(mediaType == .MOVIE ? "Movies" : "TVShows") Details failed:", error)
            return nil
        }
    }
    
    func fetchCastAndCrew(mediaType: MediaType, mediaId: Int) async -> [Cast] {
        do {
            return try await castAndCrewRepository.fetchCastAndCrew(id: mediaId, mediaType: mediaType).cast ?? []
        } catch {
            print("\(mediaType == .MOVIE ? "Movies" : "TVShows") Cast failed:", error)
            return []
        }
        
      
        
    }
    
}
