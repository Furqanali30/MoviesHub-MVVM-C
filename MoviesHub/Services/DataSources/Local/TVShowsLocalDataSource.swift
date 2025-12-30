//
//  TVShowsLocalDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
final class TVShowsLocalDataSource: TVShowsDataSourceProtocol {
    init() {}
    
    func fetchPopularTVShows() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.TVShowsMockResponse3)
    }
    
    func fetchLatestTVShows() async throws -> HomeListing {
        try decodeHomeListing(from: MockAPIs.TVShowsMockResponse2)
    }
    
    func fetchTVShowsDetails(id: Int) async throws -> MoviesShows {
        guard let data = MockAPIs.TVShowDetail.data(using: .utf8) else {
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
