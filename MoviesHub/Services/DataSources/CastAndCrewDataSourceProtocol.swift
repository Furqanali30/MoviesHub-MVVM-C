//
//  CastAndCrewDataSourceProtocol.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation
protocol CastAndCrewDataSourceProtocol {
    func fetchCastAndCrew(id:Int,mediaType:MediaType) async throws -> MovieCastMain
    func fetchPersonDetails(id: Int) async throws -> Person
}
