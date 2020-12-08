//
//  SomeCustomTypeDetail.swift
//  BindingExample
//
//  Created by Russell Gordon on 2020-12-08.
//

import SwiftUI

struct SomeCustomTypeDetail: View {
    
    var item: SomeCustomType
    
    var body: some View {
        
        // No navigation view is needed on this detail view, since this view will be wrapped in the navigation view from the main content view screen
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10.0) {
                
                if item.flag == true {
                    Text("This item is active.")
                        .font(.caption)
                } else {
                    Text("This item is not active.")
                        .font(.footnote)
                }
                
                Text("\(item.rating) out of 10")

                Text(item.description)
                
                Spacer()
                            
            }
            .padding(.horizontal)
        }
        .navigationTitle(item.name)
        
    }
}

struct SomeCustomTypeDetail_Previews: PreviewProvider {
    
    static var previews: some View {

        // We add a navigation view to the preview so we can see what the title will look like
        NavigationView {
            
            // Provide some information from our test data so preview works
            SomeCustomTypeDetail(item: testData[2])

        }
    }
    
}
