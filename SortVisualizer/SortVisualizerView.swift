//
//  SortVisualizerView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct SortVisualizerView: View {

    // MARK: Properties
    
    @StateObject
    private var viewModel = SortVisualizerViewModel()
    
    @State
    private var input: String = ""
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Spacer()
            
            ListInputView(rawInput: $input) { rawInput in
                let list = parse(rawInput)
                viewModel.sort(list)
            }
            SortResultsView(
                bubbleSortTime: "", 
                insertionSortTime: "", 
                selectionSortTime: "", 
                sortedListText: ""
            )
            
            Spacer()
        }
        .padding()
    }
    
    // MARK: Internal Methods
    
    private func parse(_ input: String) -> [Int] {
        input
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { Int($0) }
    }
}

// MARK: Preview

struct SortVisualizerView_Previews: PreviewProvider {
    static var previews: some View {
        SortVisualizerView()
    }
}
