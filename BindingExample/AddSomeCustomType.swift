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
    
    var body: some View {

        VStack {
            
            Text("There are \(items.count) items in the list.")
            
            Button("Dismiss This Sheet") {
                presentingAddItemSheet = false
            }
        }
        
    }
}

struct AddSomeCustomType_Previews: PreviewProvider {
    
    static var previews: some View {
        AddSomeCustomType(items: .constant(testData),
                          presentingAddItemSheet: .constant(true))
    }
    
}
