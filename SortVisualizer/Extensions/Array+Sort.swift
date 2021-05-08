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
    
    func selectionSorted() -> Self {
        guard count > 1 else {
            return self
        }
        
        var copy = self
        
        for i in 0 ..< copy.count {
            var needsChange = false
            var lowest: (index: Int, value: Element) = (index: i, value: copy[i])
            
            for j in i ..< copy.count {
                if lowest.value > copy[j] {
                    lowest = (index: j, value: copy[j])
                    needsChange = true
                }
            }
            
            if needsChange {
                copy.swapAt(i, lowest.index)
            }
        }
        
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
    
    // TODO: Create mutable variants for the sort methods.
    // TODO: Refactor the sorted() methods to use the mutable ones in their copies.
    // TODO: Add a quick sort method.
}
