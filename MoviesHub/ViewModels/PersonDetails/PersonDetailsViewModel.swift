//
//  PersonDetailsViewModel.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation

@Observable
@MainActor
class PersonDetailsViewModel{
    
    var personId:Int
    var personDetail:Person?
    var isLoading = false
    var errorMessage: String?

    private let castAndCrewRepository: CastAndCrewRepositoryProtocol
    
    init(personId:Int,castAndCrewRepository: CastAndCrewRepositoryProtocol) {
        self.personId = personId
        self.castAndCrewRepository = castAndCrewRepository
    }
    
    func populateData() async{
        isLoading = true
        defer{
            isLoading = false
        }
        
        do{
            let person = try await castAndCrewRepository.fetchPersonDetails(id: personId)
            personDetail = person
        }catch{
            print("Error in Loading Movies \(error.localizedDescription)")
        }
    }
}

