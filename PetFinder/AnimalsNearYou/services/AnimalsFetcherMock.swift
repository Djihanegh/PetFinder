//
//  AnimalsFetcher.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import Foundation

struct AnimalsFetcherMock: AnimalsFetcher {
  func fetchAnimals(page: Int) async -> [Animal] {
    Animal.mock
  }
}
