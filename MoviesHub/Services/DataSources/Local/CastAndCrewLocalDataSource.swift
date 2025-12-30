//
//  CastAndCrewLocalDataSource.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
final class CastAndCrewLocalDataSource: CastAndCrewDataSourceProtocol {
    init() {}
    
    func fetchCastAndCrew(id: Int, mediaType: MediaType) async throws -> MovieCastMain {
        guard let data = MockAPIs.PersonMockResponse2.data(using: .utf8) else {
            throw LocalDataSourceError.invalidData
        }
        return try JSONDecoder().decode(MovieCastMain.self, from: data)
    }
    
    func fetchPersonDetails(id: Int) async throws -> Person {
        guard let data = MockAPIs.PersonMockResponse1.data(using: .utf8) else {
            throw LocalDataSourceError.invalidData
        }
        let dto = try JSONDecoder().decode(PersonDTO.self, from: data)
        return dto.toDomain()
    }
}
