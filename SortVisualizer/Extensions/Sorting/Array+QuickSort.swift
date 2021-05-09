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
        from left: Int,
        to right: Int
    ) {
        guard left < right, right - left > 0 else {
            return
        }
        
        var pivotIndex = left + ((right - left) / 2)
        partition(around: &pivotIndex, from: left, to: right)
        _quickSort(from: left, to: pivotIndex - 1)
        _quickSort(from: pivotIndex + 1, to: right)
    }
    
    mutating private func partition(
        around pivotIndex: inout Int,
        from left: Int,
        to right: Int
    ) {
        swapAt(left, pivotIndex)
        pivotIndex = left
        
        let pivot = self[pivotIndex]
        
        for i in left + 1 ... right {
            if pivot > self[i] {
                let smallerElement = remove(at: i)
                insert(smallerElement, at: left)
                pivotIndex += 1
            }
        }
    }
    
    func quickSorted() -> Self {
        var copy = self
        
        copy.quickSort()
        
        return copy
    }
}
