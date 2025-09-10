//
//  APIColors+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

// MARK: - CoreDataPersistable
extension APIColors: CoreDataPersistable {
  var keyMap: [PartialKeyPath<APIColors>: String] {
    [
      \.primary: "primary",
      \.secondary: "secondary",
      \.tertiary: "tertiary"
    ]
  }

  typealias ManagedType = APIColorsEntity
}

