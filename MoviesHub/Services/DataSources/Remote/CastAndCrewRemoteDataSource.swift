//
//  CastAndCrewRemoteDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation
// Core/Data/DataSources/Remote/CastAndCrewRemoteDataSource.swift

class CastAndCrewRemoteDataSource:CastAndCrewDataSourceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchCastAndCrew(id:Int,mediaType:MediaType) async throws -> MovieCastMain{
        if mediaType == .MOVIE{
            let result:MovieCastMain = try await apiClient.request(.MoviesCastAndCrew(id))
            return result
        }else{
            let result:MovieCastMain = try await apiClient.request(.TVShowsCastAndCrew(id))
            return result
        }
    }
    func fetchPersonDetails(id:Int) async throws -> Person{
        let result:PersonDTO = try await apiClient.request(.PersonDetails(id))
        return result.toDomain()
    }
}
