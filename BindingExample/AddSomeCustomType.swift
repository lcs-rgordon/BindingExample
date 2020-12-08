//
//  AddSomeCustomType.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

struct AddSomeCustomType: View {
    
    // NOTE: Refer to diagram at https://swiftuipropertywrappers.com for reminder on what property wrapper to use. Some SomeCustomTypeContainer is a class (a reference type) we use an @ObservedObject property wrapper here.
    @ObservedObject var customTypeContainer: SomeCustomTypeContainer
    
    // Controls whether this sheet is visible or not
    @Binding var presentingAddItemSheet: Bool
    
    // The Fields to track details of the new item
    //
    // NOTE: Refer to diagram at https://swiftuipropertywrappers.com
    //
    // Since the data for these items are created within this view, we use the @State property wrapper
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var flag: Bool = false
    @State private var rating: Int = 0
    
    var body: some View {
        
        // Since this appears as a sheet (not a view that is navigated to from a list) we use a new navigation view, so that we can show a title for this view
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Enter item name", text: $name)
                }
                
                Section(header: Text("Description")) {
                    // A text editor is much like a text field, except it automatically extends to multiple lines to allow for extended input.
                    TextEditor(text: $description)
                }
                
                Toggle(isOn: $flag) {
                    Text("Active item?")
                }
                
                Stepper("Out of 10, I rate this a \(rating)", value: $rating, in: 1...10)
                
            }
            .navigationTitle("Add New Item")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        saveItem()
                    }
                }
            }
        }
    }
    
    func saveItem() {
        
        // Append the new item to the array of items that is bound to the source of truth – the array of items – from the main content view
        customTypeContainer.items.append(SomeCustomType(name: name,
                                                        description: description,
                                                        flag: flag,
                                                        rating: rating))
        
        // Toggle the boolean that controls whether this sheet is showing, so it will be dismissed
        presentingAddItemSheet = false
        
    }
    
}

struct AddSomeCustomType_Previews: PreviewProvider {
    
    static var previews: some View {
        AddSomeCustomType(customTypeContainer: SomeCustomTypeContainer(),
                          presentingAddItemSheet: .constant(true))
    }
    
}
