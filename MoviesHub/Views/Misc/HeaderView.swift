//
//  HeaderView.swift
//  MoviesHub
//
//  Created by MacBook Pro on 20/12/2025.
//

import SwiftUI

struct HeaderView: View {
    let navManager: NavigationManager
    var body: some View {
        //Header
        HStack(alignment:.center){
            Image(.backIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 40,height: 40)
                .padding(.bottom,15)
                .padding(.leading,20)
                .onTapGesture {
                    navManager.pop()
                }
            
            Spacer()
        }
        .frame(width: UIScreen.safeWidth)
        .background(Color._0_D_243_E)
        .overlay(alignment: .center) {
            Text("Vimio")
                .font(.system(size: 40,weight: .bold))
                .padding([.bottom], 10)
                .animatedGradientText(duration: 2)
        }
    }
}

#Preview {
    HeaderView(navManager: NavigationManager())
    
}
