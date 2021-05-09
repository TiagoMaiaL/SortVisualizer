//
//  Array+QuickSort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 09/05/21.
//

import Foundation

extension Array where Element: Comparable {
    mutating func quickSort() {
        guard count > 1 else {
            return
        }
        
        _quickSort(from: 0, to: count - 1)
    }
    
    mutating private func _quickSort(
        from startIndex: Int,
        to endIndex: Int
    ) {
        guard startIndex < endIndex, endIndex - startIndex > 0 else {
            return
        }
        
        var pivotIndex = startIndex + ((endIndex - startIndex) / 2)
        
        swapAt(startIndex, pivotIndex)
        pivotIndex = startIndex
        
        let pivot = self[pivotIndex]
        
        for i in startIndex + 1 ... endIndex {
            if pivot > self[i] {
                let smallerElement = remove(at: i)
                insert(smallerElement, at: startIndex)
                pivotIndex += 1
            }
        }
        
        _quickSort(from: startIndex, to: pivotIndex - 1)
        _quickSort(from: pivotIndex + 1, to: endIndex)
    }
    
    func quickSorted() -> Self {
        var copy = self
        
        copy.quickSort()
        
        return copy
    }
}
