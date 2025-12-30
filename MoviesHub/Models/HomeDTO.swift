//
//  HomeDTO.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation


// MARK: - Home Main Object
struct HomeListingDTO: Codable {
    let page: Int?
    let results: [MoviesShowsDTO]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    // Map DTO to Domain Entity
    func toDomain() -> HomeListing {
        let results: [MoviesShows] = self.results?.map { $0.toDomain() } ?? []
        return HomeListing(page: page,
                           results: results,
                           totalPages: totalPages,
                           totalResults: totalResults)
    }
}

struct MoviesShowsDTO: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name,firstAirDate: String?
    
    let genres: [Genre]?
    let budget: Int?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline: String?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name = "name"
        case firstAirDate = "first_air_date"
        case status, tagline,revenue, runtime,budget, genres
        case spokenLanguages = "spoken_languages"
    }
    
    //    init(){
    //        (
    //            adult, backdropPath, genreIDS, id,
    //            originalLanguage, originalTitle, overview, popularity,
    //            posterPath, releaseDate, title, video,
    //            voteAverage, voteCount, name, firstAirDate,
    //            genres, budget, revenue, runtime,
    //            spokenLanguages, status, tagline
    //        ) = (
    //            nil, nil, nil, nil,
    //            nil, nil, nil, nil,
    //            nil, nil, nil, nil,
    //            nil, nil, nil, nil,
    //            nil, nil, nil, nil,
    //            nil, nil, nil
    //        )
    //    }
    
    
    // Map DTO to Domain Entity
    func toDomain() -> MoviesShows {
        print("")
        return MoviesShows(adult: adult,
                    backdropPath: backdropPath,
                    genreIDS: genreIDS,
                    id: id,
                    originalLanguage: originalLanguage,
                    originalTitle: originalTitle,
                    overview: overview,
                    popularity: popularityString,
                    posterPath: posterPath,
                    releaseDate: releaseDataString,
                    releaseDataYearString: releaseDataYearString,
                    title: title,
                    video: video,
                    voteAverage: voteAverage,
                    voteCount: voteCount,
                    name: nameString,
                    firstAirDate: firstAirDate,
                    genres: genresString,
                    budget: budget,
                    revenue: revenue,
                    runtime: runtimeString,
                    spokenLanguages: spokenLanguageString,
                    status: status,
                    tagline: tagline)
    }
    
    //Movies & TV Shows have different variables
    var nameString:String{
        title ?? name ?? "NA"
    }
    
    var popularityString: String {
        if let voteAverage{
            return String(format: "%.1f", voteAverage)
        }
        return "NR"
    }
    
    //Movies & TV Shows have different variables
    var releaseDataString:String{
        if let releaseDate{
            return releaseDate.toDate(withFormat: "yyyy-MM-dd")?.toString(format: "MMM d, yyyy") ?? ""
        }
        if let firstAirDate{
            return firstAirDate.toDate(withFormat: "yyyy-MM-dd")?.toString(format: "MMM d, yyyy") ?? ""
        }
        return "NA"
    }
    
    var releaseDataYearString:String{
        if let releaseDate{
            return releaseDate.toDate(withFormat: "yyyy-MM-dd")?.toString(format: "yyyy") ?? ""
        }
        if let firstAirDate{
            return firstAirDate.toDate(withFormat: "yyyy-MM-dd")?.toString(format: "yyyy") ?? ""
        }
        return "NA"
    }
    
    var spokenLanguageString:String{
        if let spokenLanguages{
            return spokenLanguages.map({$0.name ?? ""}).joined(separator: ", ")
        }
        return "NA"
    }
    
    var genresString:String{
        if let genres{
            return genres.map({$0.name ?? ""}).joined(separator: ", ")
        }
        return "NA"
    }
    
    var runtimeString:String{
        if let runtime{
            let hours = runtime / 60
            let minutes = runtime % 60
            
            if hours > 0 {
                return "\(hours)h \(minutes)m"
            } else {
                return "\(minutes)m"
            }
        }
        return "NA"
    }
    
}
