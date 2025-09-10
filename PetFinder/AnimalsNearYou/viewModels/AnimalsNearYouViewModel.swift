//
//  AnimalsNearYouViewModel.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import Foundation

protocol AnimalsFetcher {
  func fetchAnimals(page: Int) async -> [Animal]
}

protocol AnimalStore {
  func save(animals: [Animal]) async throws
}

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
  @Published var isLoading: Bool
  @Published var hasMoreAnimals = true
  private let animalFetcher: AnimalsFetcher
  private let animalStore: AnimalStore

  private(set) var page = 1

  init(
    isLoading: Bool = true,
    animalFetcher: AnimalsFetcher,
    animalStore: AnimalStore
  ) {
    self.isLoading = isLoading
    self.animalFetcher = animalFetcher
    self.animalStore = animalStore
  }

  func fetchAnimals() async {
    isLoading = true
    let animals = await animalFetcher.fetchAnimals(page: page)
    do {
      try await animalStore.save(animals: animals)
    } catch {
      print("Error storing animals... \(error.localizedDescription)")
    }
    isLoading = false
    hasMoreAnimals = !animals.isEmpty
  }

  func fetchMoreAnimals() async {
    page += 1
    await fetchAnimals()
  }
}
