//
//  APIManagerMock.swift
//  PetFinderTests
//
//  Created by MAC on 9/9/2025.
//

import XCTest
@testable import PetFinder

struct APIManagerMock: APIManagerProtocol {
  func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
    return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }

  func requestToken() async throws -> Data {
    Data(AccessTokenTestHelper.generateValidToken().utf8)
  }
}
