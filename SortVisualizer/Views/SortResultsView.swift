//
//  SortResultsView.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import SwiftUI

struct SortResultsView: View {
    
    // MARK: Constants
    
    private let timingVerticalSpace: CGFloat = 2
    private let listVerticalSpace: CGFloat = 15
    
    private enum Localizable {
        static let sortedList = "Sorted list:"
        static let bubbleSort = "Bubble sort time:"
        static let insertionSort = "Insertion sort time:"
        static let selectionSort = "Selection sort time:"
        static let quickSort = "Quick sort time:"
    }
    
    // MARK: Properties
    
    var bubbleSortTime: String
    
    var insertionSortTime: String
    
    var selectionSortTime: String
    
    var quickSortTime: String

    var sortedListText: String
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: listVerticalSpace) {
            timeResultViews
            
            HStack {
                Text(Localizable.sortedList)
                Text(sortedListText)
                    .bold()
            }
        }
    }
    
    private var timeResultViews: some View {
        VStack(alignment: .leading, spacing: timingVerticalSpace) {
            HStack {
                Text(Localizable.bubbleSort)
                Text(bubbleSortTime)
                    .bold()
            }
            
            HStack {
                Text(Localizable.insertionSort)
                Text(insertionSortTime)
                    .bold()
            }
            
            HStack {
                Text(Localizable.selectionSort)
                Text(selectionSortTime)
                    .bold()
            }
            
            HStack {
                Text(Localizable.quickSort)
                Text(quickSortTime)
                    .bold()
            }
        }
    }
}

// MARK: - Preview

struct SortResultsView_Previews: PreviewProvider {
    private static var bubbleSortTime: String = "10 secs"
    
    private static var insertionSortTime: String = "3 secs"
    
    private static var selectionSortTime: String = "6 secs"
    
    private static var quickSortTime: String = "2 secs"
    
    private static var sortedListText: String = "1, 2, 5, 6, 8, 10, 12, 24, 2004, 21234"
    
    static var previews: some View {
        SortResultsView(
            bubbleSortTime: bubbleSortTime, 
            insertionSortTime: insertionSortTime, 
            selectionSortTime: selectionSortTime,
            quickSortTime: quickSortTime,
            sortedListText: sortedListText
        )
    }
}
