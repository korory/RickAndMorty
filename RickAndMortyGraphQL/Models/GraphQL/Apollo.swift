//
//  Apollo.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 19/3/23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
