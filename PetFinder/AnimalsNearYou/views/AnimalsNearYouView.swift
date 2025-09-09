//
//  AnimalsNearYouView.swift
//  PetFinder
//
//  Created by MAC on 9/9/2025.
//

import SwiftUI

struct AnimalsNearYouView: View {
  @State var animals: [Animal] = []
  @State var isLoading = true
  private let requestManager = RequestManager()

  var body: some View {
    NavigationView {
      List {
        ForEach(animals) { animal in
          AnimalRow(animal: animal)
        }
      }
      .task {
        await fetchAnimals()
      }
      .listStyle(.plain)
      .navigationTitle("Animals near you")
      .overlay {
        if isLoading {
          ProgressView("Finding Animals near you...")
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }

  func fetchAnimals() async {
    do {
      let animalsContainer: AnimalsContainer = try await requestManager.perform(AnimalsRequest.getAnimalsWith(
        page: 1,
        latitude: nil,
        longitude: nil))
      let animals = animalsContainer.animals
      self.animals = animals
      await stopLoading()
    } catch {
    }
  }

  @MainActor
  func stopLoading() async {
    isLoading = false
  }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
  static var previews: some View {
      AnimalsNearYouView(animals: Animal.mock, isLoading: false)
  }
}
