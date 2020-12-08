//
//  SomeCustomTypeContainer.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

// By conforming to the ObservableObject protocol, SwiftUI will be able to monitor any published properties for changes, and update the UI as needed
class SomeCustomTypeContainer: ObservableObject {
    
    static let trackedItemsKey = "trackedItems"
    
    @Published var items: [SomeCustomType] {

        // Save contents of this class as each new item is added
        // (didSet fires whenever the items property aray is changed)
        didSet {
            self.save()
        }

    }

    // Class initializer
    init() {

        // Try to read the saved items from the app bundle
        if let readActivities = UserDefaults.standard.data(forKey: SomeCustomTypeContainer.trackedItemsKey) {
            
            let decoder = JSONDecoder()
            
            // Try to decode the items from JSON
            // Decodes an instance of the specified type
            // .self is required to reference the type object
            // So by saying [SomeCustomType].self we are saying "decode the data from readItems into a structure of type [SomeCustomType], in other words, an array of SomeCustomType instances"
            if let decoded = try? decoder.decode([SomeCustomType].self, from: readActivities) {
                
                // Save the decoded items
                items = decoded

                // We're done loading items from disk
                return
            }
        }

        // If nothing could be read from the app bundle, or data could not be decoded, show an empty list of items
        items = []
    }
    
    // Save the contents of this class to UserDefaults
    func save() {
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: SomeCustomTypeContainer.trackedItemsKey)
        }
        
    }

}
