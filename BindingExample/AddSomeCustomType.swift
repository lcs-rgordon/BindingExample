//
//  AddSomeCustomType.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

struct AddSomeCustomType: View {
    
    // NOTE: Refer to diagram at https://swiftuipropertywrappers.com for reminder on what property wrapper to use. Some SomeCustomType is a struct (a value type) we use an @Binding property wrapper here.
    @Binding var items: [SomeCustomType]
    
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
    
        }
        
    }
}

struct AddSomeCustomType_Previews: PreviewProvider {
    
    static var previews: some View {
        AddSomeCustomType(items: .constant(testData),
                          presentingAddItemSheet: .constant(true))
    }
    
}
