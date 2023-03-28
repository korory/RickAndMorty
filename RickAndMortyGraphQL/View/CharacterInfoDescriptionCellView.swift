//
//  CharacterInfoDescriptionCellView.swift
//  RickAndMortyGraphQL
//
//  Created by Arnau Rivas Rivas on 20/3/23.
//

import SwiftUI

struct CharacterInfoDescriptionCellView: View {
    
    var cellTitle: String
    var cellDescription: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(cellTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 10)
                    .padding()
                    .background(.gray)
                    .foregroundColor(.white)
                
                Spacer()
                Text(cellDescription)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineLimit(2)
            }
            Divider()
        }
    }
}

struct CharacterInfoDescriptionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoDescriptionCellView(cellTitle: "Title", cellDescription: "Description")
            .previewLayout(.sizeThatFits)
    }
}
