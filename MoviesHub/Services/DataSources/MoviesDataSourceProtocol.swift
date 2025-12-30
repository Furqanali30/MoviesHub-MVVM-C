//
//  MoviesDataSourceProtocol.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation

protocol MoviesDataSourceProtocol {
    func fetchPopularMovies() async throws -> HomeListing
    func fetchTopRatedMovies() async throws -> HomeListing
    func fetchNowPlayingMovies() async throws -> HomeListing
    func fetchUpComingMovies() async throws -> HomeListing
    func fetchMovieDetails(id:Int) async throws -> MoviesShows
}
