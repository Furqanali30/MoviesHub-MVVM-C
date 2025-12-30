//
//  Home.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

// MARK: - Home Main Object
struct HomeListing: Codable {
    let page: Int?
    let results: [MoviesShows]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Genre: Codable {
    let id: Int?
    let name: String?
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

struct MoviesShows: Codable,Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: String?
    let posterPath, releaseDate,releaseDataYearString, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name,firstAirDate: String?
    
    let genres: String?
    let budget: Int?
    let revenue : Int?
    let runtime,spokenLanguages: String?
    let status, tagline: String?
    
    init(){
        (
            adult, backdropPath, genreIDS, id,
            originalLanguage, originalTitle, overview, popularity,
            posterPath, releaseDate,releaseDataYearString, title, video,
            voteAverage, voteCount, name, firstAirDate,
            genres, budget, revenue, runtime,
            spokenLanguages, status, tagline
        ) = (
            nil, nil, nil, nil,
            nil, nil, nil, nil,
            nil, nil, nil,nil, nil,
            nil, nil, nil, nil,
            nil, nil, nil, nil,
            nil, nil, nil
        )
    }
    
    init(
        adult: Bool? = nil,
        backdropPath: String? = nil,
        genreIDS: [Int]? = nil,
        id: Int? = nil,
        originalLanguage: String? = nil,
        originalTitle: String? = nil,
        overview: String? = nil,
        popularity: String? = nil,
        posterPath: String? = nil,
        releaseDate: String? = nil,
        releaseDataYearString: String? = nil,
        title: String? = nil,
        video: Bool? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        name: String? = nil,
        firstAirDate: String? = nil,
        genres: String? = nil,
        budget: Int? = nil,
        revenue: Int? = nil,
        runtime: String? = nil,
        spokenLanguages: String? = nil,
        status: String? = nil,
        tagline: String? = nil
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.releaseDataYearString = releaseDataYearString
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.name = name
        self.firstAirDate = firstAirDate
        self.genres = genres
        self.budget = budget
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
    }


    
}
