//
//  EpisodesModel.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 22/3/23.
//

import Foundation

// MARK: - EpisodesResponse
struct EpisodesResponse: Decodable {
  let results: [Episode]
}

// MARK: - Episode
struct Episode: Decodable {
  let id: String
  let name: String
  let episode: String
  let air_date: String?
}
