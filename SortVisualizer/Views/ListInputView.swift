//
//  ListInputView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct ListInputView: View {
    
    // MARK: Properties
    
    private let listRawInput: Binding<String>
    
    private let sortButtonTapHandler: ((String) -> Void)?
    
    private let isSortButtonEnabled: Bool
    
    // MARK: Initializer
    
    init(
        rawInput: Binding<String>,
        isSortButtonEnabled: Bool = true,
        sortButtonTapHandler: ((String) -> Void)? = nil
    ) {
        self.listRawInput = rawInput
        self.sortButtonTapHandler = sortButtonTapHandler
        self.isSortButtonEnabled = isSortButtonEnabled
    }
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Text("Type here the numbers to be sorted, separated by commas, making sure they're correctly typed:")
            TextField("Example: 1, 102, 521, 23, 15, 2, 125", text: listRawInput)
                .font(.system(size: 10))
            Button("Sort") {
                sortButtonTapHandler?(listRawInput.wrappedValue)
            }
            .disabled(!isSortButtonEnabled)
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
