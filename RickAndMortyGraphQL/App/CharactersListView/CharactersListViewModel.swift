//
//  CharactersListViewModel.swift
//  RickAndMortyGraphQL
//
//  Created Arnau Rivas Rivas on 20/3/23.
//  Copyright © 2023 AVANTGARDEIT. All rights reserved.
//

import Foundation
import Combine

class CharactersListViewModel: ObservableObject {
    
    @Published var filteredData: [CharactersInformationModel] = []
    
    func search(query: String = "", characterInformationModel: [CharactersInformationModel]) {
        filteredData = query.isEmpty ? characterInformationModel : characterInformationModel.filter { $0.name.contains(query) }
    }
    
    func searchFilter(query: String = "", characterInformationModel: [CharactersInformationModel]) {
        if query != StatusFilter.none.rawValue {
            filteredData = query.isEmpty ? characterInformationModel : characterInformationModel.filter { $0.status.contains(query) }
        } else {
            filteredData = characterInformationModel
        }
    }
}
