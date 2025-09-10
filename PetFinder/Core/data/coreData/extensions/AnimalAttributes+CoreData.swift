//
//  AnimalAttributes.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

// MARK: - CoreDataPersistable
extension AnimalAttributes: CoreDataPersistable {
  var keyMap: [PartialKeyPath<AnimalAttributes>: String] {
    [
      \.spayedNeutered: "spayedNeutered",
      \.houseTrained: "houseTrained",
      \.declawed: "declawed",
      \.specialNeeds: "specialNeeds",
      \.shotsCurrent: "shotsCurrent",
      \.id: "id"
    ]
  }

  typealias ManagedType = AnimalAttributesEntity
}
