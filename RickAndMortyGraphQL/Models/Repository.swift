//
//  Repository.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 22/3/23.
//

import Foundation

class Repository: ObservableObject {
    
    static let shared = Repository()
    @Published var characterInformationModel: [CharactersInformationModel] = []
    @Published var episodesInformationModel: Episode?
    @Published var cachedImagesAlreadyDownloaded: [String: Data] = [:]
    
    func getCharactersInformation() {
        if self.characterInformationModel.isEmpty {
            self.getCharacters { characters in
                guard let allCharacters = characters else {
                    return
                }
                self.characterInformationModel = allCharacters
                
                self.cachedImagesAlreadyDownloaded.removeAll()
                
                for characterInformation in self.characterInformationModel {
                    self.downloadImages(characterId: characterInformation.id, imageURL: characterInformation.image)
                }
            }
        }
    }
    
    func getEpisodesInformation(id: String) {
        self.episodesInformationModel = nil
        
        self.getEpisode(id: id) { episode in
            guard let episodeInformation = episode else {
                return
            }
            self.episodesInformationModel = episodeInformation
        }
    }
    
    func downloadImages(characterId: String?, imageURL: String?) {
        
        guard let characterIdNotEmpty = characterId,
              let imageURLNotEmpty = imageURL else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            ImageDownloader.shared.downloadImage(imageURL: imageURLNotEmpty) { imageData in
                DispatchQueue.main.async {
                    self.cachedImagesAlreadyDownloaded[characterIdNotEmpty] = imageData
                }
            }
        }
    }
    
    private func getCharacters(completion: @escaping ([CharactersInformationModel]?) -> Void) {
        Network.shared.apolloClient.fetch(query: CharactersInformationMainViewQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                let model = graphQLResult.data?.characters?.decodeModel(type: CharacterResponse.self)
                completion(model?.results)
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    private func getEpisode(id: String, completion: @escaping (Episode?) -> Void) {
        Network.shared.apolloClient.fetch(query: GetEpisodeQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                let model = graphQLResult.data?.episode?.decodeModel(type: Episode.self)
                completion(model)
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
