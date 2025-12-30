//
//  CastViewModel.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation
import SwiftUI

@Observable
@MainActor
class CastViewModel{
    
    var movieCast:[Cast] = []
    var movieCrew:[Cast] = []
    var mediaDetails:MoviesShows
    var mediaType:MediaType
    var isLoading = false
    var errorMessage: String?
    
    private let castAndCrewRepository: CastAndCrewRepositoryProtocol
    
    init(mediaDetails: MoviesShows,mediaType:MediaType,castAndCrewRepository: CastAndCrewRepositoryProtocol) {
        self.mediaDetails = mediaDetails
        self.mediaType = mediaType
        self.castAndCrewRepository = castAndCrewRepository
    }
    
    func populateCastAndCrewData() async{
        isLoading = true
        defer{
            isLoading = false
        }
        
        do{
            if let id = mediaDetails.id{
                let castAndCrew = try await castAndCrewRepository.fetchCastAndCrew(id: id, mediaType: mediaType)
                movieCast = castAndCrew.cast ?? []
                movieCrew = castAndCrew.crew ?? []
            }
        }catch{
            print("Error in Loading Movies \(error.localizedDescription)")
        }
    }
}







