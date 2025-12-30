//
//  PersonDetails.swift
//  MoviesHub
//
//  Created by MacBook Pro on 17/12/2025.
//

import SwiftUI

struct PersonDetails: View {
    @Environment(NavigationManager.self) private var navManager
    private var viewModel:PersonDetailsViewModel
    
    init(viewModel:PersonDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            //header
            HeaderView(navManager: navManager)
            
            if  viewModel.personDetail != nil{
                ScrollView(.vertical,showsIndicators: false){
                    
                    RemoteImage(path: viewModel.personDetail?.profilePath) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .fullscreenImage(image: image)
                    }
                    
                    InfoView(text: viewModel.personDetail?.name ?? "NA", font: 25, fontWeight: .bold)
                    
                    
                    VStack(alignment: .leading,spacing: 10){
                        
                        InfoView(text: "Personal Info", font: 20, fontWeight: .bold)
                            .padding([.top,.bottom],10)
                        
                        HStack{
                            
                            VStack(alignment:.leading,spacing: 0){
                                
                                InfoView(text: "Known For", font: 15, fontWeight: .bold)
                                InfoView(text: viewModel.personDetail?.knownForDepartment ?? "NA", font: 15, fontWeight: .regular)
                                    .padding([.top,.bottom],5)
                            }
                            
                            Spacer()
                            
                            VStack(alignment:.leading,spacing: 0){
                                InfoView(text: "Known Credit", font: 15, fontWeight: .bold)
                                InfoView(text: viewModel.personDetail?.popularity ?? "NA", font: 15, fontWeight: .regular)
                                    .padding([.top,.bottom],5)
                            }
                        }
                        
                        HStack{
                            VStack(alignment:.leading,spacing: 0){
                                InfoView(text: "Gender", font: 15, fontWeight: .bold)
                                InfoView(text: viewModel.personDetail?.gender ?? "NA", font: 15, fontWeight: .regular)
                                    .padding([.top,.bottom],5)
                            }
                            Spacer()
                        }
                        .padding([.top,.bottom],10)
                        
                        HStack{
                            VStack(alignment:.leading,spacing: 0){
                                InfoView(text: "Birthdate", font: 15, fontWeight: .bold)
                                InfoView(text: viewModel.personDetail?.birthday ?? "NA", font: 15, fontWeight: .regular)
                                    .padding([.top,.bottom],5)
                            }
                            Spacer()
                        }
                        .padding([.top,.bottom],10)
                        
                        HStack{
                            VStack(alignment:.leading,spacing: 0){
                                InfoView(text: "Place of Birth", font: 15, fontWeight: .bold)
                                InfoView(text: viewModel.personDetail?.placeOfBirth ?? "NA", font: 15, fontWeight: .regular)
                                    .padding([.top,.bottom],5)
                            }
                            Spacer()
                        }
                        .padding([.top,.bottom],10)
                        
                        
                        InfoView(text: "Biography", font: 20, fontWeight: .bold)
                            .frame(width: .infinity,alignment: .leading)
                            .padding([.top],10)
                            .padding(.bottom,5)
                        
                        InfoView(text: viewModel.personDetail?.biography ?? "NA", font: 15, fontWeight: .regular)
                            .lineSpacing(4)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding([.leading,.trailing],20)
                    
                }
            }
            Spacer()
        }
        .task {
            await viewModel.populateData()
        }
    }
    
    struct InfoView : View{
        let text:String
        let font: CGFloat
        let fontWeight:Font.Weight
        
        var body: some View {
                Text(text)
                    .foregroundStyle(.black)
                    .font(.system(size: font, weight: fontWeight))
            }
    }
}

#Preview {
    PersonDetails(viewModel: DependencyContainer().makePersonDetailsViewModel(personId: 123))
        .environment(NavigationManager())
}
