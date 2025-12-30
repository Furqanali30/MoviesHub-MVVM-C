//
//  CastListing.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct CastListing: View {
    @Environment(NavigationManager.self) private var navManager
    let screenAlignmentSize = UIScreen.safeWidth * 0.9
    
   private var viewModel:CastViewModel
    init(viewModel:CastViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:0){
            //Header
            HeaderView(navManager: navManager)
            
            //Banner
            HStack{
                RemoteImage(path: viewModel.mediaDetails.posterPath) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height: 120)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
                
                
                VStack(alignment:.leading,spacing: 0){
                    Text(viewModel.mediaDetails.name ?? "NA")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20,weight: .semibold))
                    
                    + Text(" (\(viewModel.mediaDetails.releaseDataYearString ?? "NA"))")
                        .foregroundStyle(Color.C_4_C_4_C_4)
                        .font(.system(size: 17,weight: .regular))
                    
                    Text(viewModel.mediaDetails.tagline ?? "NA")
                        .foregroundStyle(Color.C_4_C_4_C_4)
                        .font(.system(size: 16,weight: .regular))
                        .padding(.top,5)
                }
                .padding([.trailing],10)
                Spacer()
            }
            .frame(width: UIScreen.safeWidth)
            .background(Color._233433)
            
            //Cast & Crew
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment:.leading){
                    if viewModel.movieCast.count > 0{
                        sectionHeader(title: "Cast", count: viewModel.movieCast.count)
                        castListView(list: viewModel.movieCast)
                            .padding(.bottom,20)
                    }
                    if viewModel.movieCrew.count > 0{
                        sectionHeader(title: "Crew", count: viewModel.movieCrew.count)
                        castListView(list: viewModel.movieCrew)
                    }
                }
                .frame(width: screenAlignmentSize,alignment: .leading)
                .padding([.top,.bottom],10)
                
                Spacer()
                
            }
        }.task {
            await viewModel.populateCastAndCrewData()
        }
    }
    
    // section header
    private func sectionHeader(title: String, count: Int) -> some View {
        Text(title)
            .foregroundStyle(Color.black)
            .font(.system(size: 18, weight: .semibold))
        + Text(" \(count)")
            .foregroundStyle(Color._676767)
            .font(.system(size: 17, weight: .regular))
    }
    
    private func castListView(list:[Cast]) -> some View{
        
        LazyVStack(spacing: 10){
            ForEach(list){item in
                CastListingCell(item: item) {
                    if let id = item.id{
                        navManager.push(.PersonDetails(personId: id))
                    }
                }
            }
        }
    }
}

#Preview {
    CastListing(viewModel: DependencyContainer().makeCastViewModel(mediaDetails: MoviesShows(), mediaType: .MOVIE))
        .environment(NavigationManager())
}
