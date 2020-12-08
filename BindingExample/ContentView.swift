//
//  ContentView.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

struct ContentView: View {
    
    // The list of items we are tracking with this app
    @StateObject private var customTypeContainer = SomeCustomTypeContainer()
    
    // Whether the add item sheet is being presented
    @State private var presentingAddItemSheet = false
    
    var body: some View {
        
        NavigationView {
            
            // Show a basic list of the items
            List(customTypeContainer.items) { currentItem in
                
                NavigationLink(currentItem.name,
                               destination: SomeCustomTypeDetail(item: currentItem))
                
            }
            .navigationTitle("Item Manager")
            .sheet(isPresented: $presentingAddItemSheet, content: {
                AddSomeCustomType(customTypeContainer: customTypeContainer,
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
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                
                // Save any items that have been completed
                // This view modifier is triggered whenever the app is quit or moved to the background on the device
                customTypeContainer.save()
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
