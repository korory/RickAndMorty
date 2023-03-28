//
//  RickAndMortyGraphQLApp.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import SwiftUI
import Apollo

@main
struct RickAndMortyGraphQLApp: App {
    @StateObject var repository = Repository()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(repository)
        }
    }
}
