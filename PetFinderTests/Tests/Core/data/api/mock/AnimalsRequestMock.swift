//
//  AnimalsRequestMock.swift
//  PetFinderTests
//
//  Created by MAC on 9/9/2025.
//

import Foundation
@testable import PetFinder

enum AnimalsRequestMock: RequestProtocol {
  case getAnimals

  var requestType: RequestType {
    return .GET
  }

  var path: String {
    guard let path = Bundle.main.path(forResource: "AnimalsMock", ofType: "json") else { return "" }
    return path
  }
}
