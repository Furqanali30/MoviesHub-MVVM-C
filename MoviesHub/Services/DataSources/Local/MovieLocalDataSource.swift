//
//  MoviesLocalDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
final class MovieLocalDataSource: MoviesDataSourceProtocol {
    init() {}
    
    func fetchPopularMovies() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.MoviesMockResponse8)
    }
    
    func fetchTopRatedMovies() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.MoviesMockResponse9)
    }
    
    func fetchNowPlayingMovies() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.MoviesMockResponse2)
    }
    
    func fetchUpComingMovies() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.MoviesMockResponse3)
    }
    
    func fetchMovieDetails(id: Int) async throws -> MoviesShows {
        guard let data = MockAPIs.MoviesMockResponse4.data(using: .utf8) else {
            throw LocalDataSourceError.invalidData
        }
        let dto = try JSONDecoder().decode(MoviesShowsDTO.self, from: data)
        return dto.toDomain()
    }
    
    // MARK: - Private Helpers
    private func decodeHomeListing(from json: String) throws -> HomeListing {
        guard let data = json.data(using: .utf8) else {
            throw LocalDataSourceError.invalidData
        }
        
        let dto = try JSONDecoder().decode(HomeListingDTO.self, from: data)
        return dto.toDomain()
    }
    
}
enum LocalDataSourceError: Error {
    case invalidData
    case decodingFailed
}


