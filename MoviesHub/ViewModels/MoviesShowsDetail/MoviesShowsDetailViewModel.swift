//
//  MoviesShowsDetailViewModel.swift
//  MoviesHub
//
//  Created by MacBook Pro on 22/12/2025.
//

import Foundation

@Observable
@MainActor
class MoviesShowsDetailViewModel{
    var movieCast:[Cast] = []
    var movieDetail:MoviesShows?
    var isLoading = false
    var errorMessage: String?
    var mediaId:Int
    var mediaType:MediaType
    
    private let fetchDetailDataUseCase: FetchDetailDataUseCaseProtocol
    
    init(mediaType:MediaType,mediaId:Int, fetchDetailDataUseCase: FetchDetailDataUseCaseProtocol) {
        self.mediaType = mediaType
        self.mediaId = mediaId
        self.fetchDetailDataUseCase = fetchDetailDataUseCase
    }
    
    func populateData() async{
        isLoading = true
        defer{
            isLoading = false
        }
        
        Task{
            movieDetail = await fetchDetailDataUseCase.fetchMediaDetails(mediaType: mediaType, mediaId: mediaId)
        }
        Task{
            movieCast = await fetchDetailDataUseCase.fetchCastAndCrew(mediaType: mediaType, mediaId: mediaId)
        }
    }
}

enum MediaType{
    case MOVIE
    case TVShow
    
    
}
extension MediaType: Equatable {
    nonisolated static func == (lhs: MediaType, rhs: MediaType) -> Bool {
        switch (lhs, rhs) {
        case (.MOVIE, .MOVIE), (.TVShow, .TVShow):
            return true
        default:
            return false
        }
    }
}



