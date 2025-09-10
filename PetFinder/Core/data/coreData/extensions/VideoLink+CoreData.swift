//
//  VideoLink+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

extension VideoLink: CoreDataPersistable {
  var keyMap: [PartialKeyPath<VideoLink>: String] {
    [
      \.embedded: "embedded",
      \.id: "id"
    ]
  }

  typealias ManagedType = VideoLinkEntity
}
