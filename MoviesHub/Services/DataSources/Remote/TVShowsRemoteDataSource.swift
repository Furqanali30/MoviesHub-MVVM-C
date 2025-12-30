//
//  TVRemoteDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation
// Core/Data/DataSources/Remote/TVRemoteDataSource.swift
class TVShowsRemoteDataSource:TVShowsDataSourceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPopularTVShows() async throws -> HomeListing{
        let dto: HomeListingDTO = try await apiClient.request(.PopularTVShowsOnAir)
        return dto.toDomain()
        
//        let result:HomeListing = try await apiClient.request(.PopularTVShowsOnAir)
//        return result
    }
    func fetchLatestTVShows() async throws -> HomeListing{
        let dto: HomeListingDTO = try await apiClient.request(.LatestTVShowsOnAir)
        return dto.toDomain()
        
//        let result:HomeListing = try await apiClient.request(.LatestTVShowsOnAir)
//        return result
    }
    func fetchTVShowsDetails(id:Int) async throws -> MoviesShows{
        
        let dto: MoviesShowsDTO = try await apiClient.request(.TVShowDetails(id))
        return dto.toDomain()
        
//        let result:MoviesShows = try await apiClient.request(.TVShowDetails(id))
//        return result
    }
}
