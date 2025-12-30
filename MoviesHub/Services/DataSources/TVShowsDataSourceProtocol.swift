//
//  TVShowsDataSourceProtocol.swift
//  MoviesHub
//
//  Created by MacBook Pro on 26/12/2025.
//

import Foundation

protocol TVShowsDataSourceProtocol {
    func fetchPopularTVShows() async throws -> HomeListing
    func fetchLatestTVShows() async throws -> HomeListing
    func fetchTVShowsDetails(id:Int) async throws -> MoviesShows
}
