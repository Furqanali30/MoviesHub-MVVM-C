//
//  MoviesRemoteDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation


// Core/Data/DataSources/Remote/MovieRemoteDataSource.swift

class MovieRemoteDataSource:MoviesDataSourceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies() async throws -> HomeListing{
        
        let dto: HomeListingDTO = try await apiClient.request(.PopularMovies)
        return dto.toDomain()
    }
    func fetchTopRatedMovies() async throws -> HomeListing{
        let dto: HomeListingDTO = try await apiClient.request(.TopRatedMovies)
        return dto.toDomain()
    }
    func fetchNowPlayingMovies() async throws -> HomeListing{
        let dto: HomeListingDTO = try await apiClient.request(.NowPlayingMovies)
        return dto.toDomain()
    }
    func fetchUpComingMovies() async throws -> HomeListing{
        let dto: HomeListingDTO = try await apiClient.request(.UpcomingMovies)
        return dto.toDomain()
    }
    func fetchMovieDetails(id:Int) async throws -> MoviesShows{
        let result:MoviesShowsDTO = try await apiClient.request(.MovieDetails(id))
        return result.toDomain()
    }
}

