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
    
    var body: some View {
        Text("There are \(items.count) items in the list.")
    }
}

struct AddSomeCustomType_Previews: PreviewProvider {
    
    static var previews: some View {
        AddSomeCustomType(items: .constant(testData))
    }
    
}
