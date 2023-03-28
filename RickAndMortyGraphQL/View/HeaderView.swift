//
//  HeaderView.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import SwiftUI

struct HeaderView: View {
    
    var headerTitle: String = ""
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            if !headerTitle.isEmpty {
                Text("Character")
            }
            
            Text(name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerTitle: "Character", name: "Rick Sanchez")
            .previewLayout(.sizeThatFits)
    }
}
