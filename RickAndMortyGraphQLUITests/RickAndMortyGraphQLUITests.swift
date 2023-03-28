//
//  RickAndMortyGraphQLUITests.swift
//  RickAndMortyGraphQLUITests
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import XCTest
@testable import RickAndMortyGraphQL

final class RickAndMortyGraphQLUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: MainView
    func test_MainView_checkIfViewExists() throws {
        let mainView = app.scrollViews["mainView"]
        XCTAssertTrue(mainView.exists)
    }
    
    func test_MainView_checkIfSearchNavigationLinkExists() throws {
        let searchNavigationLink = app.buttons["searchNavigationLink"]
        XCTAssertTrue(searchNavigationLink.exists)
    }
    
    func test_MainView_checkIfCarrouselViewExists() throws {
        let carrousel = app.scrollViews.otherElements.matching(identifier: "carrousel").element
        XCTAssertTrue(carrousel.exists)
    }
}
