//
//  MoviesRepository.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchPopularMovies() async throws -> HomeListing
    func fetchTopRatedMovies() async throws -> HomeListing
    func fetchNowPlayingMovies() async throws -> HomeListing
    func fetchUpComingMovies() async throws -> HomeListing
    func fetchMovieDetails(id:Int) async throws -> MoviesShows
}

class MovieRepository:MovieRepositoryProtocol {
    private let dataSource: MoviesDataSourceProtocol
    
    init(dataSource: MoviesDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchPopularMovies() async throws -> HomeListing {
        try await dataSource.fetchPopularMovies()
    }
    
    func fetchTopRatedMovies() async throws -> HomeListing {
        try await dataSource.fetchTopRatedMovies()
    }
    
    func fetchNowPlayingMovies() async throws -> HomeListing {
        try await dataSource.fetchNowPlayingMovies()
    }
    
    func fetchUpComingMovies() async throws -> HomeListing {
        try await dataSource.fetchUpComingMovies()
    }
    
    func fetchMovieDetails(id: Int) async throws -> MoviesShows {
        try await dataSource.fetchMovieDetails(id: id)
    }
}
