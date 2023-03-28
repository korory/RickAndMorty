//
//  CustomCarrouselView.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import SwiftUI

struct CustomCarrouselView: View {
    
    var title: String
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                componentTitle
                
                ScrollView(.horizontal, showsIndicators: false) {
                    componentHorizontalGrid
                        .padding()
                }
                
                HStack {
                    Spacer()
                    buttonSeeAllCharacters
                }
            }
        }
    }
}

extension CustomCarrouselView {
    private var componentTitle: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.black)
            .padding(.bottom, 5)
            .padding(.leading)
            .padding(.top, 10)
    }
    
    private var buttonSeeAllCharacters: some View {
        NavigationLink(destination: CharactersListView()) {
            Text("See All")
        }
        .padding()
    }
    
    private var componentHorizontalGrid: some View {
        LazyHStack(spacing: 10) {
            ForEach(repository.characterInformationModel, id: \.id) { characterInformation in
                NavigationLink(destination: CharacterInfoView(characterId: characterInformation.id, characterInfo: [
                    "Name": characterInformation.name,
                    "Status": characterInformation.status,
                    "Specie": characterInformation.species,
                    "Gender": characterInformation.gender
                ], characterEpisodes: characterInformation.episode)) {
                    CarrouselItemView(name: characterInformation.name, status: characterInformation.status, gender: characterInformation.gender, characterId: characterInformation.id)
                }
            }
        }
    }
}

struct CustomCarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCarrouselView(title: "Title")
            .previewLayout(.sizeThatFits)
    }
}
