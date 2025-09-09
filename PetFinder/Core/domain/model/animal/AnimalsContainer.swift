//
//  AnimalsContainer.swift
//  PetFinder
//
//  Created by MAC on 9/9/2025.
//

import Foundation

struct AnimalsContainer: Decodable {
  let animals: [Animal]
  let pagination: Pagination
}
