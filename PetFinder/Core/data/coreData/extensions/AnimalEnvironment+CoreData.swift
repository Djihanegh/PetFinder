//
//  AnimalEnvironment+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

// MARK: - CoreDataPersistable
extension AnimalEnvironment: CoreDataPersistable {
  var keyMap: [PartialKeyPath<AnimalEnvironment>: String] {
    [
      \.children: "children",
      \.dogs: "dogs",
      \.cats: "cats",
      \.id: "id"
    ]
  }

  typealias ManagedType = AnimalEnvironmentEntity
}
