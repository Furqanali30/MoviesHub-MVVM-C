//
//  DepedencyContainer.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation

// Infrastructure/DependencyInjection/DependencyContainer.swift
class DependencyContainer {
    // Network
    lazy var apiClient = APIClient()
    
    // Remote Data Sources
    lazy var movieRemoteDataSource = MovieRemoteDataSource(apiClient: apiClient)
    lazy var tvShowsRemoteDataSource = TVShowsRemoteDataSource(apiClient: apiClient)
    lazy var castAndCrewRemoteDataSource = CastAndCrewRemoteDataSource(apiClient: apiClient)
    // Local Data Sources
    lazy var movieLocalDataSource = MovieLocalDataSource()
    lazy var tvShowsLocalDataSource = TVShowsLocalDataSource()
    lazy var castAndCrewLocalDataSource = CastAndCrewLocalDataSource()
    
    // Repositories
    lazy var movieRepository: MovieRepositoryProtocol = MovieRepository(dataSource: APIConstants.isLocalDataSource ? movieLocalDataSource : movieRemoteDataSource)
    lazy var tvShowsRepository: TVShowsRepositoryProtocol = TVShowRepository(dataSource: APIConstants.isLocalDataSource ? tvShowsLocalDataSource : tvShowsRemoteDataSource)
    lazy var castAndCrewRepository: CastAndCrewRepositoryProtocol = CastAndCrewRepository(dataSource: APIConstants.isLocalDataSource ? castAndCrewLocalDataSource : castAndCrewRemoteDataSource)
    
    // Use Cases
    lazy var fetchHomeDataUseCase: FetchHomeDataUseCaseProtocol = FetchHomeDataUseCase(movieRepository: movieRepository, tvShowsRepository: tvShowsRepository)
    lazy var fetchMovieTVShowsListingUseCase: FetchMovieTVShowsListingUseCaseProtocol = FetchMovieTVShowsListingUseCase(movieRepository: movieRepository, tvShowRepository: tvShowsRepository)
    lazy var fetchDetailDataUseCase: FetchDetailDataUseCaseProtocol = FetchDetailDataUseCase(movieRepository: movieRepository, tvShowsRepository: tvShowsRepository, castAndCrewRepository: castAndCrewRepository)
    
    
    // ViewModels
    func makeHomeViewModel() -> HomeViewModel {
       HomeViewModel(fetchHomeDataUseCase: fetchHomeDataUseCase)
    }
    func makeCastViewModel(mediaDetails: MoviesShows,mediaType:MediaType) -> CastViewModel {
        CastViewModel(mediaDetails: mediaDetails, mediaType: mediaType, castAndCrewRepository: castAndCrewRepository)
    }
    func makeMoviesShowsDetailViewModel(mediaId:Int,mediaType:MediaType) -> MoviesShowsDetailViewModel {
        MoviesShowsDetailViewModel(mediaType: mediaType, mediaId: mediaId, fetchDetailDataUseCase: fetchDetailDataUseCase)
    }
    func makeMoviesShowsListingViewModel(mediaType:MediaType) -> MoviesShowsListingViewModel {
        MoviesShowsListingViewModel(mediaType: mediaType, fetchMovieTVShowsListingUseCase: fetchMovieTVShowsListingUseCase)
    }
    func makePersonDetailsViewModel(personId:Int) -> PersonDetailsViewModel {
        PersonDetailsViewModel(personId: personId, castAndCrewRepository: castAndCrewRepository)
    }
}

