//
//  LoadImageFromURL.swift
//  MoviesHub
//
//  Created by MacBook Pro on 19/12/2025.
//

import Foundation
import SwiftUI


struct LoadImageFromURL: View {
    let path: String
    
    init(path: String,failCaseImage:String? = nil) {
        self.path = path
    }
    
    var body: some View {
        if let url = URL(string: path){
            AsyncImage(url: url){phase in
                switch (phase){
                case .success(let image):
                    return image
                default:
                    return Image(.appIconWithoutName)
                }
            }
        }else{
            return Image(.appIconWithoutName)
        }
        return Image(.appIconWithoutName)
    }
    
}
