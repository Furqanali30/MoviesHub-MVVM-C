//
//  PersonDTO.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation


// MARK: - Person
struct PersonDTO: Codable {
    let adult: Bool?
    let alsoKnownAs: [String]?
    let biography, birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let imdbID, knownForDepartment, name, placeOfBirth: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, deathday, gender, homepage, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
    
    // Map DTO to Domain Entity
        func toDomain() -> Person {
            Person(adult: adult,
                   alsoKnownAs: alsoKnownAs,
                   biography: biography,
                   birthday: birthday,
                   deathday: deathday,
                   gender: genderString,
                   homepage: homepage,
                   id: id,
                   imdbID: imdbID,
                   knownForDepartment: knownForDepartment,
                   name: name,
                   placeOfBirth: placeOfBirth,
                   popularity: popularityString,
                   profilePath: profilePath)
        }
    
    var popularityString: String {
        if let popularity{
            return String(format: "%.1f", popularity)
        }
        return "NA"
    }
    
    var genderString: String {
        if let gender{
            if gender == 1{
                return "Female"
            }else{
                return "Male"
            }
        }
        return "NA"
    }
}
