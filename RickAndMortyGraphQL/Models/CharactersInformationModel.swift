//
//  CharactersInformationModel.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 19/3/23.
//

import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Decodable {
  let results: [CharactersInformationModel]
}

// MARK: - CharactersInformationModel
struct CharactersInformationModel: Decodable {
    var id: String
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: String
    var episode: [Episode]
}
