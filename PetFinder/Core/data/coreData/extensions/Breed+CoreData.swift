//
//  Breed+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

// MARK: - CoreDataPersistable
extension Breed: CoreDataPersistable {
  var keyMap: [PartialKeyPath<Breed>: String] {
    [
      \.primary: "primary",
      \.secondary: "secondary",
      \.mixed: "mixed",
      \.unknown: "unknown",
      \.id: "id"
    ]
  }

  typealias ManagedType = BreedEntity
}

