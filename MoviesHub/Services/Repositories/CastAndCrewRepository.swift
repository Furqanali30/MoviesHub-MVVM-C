//
//  CastAndCrewRepository.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

protocol CastAndCrewRepositoryProtocol {
    func fetchCastAndCrew(id:Int,mediaType:MediaType) async throws -> MovieCastMain
    func fetchPersonDetails(id: Int) async throws -> Person
}


class CastAndCrewRepository:CastAndCrewRepositoryProtocol {
    private let dataSource: CastAndCrewDataSourceProtocol
    init(dataSource: CastAndCrewDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchCastAndCrew(id:Int,mediaType:MediaType) async throws -> MovieCastMain {
        try await dataSource.fetchCastAndCrew(id: id, mediaType: mediaType)
    }
    
    func fetchPersonDetails(id: Int) async throws -> Person {
        try await dataSource.fetchPersonDetails(id: id)
    }
}
