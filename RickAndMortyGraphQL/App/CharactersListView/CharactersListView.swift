//
//  CharactersListView.swift
//  RickAndMortyGraphQL
//
//  Created Arnau Rivas Rivas on 20/3/23.
//  Copyright © 2023 AVANTGARDEIT. All rights reserved.
//

import SwiftUI

enum StatusFilter: String {
    case none = "None"
    case alive = "Alive"
    case unknown = "unknown"
    case dead = "Dead"
}

struct CharactersListView: View {
    
    @StateObject var viewModel = CharactersListViewModel()
    @State private var searchText = ""
    @State private var showingFilterSheet = false
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        VStack {
            Text("Filter")
                .onTapGesture {
                    showingFilterSheet = true
                }
            ScrollView(.vertical) {
                createGrid
            }
            .navigationTitle("Characters")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Character")
            .onChange(of: searchText) { newValue in
                viewModel.search(query: newValue, characterInformationModel: self.repository.characterInformationModel)
            }
            .onAppear {
                searchText = ""
                viewModel.filteredData = self.repository.characterInformationModel
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                
                Button("Alive") { viewModel.searchFilter(query: StatusFilter.alive.rawValue, characterInformationModel: self.repository.characterInformationModel) }
                
                Button("Unknown") { viewModel.searchFilter(query: StatusFilter.unknown.rawValue, characterInformationModel: self.repository.characterInformationModel) }
                
                Button("Dead") { viewModel.searchFilter(query: StatusFilter.dead.rawValue, characterInformationModel: self.repository.characterInformationModel) }
                
                Button("Reset Filter") { viewModel.searchFilter(query: StatusFilter.none.rawValue, characterInformationModel: self.repository.characterInformationModel) }
                
            } message: {
                Text("Select a filter")
            }
        }
    }
}

extension CharactersListView {
    private var createGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(viewModel.filteredData, id: \.id) { characterInformation in
                NavigationLink(destination: CharacterInfoView(
                    characterId: characterInformation.id, characterInfo: [
                        "Name": characterInformation.name,
                        "Status": characterInformation.status,
                        "Specie": characterInformation.species,
                        "Gender": characterInformation.gender
                    ], characterEpisodes: characterInformation.episode)) {
                        CarrouselItemView(name: characterInformation.name, status: characterInformation.status, gender: characterInformation.gender, characterId: characterInformation.id, width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.height / 4)
                }
            }
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
