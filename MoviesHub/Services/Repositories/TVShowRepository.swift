//
//  TVShowRepository.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

protocol TVShowsRepositoryProtocol {
    func fetchPopularTVShows() async throws -> HomeListing
    func fetchLatestTVShows() async throws -> HomeListing
    func fetchTVShowsDetails(id:Int) async throws -> MoviesShows
}

class TVShowRepository: TVShowsRepositoryProtocol {
    private let dataSource: TVShowsDataSourceProtocol
    
    init(dataSource: TVShowsDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchPopularTVShows() async throws -> HomeListing {
        try await dataSource.fetchPopularTVShows()
    }
    
    func fetchLatestTVShows() async throws -> HomeListing {
        try await dataSource.fetchLatestTVShows()
    }
    
    func fetchTVShowsDetails(id: Int) async throws -> MoviesShows {
        try await dataSource.fetchTVShowsDetails(id: id)
    }
}
