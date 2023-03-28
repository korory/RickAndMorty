//
//  EpisodeInfoView.swift
//  RickAndMortyGraphQL
//
//  Created Arnau Rivas Rivas on 22/3/23.
//  Copyright © 2023 AVANTGARDEIT. All rights reserved.
//

import SwiftUI

struct EpisodeInfoView: View {
    @StateObject var viewModel = EpisodeInfoViewModel()
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        ScrollView(.vertical) {
            
            HeaderView(name: "Episode Information")
                .padding(.top, 20)
                .frame(alignment: .leading)
            
            episodeInformationList
                .padding()
            
            Spacer()
        }
    }
}

extension EpisodeInfoView {
    private var episodeInformationList: some View {
        VStack {
            CharacterInfoDescriptionCellView(cellTitle: "Name", cellDescription: repository.episodesInformationModel?.name ?? "")
            CharacterInfoDescriptionCellView(cellTitle: "Air Date", cellDescription: repository.episodesInformationModel?.air_date ?? "")
            CharacterInfoDescriptionCellView(cellTitle: "Episode", cellDescription: repository.episodesInformationModel?.episode ?? "")
        }
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeInfoView()
    }
}
