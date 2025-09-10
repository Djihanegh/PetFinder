//
//  AnimalStoreService.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import Foundation
import CoreData

struct AnimalStoreService {
  private let context: NSManagedObjectContext

  init(context: NSManagedObjectContext) {
    self.context = context
  }
}

// MARK: - AnimalStore
extension AnimalStoreService: AnimalStore {
  func save(animals: [Animal]) async throws {
    for var animal in animals {
      animal.toManagedObject(context: context)
    }
    try context.save()
  }
}
