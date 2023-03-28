//
//  Image+Data.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 24/3/23.
//

import Foundation
import SwiftUI

extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data) {
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
