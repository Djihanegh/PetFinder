//
//  Address+CoreData.swift
//  PetFinder
//
//  Created by MAC on 10/9/2025.
//

import CoreData

extension Address: CoreDataPersistable {
  var keyMap: [PartialKeyPath<Address>: String] {
    [
      \.address1: "address1",
      \.address2: "address2",
      \.city: "city",
      \.state: "state",
      \.postcode: "postcode",
      \.country: "country",
      \.id: "id"
    ]
  }

  typealias ManagedType = AddressEntity
}
