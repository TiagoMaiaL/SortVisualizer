//
//  KeyValueView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 15/05/21.
//

import SwiftUI

struct KeyValueView: View {
    
    // MARK: Properties
    
    let key: String
    let value: String
    
    // MARK: Body
    var body: some View {
        HStack {
            Text(key)
            Text(value.isEmpty ? "-" : value)
                .bold()
                .opacity(value.isEmpty ? 0.6 : 1)
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(key: "Key text:", value: "Value text")
        KeyValueView(key: "Key text:", value: "")
    }
}
