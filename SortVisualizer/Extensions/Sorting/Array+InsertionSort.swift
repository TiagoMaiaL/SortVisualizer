//
//  Array+InsertionSort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 09/05/21.
//

import Foundation

extension Array where Element: Comparable {
    mutating func insertionSort() {
        guard count > 1 else {
            return
        }
        
        for i in 1 ..< count {
            let nextUnsorted = self[i]
            var insertionIndex = i
            
            for j in (0 ..< i).reversed() {
                if self[j] > nextUnsorted {
                    swapAt(j, insertionIndex)
                    insertionIndex = j
                }
            }
        }
    }

    func insertionSorted() -> Self {
        var copy = self
        
        copy.insertionSort()
        
        return copy
    }
}
