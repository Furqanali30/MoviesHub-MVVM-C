//
//  Person.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let adult: Bool?
    let alsoKnownAs: [String]?
    let biography, birthday: String?
    let deathday: String?
    let gender: String?
    let homepage: String?
    let id: Int?
    let imdbID, knownForDepartment, name, placeOfBirth: String?
    let popularity: String?
    let profilePath: String?
}
