//
//  CarrouselItemView.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import SwiftUI

struct CarrouselItemView: View {
    
    var name: String
    var status: String
    var gender: String
    var characterId: String
    
    var width: CGFloat = 250
    var height: CGFloat = 250
    
    @EnvironmentObject var repository: Repository
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black)
                .frame(width: width, height: height)
            
            ZStack(alignment: .bottomLeading) {
                componentImage
                componentText
            }
        }
    }
}

extension CarrouselItemView {
    private var componentImage: some View {
        ZStack {
            Blur(style: .light)
                .frame(width: width, height: height)
                .cornerRadius(15)
            
            Image(uiImage: UIImage(data: repository.cachedImagesAlreadyDownloaded[characterId] ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
                .scaledToFill()
                .cornerRadius(15)
                .frame(width: width, height: height)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom))
        }
    }
    
    private var componentText: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .modifier(CustomModifierTextCarrouselCell())
            Text(status)
                .modifier(CustomModifierTextCarrouselCell())
            Text(gender)
                .modifier(CustomModifierTextCarrouselCell())
        }
        .padding()
    }
}

struct CarrouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarrouselItemView(name: "Rick Sanchez", status: "Alive", gender: "Human", characterId: "1")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
