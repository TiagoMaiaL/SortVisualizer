//
//  SortVisualizerViewModel.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import Combine
import Foundation

final class SortVisualizerViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published
    private(set) var bubbleSortTime: String = ""
    
    @Published
    private(set) var selectionSortTime: String = ""
    
    @Published
    private(set) var insertionSortTime: String = ""
    
    @Published
    private(set) var sortedList: String = ""
    
    // MARK: Imperatives
    
    func sort(_ list: [Int]) {
        computeBubbleSort(for: list)
        computeSelectionSort(for: list)
        computeInsertionSort(for: list)
    }
    
    // MARK: Private methods
    
    private func computeBubbleSort(for list: [Int]) {
        performOperation {
            // TODO: Bubble sort
        } measuringTime: { secondsText in
            
        }
    }
    
    private func computeSelectionSort(for list: [Int]) {
        var sortedList: [Int]!
        
        performOperation { 
            sortedList = list.selectionSorted()
        } measuringTime: { secondsText in
            selectionSortTime = secondsText
            self.sortedList = sortedList
                .map(String.init)!
                .filter { $0.isNumber }
                .reduce("", { listText, elementText -> String in
                    "\(listText), \(elementText)"
                })
        }
    }
    
    private func computeInsertionSort(for list: [Int]) {
        performOperation { 
            // TODO: insertion sort
        } measuringTime: { secondsText in
            insertionSortTime = secondsText
        }
    }
    
    private func performOperation(_ operation: () -> Void, measuringTime timeTextHandler: (String) -> Void) {
        let start = DispatchTime.now().uptimeNanoseconds
        operation()
        let end = DispatchTime.now().uptimeNanoseconds
        
        let seconds = (end - start) / 1_000_000_000
        let secondsText = "\(seconds) seconds"
        timeTextHandler(secondsText)
    }
}
