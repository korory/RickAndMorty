//
//  ImageDownloader.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import Foundation

final class ImageDownloader {
  
  static let shared = ImageDownloader()
  
  private var cachedImagesAlreadyDownloaded: [String: Data]
  
  private init() {
    cachedImagesAlreadyDownloaded = [:]
  }
  
  func downloadImage(imageURL: String?, completionHandler: @escaping (Data) -> Void) {
    
    guard let secureImageUrl = imageURL,
          let url = URL(string: secureImageUrl) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard let imageData = data else { return }
      
      completionHandler(imageData)
      
    }.resume()
  }
}
