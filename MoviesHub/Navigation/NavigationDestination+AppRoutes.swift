//
//  NavigationDestination+AppRoutes.swift
//  MoviesHub
//
//  Created by MacBook Pro on 30/12/2025.
//

import Foundation
import SwiftUI

extension View {
    func appNavigationDestinations(
        coordinator: AppCoordinator,
        navManager: NavigationManager
    ) -> some View {
        self.navigationDestination(for: AppRoutes.self) { route in
            switch route {

            case .Splash:
                coordinator.buildSplash()
                    .environment(navManager)
                    .toolbar(.hidden)

            case .Landing:
                coordinator.buildLanding()
                    .environment(navManager)
                    .toolbar(.hidden)

            case .Home:
                coordinator.buildHome()
                    .environment(navManager)
                    .toolbar(.hidden)

            case .CastListing(let mediaDetails, let mediaType):
                coordinator.buildCastListing(
                    mediaDetails: mediaDetails,
                    mediaType: mediaType
                )
                .environment(navManager)
                .toolbar(.hidden)

            case .MoviesShowsDetail(let mediaId, let mediaType):
                coordinator.buildMoviesShowsDetail(
                    mediaId: mediaId,
                    mediaType: mediaType
                )
                .environment(navManager)
                .toolbar(.hidden)

            case .MoviesShowsListing(let mediaType):
                coordinator.buildMoviesShowsListing(mediaType: mediaType)
                    .environment(navManager)
                    .toolbar(.hidden)

            case .PersonDetails(let personId):
                coordinator.buildPersonDetails(personId: personId)
                    .environment(navManager)
                    .toolbar(.hidden)

            case .ReviewsDetail:
                coordinator.buildLReviewDetails()
                    .environment(navManager)
                    .toolbar(.hidden)

            case .Search:
                coordinator.buildSearch()
                    .environment(navManager)
                    .toolbar(.hidden)
            }
        }
    }
}
