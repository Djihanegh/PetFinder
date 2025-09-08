//
//  Pagination.swift
//  PetFinder
//
//  Created by MAC on 8/9/2025.
//

import Foundation

struct Pagination: Codable {
  let countPerPage: Int
  let totalCount: Int
  let currentPage: Int
  let totalPages: Int
}
