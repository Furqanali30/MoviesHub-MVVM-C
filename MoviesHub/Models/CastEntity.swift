//
//  Cast.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

// MARK: - Cast Main Objecg
struct MovieCastMain: Codable {
    let id: Int?
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable,Identifiable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: Department?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let department: String?
    let job: String?
  

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
    
    init(){
        (
            adult, gender, id, knownForDepartment,
            name, originalName, popularity, profilePath,
            castID, character, creditID, order,
            department, job
        ) = (
            nil, nil, nil, nil,
            nil, nil, nil, nil,
            nil, nil, nil, nil,
            nil, nil
        )
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
    case lighting = "Lighting"
}
