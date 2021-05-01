//
//  SortVisualizerView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct SortVisualizerView: View {
    @State
    private var input: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            ListInputView(rawInput: $input)
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
}

struct SortVisualizerView_Previews: PreviewProvider {
    static var previews: some View {
        SortVisualizerView()
    }
}
