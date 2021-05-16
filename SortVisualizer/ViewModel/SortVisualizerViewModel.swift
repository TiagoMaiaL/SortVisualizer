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
    private(set) var quickSortTime: String = ""
    
    @Published
    private(set) var sortedList: String = ""
    
    @Published
    private(set) var isInputValid: Bool = false
    
    // MARK: Imperatives
    
    func sort(_ list: [Int]) {
        computeBubbleSort(for: list)
        computeSelectionSort(for: list)
        computeInsertionSort(for: list)
        computeQuickSort(for: list)
    }
    
    func parse(_ rawInput: String) -> [Int] {
        rawInput
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { Int($0) }
    }
    
    func validate(_ rawInput: String) {
        let parsedList = parse(rawInput)
        isInputValid = !parsedList.isEmpty
    }
    
    // MARK: Private methods
    
    private func computeBubbleSort(for list: [Int]) {
        var sortedList: [Int]!
        
        performOperation {
            sortedList = list.bubbleSorted()
        } measuringTime: { secondsText in
            bubbleSortTime = secondsText
            self.sortedList = sortedList.displayText
        }
    }
    
    private func computeSelectionSort(for list: [Int]) {
        performOperation {
            _ = list.selectionSorted()
        } measuringTime: { secondsText in
            selectionSortTime = secondsText
        }
    }
    
    private func computeInsertionSort(for list: [Int]) {
        performOperation {
            _ = list.insertionSorted()
        } measuringTime: { secondsText in
            insertionSortTime = secondsText
        }
    }
    
    private func computeQuickSort(for list: [Int]) {
        performOperation {
            _ = list.quickSorted()
        } measuringTime: { secondsText in
            quickSortTime = secondsText
        }
    }
    
    // TODO: Add merge sort computation.
    
    private func performOperation(_ operation: () -> Void, measuringTime timeTextHandler: (String) -> Void) {
        let start = DispatchTime.now().uptimeNanoseconds
        operation()
        let end = DispatchTime.now().uptimeNanoseconds
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let nanosecondsText = formatter.string(from: NSNumber(value: end - start)) ?? ""
        
        timeTextHandler("\(nanosecondsText) Nanoseconds")
    }
}
