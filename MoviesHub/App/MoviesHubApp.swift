//
//  MoviesHubApp.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

@main
struct MoviesHubApp: App {
    @State var navManager = NavigationManager()
    let coordinator = AppCoordinator(container: DependencyContainer())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navManager.path) {
                Group{
                    if navManager.currentRoot == .Splash{
                        coordinator.buildSplash()
                    }else{
                        coordinator.buildHome()
                    }
                }
                .environment(navManager)
                .appNavigationDestinations(
                    coordinator: coordinator,
                    navManager: navManager
                )
            }
            .toast()
        }
    }
}
