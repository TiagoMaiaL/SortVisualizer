//
//  SortResultsView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct SortResultsView: View {
    
    // MARK: Properties
    
    var bubbleSortTime: String
    
    var insertionSortTime: String
    
    var selectionSortTime: String

    var sortedListText: String
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("Bubble sort time: ")
                Text(bubbleSortTime)
            }
            
            HStack {
                Text("Insertion sort time: ")
                Text(bubbleSortTime)
            }
            
            HStack {
                Text("Selection sort time: ")
                Text(bubbleSortTime)
            }
            
            HStack {
                Text("Sorted list: ")
                Text(bubbleSortTime)
            }
        }
    }
}

// MARK: - Preview

struct SortResultsView_Previews: PreviewProvider {
    private static var bubbleSortTime: String = "10 secs"
    
    private static var insertionSortTime: String = "3 secs"
    
    private static var selectionSortTime: String = "6 secs"
    
    private static var sortedListText: String = "1, 2, 5, 6, 8, 10, 12, 24, 2004, 21234"
    
    static var previews: some View {
        SortResultsView(
            bubbleSortTime: bubbleSortTime, 
            insertionSortTime: insertionSortTime, 
            selectionSortTime: selectionSortTime, 
            sortedListText: sortedListText
        )
    }
}
