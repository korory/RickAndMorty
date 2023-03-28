//
//  CustomModifierTextCarrouselCell.swift
//  RickAndMortyApp
//
//  Created by Arnau Rivas Rivas on 18/3/23.
//

import Foundation
import SwiftUI

struct CustomModifierTextCarrouselCell: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 20))
            .foregroundColor(.white)
    }
    
}
