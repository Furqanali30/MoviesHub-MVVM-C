//
//  FetchHomeDataUseCase.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation

protocol FetchHomeDataUseCaseProtocol {
    func fetchPopularMovies() async  -> [MoviesShows]
    func fetchTopRatedMovies() async  -> [MoviesShows]
    func fetchNowPlayingMovies() async  -> [MoviesShows]
    func fetchUpComingMovies() async  -> [MoviesShows]
    func fetchPopularTVShows() async  -> [MoviesShows]
    func fetchLatestTVShows() async  -> [MoviesShows]
}


class FetchHomeDataUseCase: FetchHomeDataUseCaseProtocol {
    private let movieRepository: MovieRepositoryProtocol
    private let tvShowsRepository: TVShowsRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol,tvShowsRepository: TVShowsRepositoryProtocol) {
        self.movieRepository = movieRepository
        self.tvShowsRepository = tvShowsRepository
    }
    
    func fetchPopularMovies() async -> [MoviesShows] {
        do {
            return try await movieRepository.fetchPopularMovies().results ?? []
        } catch {
            print("Popular movies failed:", error)
            return []
        }
    }
    
    func fetchTopRatedMovies() async -> [MoviesShows] {
        do {
            return try await movieRepository.fetchTopRatedMovies().results ?? []
        } catch {
            print("Top Rated movies failed:", error)
            return []
        }
    }
    
    func fetchNowPlayingMovies() async -> [MoviesShows] {
        do {
            return try await movieRepository.fetchNowPlayingMovies().results ?? []
        } catch {
            print("Now Playing movies failed:", error)
            return []
        }
    }
    
    func fetchUpComingMovies() async -> [MoviesShows] {
        do {
            return try await movieRepository.fetchUpComingMovies().results ?? []
        } catch {
            print("Upcoming movies failed:", error)
            return []
        }
    }
    
    func fetchPopularTVShows() async -> [MoviesShows] {
        do {
            return try await tvShowsRepository.fetchPopularTVShows().results ?? []
        } catch {
            print("Popular TV show failed:", error)
            return []
        }
    }
    
    
    func fetchLatestTVShows() async -> [MoviesShows] {
        do {
            return try await tvShowsRepository.fetchLatestTVShows().results ?? []
        } catch {
            print("Latest Tv Show failed:", error)
            return []
        }
    }
}
