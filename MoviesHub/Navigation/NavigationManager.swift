//
//  NavigationManager.swift
//  QrGenie
//
//  Created by MacBook Pro on 09/12/2025.
//

import Foundation
import SwiftUI


@Observable
class NavigationManager{
    var path = NavigationPath()
    var currentRoot = AppRoutes.Splash
    
    func push(_ route:AppRoutes){
        path.append(route)
    }
    func pushToRoot(_ route:AppRoutes){
        path = NavigationPath()
        path.append(route)
        currentRoot = route
    }
    func pop(){
        path.removeLast()
    }
    func popToRoot(){
        path = NavigationPath()
    }
}
