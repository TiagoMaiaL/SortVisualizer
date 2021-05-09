//
//  Array+Sort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import Foundation

extension Array where Element: Comparable {
    
    // MARK: Bubble Sort
    
    mutating func bubbleSort() {
        guard count > 1 else {
            return
        }
        
        for i in 0 ..< count {
            var isSortFinished = true
            
            for j in 1 ..< count - i {
                if self[j - 1] > self[j] {
                    isSortFinished = false
                    swapAt(j - 1, j)
                }
            }
            
            if isSortFinished {
                break
            }
        }
    }

    func bubbleSorted() -> Self {
        var copy = self
        
        copy.bubbleSort()
        
        return copy
    }
    
    // MARK: Selection Sort
    
    mutating func selectionSort() {
        guard count > 1 else {
            return
        }
        
        for i in 0 ..< count {
            var lowest: (index: Int, value: Element) = (i, self[i])
            
            for j in i + 1 ..< count {
                if self[j] < lowest.value {
                    lowest = (j, self[j])
                }
            }
            
            if self[i] != lowest.value {
                swapAt(i, lowest.index)
            }
        }
    }
    
    func selectionSorted() -> Self {
        var copy = self
        
        copy.selectionSort()
        
        return copy
    }
    
    // MARK: Insertion Sort
    
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
    
    // MARK: Quick Sort
    
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
