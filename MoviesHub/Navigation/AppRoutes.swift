//
//  AppRoutes.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

enum AppRoutes:Hashable{
    case Splash
    case Landing
    case Home
    case CastListing(mediaDetails:MoviesShows,mediaType:MediaType)
    case MoviesShowsDetail(mediaId:Int,mediaType:MediaType)
    case MoviesShowsListing(mediaType:MediaType)
    case PersonDetails(personId:Int)
    case ReviewsDetail
    case Search
}

extension AppRoutes: Equatable {
    static func == (lhs: AppRoutes, rhs: AppRoutes) -> Bool {
        switch (lhs, rhs) {

        case (.Splash, .Splash),
             (.Landing, .Landing),
             (.Home, .Home),
             (.ReviewsDetail, .ReviewsDetail),
             (.Search, .Search):
            return true

        case (.MoviesShowsDetail(let l, _), .MoviesShowsDetail(let r, _)):
            return l == r // Int parameter so simple comparison

        case (.MoviesShowsListing(let l), .MoviesShowsListing(let r)):
            return l == r // Int parameter so simple comparison

        case (.PersonDetails(let l), .PersonDetails(let r)):
            return l == r // Int parameter so simple comparison

        case (.CastListing(let l,_), .CastListing(let r,_)):
            return l.id == r.id   // 🔑 object comparison by ID

        default:
            return false
        }
    }
}


extension AppRoutes {
    func hash(into hasher: inout Hasher) {
        switch self {

        case .Splash:
            hasher.combine("Splash")

        case .Landing:
            hasher.combine("Landing")

        case .Home:
            hasher.combine("Home")

        case .ReviewsDetail:
            hasher.combine("ReviewsDetail")

        case .Search:
            hasher.combine("Search")

        case .MoviesShowsDetail(let id,_):
            hasher.combine("MoviesShowsDetail")
            hasher.combine(id)

        case .MoviesShowsListing(let isMovies):
            hasher.combine("MoviesShowsListing")
            hasher.combine(isMovies)

        case .PersonDetails(let id):
            hasher.combine("PersonDetails")
            hasher.combine(id)

        case .CastListing(let media,_):
            hasher.combine("CastListing")
            hasher.combine(media.id ?? -1)
        }
    }
}

