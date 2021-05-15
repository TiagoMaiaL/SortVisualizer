//
//  ListInputView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct ListInputView: View {
    
    // MARK: Constants
    
    private let listInputFontSize: CGFloat = 10
    
    private enum Localizable {
        static let instruction = "Type here the numbers to be sorted, separated by commas:"
        static let sortButtonTitle = "Sort"
        static let listInputExample = "Example: 1, 102, 521, 23, 15, 2, 125"
    }
    
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
        VStack(alignment: .leading) {
            Text(Localizable.instruction)
            
            TextField(Localizable.listInputExample, text: listRawInput)
                .font(.system(size: listInputFontSize))
            
            Button(Localizable.sortButtonTitle) {
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
