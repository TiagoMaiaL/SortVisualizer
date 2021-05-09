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
        
        let pivotIndex = partition(from: left, to: right)
        _quickSort(from: left, to: pivotIndex - 1)
        _quickSort(from: pivotIndex + 1, to: right)
    }
    
    mutating private func partition(
        from left: Int,
        to right: Int
    ) -> Int {
        let pivotIndex = Int.random(in: left...right)
        swapAt(pivotIndex, right)
        
        let pivot = self[right]
        var i = left
        
        for j in i ..< right {
            if self[j] <= pivot {
                swapAt(i, j)
                i += 1
            }
        }
        
        swapAt(i, right)
        
        return i
    }
    
    func quickSorted() -> Self {
        var copy = self
        
        copy.quickSort()
        
        return copy
    }
}
