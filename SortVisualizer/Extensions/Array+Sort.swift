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
    
    // TODO: Add a quick sort method.
}
