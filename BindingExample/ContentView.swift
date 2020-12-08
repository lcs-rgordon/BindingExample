//
//  ContentView.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

struct ContentView: View {
    
    // The list of items we are tracking with this app
    @State private var items: [SomeCustomType] = testData
    
    // Whether the add item sheet is being presented
    @State private var presentingAddItemSheet = false

    var body: some View {
        
        NavigationView {
            
            // Show a basic list of the items
            List(items) { item in
                Text(item.name)
            }
            .navigationTitle("Item Manager")
            .sheet(isPresented: $presentingAddItemSheet, content: {
                AddSomeCustomType(items: $items,
                                  presentingAddItemSheet: $presentingAddItemSheet)
            })
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        // Toggle the boolean to show the "add item" sheet
                        presentingAddItemSheet = true
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
