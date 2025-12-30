//
//  Landing.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct Landing: View {
    @Environment(NavigationManager.self) private var navManager
    var screenWidthAlignment = UIScreen.safeWidth * 0.8
    
    var body: some View {
        ZStack{
            Image("splash")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.safeWidth)
                .ignoresSafeArea()
            
            
            VStack(spacing:20){
                Spacer()
                
                Text("Vimio")
                    .font(.system(size: 50,weight: .bold))
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.bottom,50)
                    .animatedGradientText(duration: 2)
                
                
                Text("Welcome.")
                    .font(.system(size: 30,weight: .bold))
                    .foregroundStyle(.white)
                
                
                Text("Millions of movies,TV shows and people to discover. Explore now.")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: screenWidthAlignment)
                
                Spacer()
                
                PrimaryButton(title: "Get Started") {
                    moveToNextScreen()
                }
                
            }
        }
        
    }
    
    func moveToNextScreen(){
        navManager.pushToRoot(.Home)
    }
}

#Preview {
    Landing()
        .environment( NavigationManager())
}
