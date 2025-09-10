//
//  PhotoSizes+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

// MARK: - CoreDataPersistable
extension PhotoSizes: CoreDataPersistable {
  var keyMap: [PartialKeyPath<PhotoSizes>: String] {
    [
      \.small: "small",
      \.medium: "medium",
      \.large: "large",
      \.full: "full",
      \.id: "id"
    ]
  }

  typealias ManagedType = PhotoSizesEntity
}

