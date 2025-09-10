//
//  User+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

// MARK: - CoreDataPersistable
extension User: CoreDataPersistable {
  var keyMap: [PartialKeyPath<User>: String] {
    [
      \.name: "name",
      \.password: "password",
      \.extra: "extra",
      \.id: "id"
    ]
  }
  typealias ManagedType = UserEntity
}

