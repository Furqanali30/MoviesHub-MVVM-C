//
//  MoviesShowsDetail.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct MoviesShowsDetail: View {
    let screenAlignmentSize = UIScreen.safeWidth * 0.8
    @Environment(NavigationManager.self) private var navManager
    
    private var viewModel:MoviesShowsDetailViewModel
    
    init(viewModel:MoviesShowsDetailViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(spacing:0){
            //Header
            HeaderView(navManager: navManager)
        
            ScrollView(.vertical,showsIndicators: false){
                if viewModel.movieDetail != nil{
                    VStack(spacing:10){
                        
                        RemoteImage(path: viewModel.movieDetail?.backdropPath) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.safeWidth,height: UIScreen.safeWidth * 0.6)
                                .fullscreenImage(image: image)
                        }
                        
                        (
                            Text(viewModel.movieDetail?.name ?? "NA")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 25,weight: .semibold))
                            + Text(" (\(viewModel.movieDetail?.releaseDataYearString ?? "NA"))")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 20,weight: .regular))
                        ).padding([.leading,.trailing],5)
                        
                        
                        HStack{
                            HStack{
                                Text(viewModel.movieDetail?.popularity ?? "NA")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15,weight: .semibold))
                                    .padding(10)
                            }.gradientView()
                                .clipShape(Circle())
                            
                            Text("User Score")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 15,weight: .semibold))
                        }
                        
                        
                        VStack{
                            Text("\(viewModel.movieDetail?.releaseDate ?? "NA") | \(viewModel.movieDetail?.runtime ?? "NA")")
                                .foregroundStyle(.white)
                                .font(.system(size: 14,weight: .regular))
                            
                            
                            Text(viewModel.movieDetail?.genres ?? "NA")
                                .foregroundStyle(.white)
                                .font(.system(size: 14,weight: .regular))
                                .padding(.top,5)
                            
                        }
                        .frame(width: UIScreen.safeWidth)
                        .padding([.top,.bottom],10)
                        .background(Color._233433)
                        
                        overviewView
                        
                        VStack(alignment:.leading){
                            
                            if viewModel.movieCast.count > 0 {
                                Text("Top Billed Cast")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 20,weight: .bold))
                                    .padding(.leading,10)
                                    .padding(.top,10)
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    LazyHStack(alignment:.top){
                                        ForEach(viewModel.movieCast){item in
                                            CastCell(item: item) {
                                                if let id = item.id{
                                                    navManager.push(.PersonDetails(personId: id))
                                                }
                                            }
                                        }
                                        .padding([.leading,.trailing],10)
                                    }
                                }
                                .frame(height: 220)
                                
                                Text("Full Cast & Crew")
                                    .font(.system(size: 20,weight: .bold))
                                    .foregroundStyle(.black)
                                    .padding([.leading,.bottom],20)
                                    .underline(pattern: .solid,color: .C_4_C_4_C_4)
                                    .onTapGesture {
                                        if let movie = viewModel.movieDetail{
                                            navManager.push(.CastListing(mediaDetails: movie, mediaType: viewModel.mediaType))
                                        }
                                    }
                            }
                            
                            moviesMetaDataView
                                .padding(.top,10)
                            
                        }
                        .background(Color.FCFCFC)
                        
                    }
                }
                
            }
            .background(Color._202_F_2_F)
            
        }
        .task {
            await viewModel.populateData()
        }
    }
    
    //MARK: Overview View
    var overviewView: some View{
        VStack(alignment:.leading, spacing:10){
            Text(viewModel.movieDetail?.tagline ?? "")
                .font(.system(size: 15,weight: .regular))
                .foregroundStyle(.C_4_C_4_C_4)
         
            Text("Overview")
                .font(.system(size: 20,weight: .bold))
                .foregroundStyle(.white)
            
            Text(viewModel.movieDetail?.overview ?? "NA")
                .font(.system(size: 15,weight: .regular))
                .foregroundStyle(.white)
               
        }
        .padding([.leading,.trailing,.bottom],20)
        .frame(width: UIScreen.safeWidth,alignment: .leading)
    }
    
    //MARK: Meta Data View
    var moviesMetaDataView:some View{
        VStack(alignment:.leading,spacing: 5){
            
            MoviesMetaData(text: "Status", font: 15, fontWeight: .bold)
            MoviesMetaData(text: viewModel.movieDetail?.status ?? "", font: 15, fontWeight: .regular)
            MoviesMetaData(text: "Original Language", font: 15, fontWeight: .bold)
               .padding(.top,20)
            MoviesMetaData(text: viewModel.movieDetail?.spokenLanguages ?? "", font: 15, fontWeight: .regular)
            MoviesMetaData(text: "Budget", font: 15, fontWeight: .bold)
                .padding(.top,20)
            MoviesMetaData(text: "$\(viewModel.movieDetail?.budget ?? 0)", font: 15, fontWeight: .regular)
            MoviesMetaData(text: "Revenue", font: 15, fontWeight: .bold)
                .padding(.top,20)
            MoviesMetaData(text: "$\(viewModel.movieDetail?.revenue ?? 0)", font: 15, fontWeight: .regular)
                
        }
        .padding(.bottom,20)
        .padding(.leading,20)
        .frame(width: UIScreen.safeWidth ,alignment: .leading)
    }
    
    struct MoviesMetaData:View {
        let text:String
        let font:CGFloat
        let fontWeight:Font.Weight
        
        
        var body: some View {
            Text(text)
                .foregroundStyle(.black)
                .font(.system(size: font,weight: fontWeight))
        }
    }
}

#Preview {
    MoviesShowsDetail(viewModel: DependencyContainer().makeMoviesShowsDetailViewModel(mediaId: 123, mediaType: .MOVIE))
        .environment(NavigationManager())
}
