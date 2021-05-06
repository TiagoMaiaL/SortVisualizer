//
//  Array+Sort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import Foundation

extension Array where Element: Comparable {

    func bubbleSorted() -> Self {
        guard count > 1 else {
            return self
        }
        
        var copy = self
        
        for _ in 0 ..< copy.count {
            for j in 1 ..< copy.count {
                if copy[j - 1] > copy[j] {
                    copy.swapAt(j - 1, j)
                }
            }
        }
        
        return copy
    }
    
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
    
    func insertionSorted() -> Self {
        guard count > 1 else {
            return self
        }

        var sorted = [self[0]]
        
        for i in 1 ..< count {
            let currentElement = self[i]
            
            for j in 0 ..< sorted.count {
                if currentElement <= sorted[j] {
                    sorted.insert(currentElement, at: j)
                    break
                    
                } else if j == sorted.count - 1, currentElement > sorted[j] {
                    sorted.append(currentElement)
                    break   
                }
            }
        }
        
        return sorted
    }
    
    // TODO: Create mutable variants for the sort methods.
    // TODO: Refactor the sorted() methods to use the mutable ones in their copies.
    // TODO: Add a quick sort method.
}
