//
//  Endpoints.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation


// Infrastructure/Network/Endpoint.swift
enum Endpoint {
    case NowPlayingMovies
    case UpcomingMovies
    case PopularMovies
    case TopRatedMovies
    case MovieDetails(Int)
    case MoviesCastAndCrew(Int)
    case TVShowsCastAndCrew(Int)
    case LatestTVShowsOnAir
    case PopularTVShowsOnAir
    case TVShowDetails(Int)
    case Search(String)
    case PersonDetails(Int)
    
    
    var url: URL {
        switch self {
      
        case .NowPlayingMovies:
            return URL(string: "\(APIConstants.baseURL)/movie/now_playing?api_key=\(APIConstants.apiKey)&page=1")!
        case .UpcomingMovies:
            return URL(string: "\(APIConstants.baseURL)/movie/upcoming?api_key=\(APIConstants.apiKey)&page=1")!
        case .PopularMovies:
            return URL(string: "\(APIConstants.baseURL)/movie/popular?api_key=\(APIConstants.apiKey)&page=1")!
        case .TopRatedMovies:
            return URL(string: "\(APIConstants.baseURL)/movie/top_rated?api_key=\(APIConstants.apiKey)&page=1")!
        case .MovieDetails(let id):
            return URL(string: "\(APIConstants.baseURL)/movie/\(id)?api_key=\(APIConstants.apiKey)&page=1")!
        case .MoviesCastAndCrew(let id):
            return URL(string: "\(APIConstants.baseURL)/movie/\(id)/credits?api_key=\(APIConstants.apiKey)")!
        case .TVShowsCastAndCrew(let id):
            return URL(string: "\(APIConstants.baseURL)/tv/\(id)/credits?api_key=\(APIConstants.apiKey)")!
        case .LatestTVShowsOnAir:
            return URL(string: "\(APIConstants.baseURL)/tv/on_the_air?api_key=\(APIConstants.apiKey)&page=1")!
        case .PopularTVShowsOnAir:
            return URL(string: "\(APIConstants.baseURL)/tv/popular?api_key=\(APIConstants.apiKey)&page=1")!
        case .TVShowDetails(let id):
            return URL(string: "\(APIConstants.baseURL)/tv/\(id)?api_key=\(APIConstants.apiKey)")!
        case .Search(let input):
            return URL(string: "\(APIConstants.baseURL)/search/multi?query=\(input)&api_key=\(APIConstants.apiKey)&page=1")!
        case .PersonDetails(let id):
            return URL(string: "\(APIConstants.baseURL)/person/\(id)?api_key=\(APIConstants.apiKey)")!
        }
    }
}
