//
//  AppCoordinator.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation
import SwiftUI

final class AppCoordinator{
    private let container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func buildSplash() -> some View {
        Splash()
    }
    func buildLanding() -> some View {
        Landing()
    }
    func buildHome() -> some View {
        Home(viewModel: container.makeHomeViewModel())
    }
    func buildCastListing(mediaDetails:MoviesShows,mediaType:MediaType) -> some View {
        CastListing(viewModel: container.makeCastViewModel(mediaDetails: mediaDetails, mediaType: mediaType))
    }
    func buildMoviesShowsDetail(mediaId:Int,mediaType:MediaType) -> some View {
        MoviesShowsDetail(viewModel: container.makeMoviesShowsDetailViewModel(mediaId: mediaId, mediaType: mediaType))
    }
    func buildMoviesShowsListing(mediaType:MediaType) -> some View {
        MoviesShowsListing(viewModel: container.makeMoviesShowsListingViewModel(mediaType: mediaType))
    }
    func buildPersonDetails(personId:Int) -> some View {
        PersonDetails(viewModel: container.makePersonDetailsViewModel(personId: personId))
    }
    func buildLReviewDetails() -> some View {
        ReviewsDetail()
    }
    func buildSearch() -> some View {
        Search()
    }
}
