//
//  MainView.swift
//  RickAndMortyApp
//
//  Created Arnau Rivas Rivas on 18/3/23.
//  Copyright © 2023 AVANTGARDEIT. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        NavigationStack {
            ScrollView {
                topImageAndSearchPart
                charactersList
            }
            .onAppear {
                repository.getCharactersInformation()
            }
            .ignoresSafeArea()
            .navigationViewStyle(StackNavigationViewStyle())
            .accessibilityIdentifier("mainView")
        }
    }
}

extension MainView {
    var topImageAndSearchPart: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("topImage")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .allowsHitTesting(true)
            
            goToCharactersListView
        }
        
    }
    
    private var goToCharactersListView: some View {
        NavigationLink(destination: CharactersListView()) {
            Capsule()
                .fill(Color.white)
                .overlay(
                    Text("Search")
                        .foregroundColor(.gray)
                )
                .frame(height: 40)
                .padding(.bottom, 10)
                .padding()
        }
        .accessibilityIdentifier("searchNavigationLink")
    }
    
    private var charactersList: some View {
        LazyVStack(spacing: 10) {
            ForEach(viewModel.carrouselTitles, id: \.self) { carrouselName in
                CustomCarrouselView(title: carrouselName)
            }
        }
        .accessibilityIdentifier("carrousel")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
