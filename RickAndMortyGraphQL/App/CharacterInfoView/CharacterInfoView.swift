//
//  CharacterInfoView.swift
//  RickAndMortyApp
//
//  Created Arnau Rivas Rivas on 18/3/23.
//  Copyright © 2023 AVANTGARDEIT. All rights reserved.
//

import SwiftUI

struct CharacterInfoView: View {
    @StateObject var viewModel = CharacterInfoViewModel()
    var characterId: String
    var characterInfo: [String: String]
    var characterEpisodes: [Episode]?
    @State private var showingSheet = false
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        NavigationView {
            ScrollView {
                imageHeaderAndBackButton
                descriptionCardInformation
            }
            .accessibilityIdentifier("characterInfoView")
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showingSheet) {
            EpisodeInfoView()
                .presentationDetents([.fraction(0.35)])
        }
    }
}

extension CharacterInfoView {
    private var imageHeaderAndBackButton: some View {
        ZStack {
            GeometryReader { reader in
                Image(uiImage: UIImage(data: repository.cachedImagesAlreadyDownloaded[characterId] ?? Data()) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .scaledToFill()
                    .offset(y: -reader.frame(in: .global).midY)
                    .frame(width: .infinity, height: reader.frame(in: .global).maxY + 200)
            }
            .padding(.bottom, 70)
        }
        .frame(height: 350)
    }
    
    private var descriptionCardInformation: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HeaderView(headerTitle: "Character", name: characterInfo["Name"] ?? "")
                .accessibilityElement()
                .accessibilityIdentifier("headerView")
            
            ForEach(characterInfo.sorted(by: >), id: \.key) { key, value in
                CharacterInfoDescriptionCellView(cellTitle: key, cellDescription: value)
                    .accessibilityElement()
                    .accessibilityIdentifier("\(key)-description")
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            if let episodes = characterEpisodes {
                HeaderView(name: "Episodes")
                    .padding(.top, 10)
                    .accessibilityElement()
                    .accessibilityIdentifier("episodeTitle")
                
                ForEach(episodes, id: \.id) { episode in
                    CharacterInfoDescriptionCellView(cellTitle: episode.episode, cellDescription: episode.name)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            repository.getEpisodesInformation(id: episode.id)
                            showingSheet.toggle()
                        }
                        .accessibilityElement()
                        .accessibilityIdentifier("episode-cell")
                }
            }
            
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(20)
        .offset(y: -35)
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(characterId: "", characterInfo: ["": ""])
    }
}
