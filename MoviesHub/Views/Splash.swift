//
//  Splash.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct Splash: View {
    @Environment(NavigationManager.self) private var navManager
    var body: some View {
        ZStack{
            Image("splash")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.safeWidth)
            
            VStack{
               Text("Vimio")
                    .font(.system(size: 60,weight: .bold))
                    .frame(maxWidth: .infinity,alignment: .center)
                    .animatedGradientText(duration: 2)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                moveToNextScreen()
            })
        }
        .ignoresSafeArea()
    }
    
    func moveToNextScreen(){
        navManager.push(.Landing)
    }
}

#Preview {
    Splash()
        .environment(NavigationManager())
}
