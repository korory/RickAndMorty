//
//  RickAndMortyGraphQLTests.swift
//  RickAndMortyGraphQLTests
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import XCTest
@testable import RickAndMortyGraphQL

final class RickAndMortyGraphQLTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testGetCharactersInformation() {
        let repository = Repository.shared
        
        // Comprueba que el modelo de información de personajes esté vacío antes de llamar a la función
        XCTAssertTrue(repository.characterInformationModel.isEmpty)
        
        // Llama a la función para obtener información de los personajes
        repository.getCharactersInformation()
        
        // Espera hasta que se hayan descargado los datos de los personajes
        let expectation = XCTestExpectation(description: "Characters information loaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Espera 5 segundos
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 6) // Espera hasta 6 segundos para que se cumpla la expectativa
        
        // Comprueba que se haya descargado correctamente la información de los personajes
        XCTAssertFalse(repository.characterInformationModel.isEmpty)
        XCTAssertFalse(repository.cachedImagesAlreadyDownloaded.isEmpty)
    }
    
    func testGetEpisodesInformation() {
        let repository = Repository.shared
        
        // Llama a la función para obtener información de un episodio en particular
        repository.getEpisodesInformation(id: "1")
        
        // Espera hasta que se haya descargado la información del episodio
        let expectation = XCTestExpectation(description: "Episode information loaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Espera 5 segundos
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 6) // Espera hasta 6 segundos para que se cumpla la expectativa
        
        // Comprueba que se haya descargado correctamente la información del episodio
        XCTAssertNotNil(repository.episodesInformationModel)
    }
    
    func testDownloadImages() {
        let repository = Repository.shared
        
        // Llama a la función para descargar la imagen de un personaje
        repository.downloadImages(characterId: "1", imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        
        // Espera hasta que se haya descargado la imagen
        let expectation = XCTestExpectation(description: "Image downloaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Espera 5 segundos
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 6) // Espera hasta 6 segundos para que se cumpla la expectativa
        
        // Comprueba que la imagen haya sido descargada correctamente
        XCTAssertFalse(repository.cachedImagesAlreadyDownloaded.isEmpty)
        XCTAssertNotNil(repository.cachedImagesAlreadyDownloaded["1"])
    }
}
