//
//  SortVisualizerView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct SortVisualizerView: View {
    
    // MARK: Constants
    
    private let verticalSpacing: CGFloat = 30

    // MARK: Properties
    
    @StateObject
    private var viewModel = SortVisualizerViewModel()
    
    @State
    private var input: String = ""
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            Spacer()
            
            let rawInputBinding = Binding<String> { () -> String in
                input
            } set: {
                input = $0
                viewModel.validate(input)
            }
            
            ListInputView(
                rawInput: rawInputBinding,
                isSortButtonEnabled: viewModel.isInputValid
            ) { rawInput in
                let list = viewModel.parse(rawInput)
                viewModel.sort(list)
            }
            SortResultsView(
                bubbleSortTime: viewModel.bubbleSortTime, 
                insertionSortTime: viewModel.insertionSortTime, 
                selectionSortTime: viewModel.selectionSortTime,
                quickSortTime: viewModel.quickSortTime,
                sortedListText: viewModel.sortedList
            )
            
            Spacer()
        }
        .padding()
    }
}

// MARK: Preview

struct SortVisualizerView_Previews: PreviewProvider {
    static var previews: some View {
        SortVisualizerView()
    }
}
