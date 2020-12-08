//
//  SomeCustomType.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import Foundation

// When a type conforms to the Identifiable protocol (includes an id attribute) we can then use the type in List views more easily
struct SomeCustomType: Identifiable {
    
    var id = UUID() // A UUID is a universally unique identifier the system will generate for us
    var name: String
    var description: String
    var flag: Bool
    var rating: Int
    
}

// Define some test data to use at various points during development
let testData = [
    SomeCustomType(name: "Apples", description: "A delicious fruit with many varieties.", flag: false, rating: 8),
    SomeCustomType(name: "Bananas", description: "Of tropical origin; comes with a convenient wrapper.", flag: true, rating: 7),
    SomeCustomType(name: "Cherries", description: "Great on cheesecake.", flag: true, rating: 9),
]
