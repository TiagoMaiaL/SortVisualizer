//
//  ListInputView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct ListInputView: View {
    
    // MARK: Properties
    
    private var listRawInput: Binding<String>
    
    private var tapHandler: ((String) -> Void)?
    
    // MARK: Initializer
    
    init(rawInput: Binding<String>, tapHandler: ((String) -> Void)? = nil) {
        self.listRawInput = rawInput
        self.tapHandler = tapHandler
    }
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Text("Type here the numbers to be sorted, separated by commas:")
            TextField("Example: 1, 102, 521, 23, 15, 2, 125", text: listRawInput)
            Button("Sort") {
                tapHandler?(listRawInput.wrappedValue)
            }
        }
    }
}

// MARK: - Preview

struct ListInputView_Previews: PreviewProvider {
    
    @State
    private static var input: String = ""
    
    static var previews: some View {        
        ListInputView(rawInput: $input)
    }
}
