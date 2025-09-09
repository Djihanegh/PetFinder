//
//  Animal.swift
//  PetFinder
//
//  Created by MAC on 9/9/2025.
//

import Foundation

struct Animal: Codable {
  var id: Int?
  let organizationId: String?
  let url: URL?
  let type: String
  let species: String?
  var breeds: Breed
  var colors: APIColors
  let age: Age
  let gender: Gender
  let size: Size
  let coat: Coat?
  let name: String
  let description: String?
  let photos: [PhotoSizes]
  let videos: [VideoLink]
  let status: AdoptionStatus
  var attributes: AnimalAttributes
  var environment: AnimalEnvironment?
  let tags: [String]
  var contact: Contact
  let publishedAt: String?
  let distance: Double?
  var ranking: Int? = 0

  var picture: URL? {
    photos.first?.medium ?? photos.first?.large
  }
}

// MARK: - Identifiable
extension Animal: Identifiable {
    static let mock: [Animal] = [
            Animal(
                id: 1,
                organizationId: "org-123",
                url: URL(string: "https://example.com/animal/1"),
                type: "Dog",
                species: "Golden Retriever",
                breeds: Breed(primary: "Golden Retriever", secondary: nil, mixed: false, unknown: false),
                colors: APIColors(primary: "Golden", secondary: nil, tertiary: nil),
                age: .adult,
                gender: .male,
                size: .large,
                coat: .long,
                name: "Buddy",
                description: "Friendly and playful dog looking for a loving home.",
                photos: [PhotoSizes(
                    small: URL(string: "https://example.com/photo1_small.jpg"),
                    medium: URL(string: "https://example.com/photo1_medium.jpg"),
                    large: URL(string: "https://example.com/photo1_large.jpg"),
                    full: URL(string: "https://example.com/photo1_full.jpg")
                )],
                videos: [],
                status: .adoptable,
                attributes: AnimalAttributes(spayedNeutered: true, houseTrained: true, declawed: nil, specialNeeds: false, shotsCurrent: true),
                environment: AnimalEnvironment(children: true, dogs: true, cats: false),
                tags: ["friendly", "playful"],
                contact: Contact(email: "contact@example.com", phone: "123-456-7890", address: Address(address1: "123 Main St", address2: nil, city: "New York", state: "NY", postcode: "10001", country: "US")),
                publishedAt: "2023-09-01T12:00:00Z",
                distance: 5.0,
                ranking: 1
            )
        ]
}
