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

    var body: some View {
        
        NavigationView {
            
            // Show a basic list of the items
            List(items) { item in
                Text(item.name)
            }
            .navigationTitle("Item Manager")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
