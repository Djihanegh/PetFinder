//
//  AnimalDetailsView.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import SwiftUI

struct AnimalDetailsView: View {
  var body: some View {
    Text("TODO: Animal Details")
  }
}

struct AnimalsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AnimalDetailsView()
    }
    .previewLayout(.sizeThatFits)
    .previewDisplayName("iPhone SE (2nd generation)")

    NavigationView {
      AnimalDetailsView()
    }
    .previewDevice("iPhone 12 Pro")
    .previewDisplayName("iPhone 12 Pro")
  }
}
