//
//  Array+Sort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import Foundation

extension Array where Element: Comparable {
    
    func bubbleSorted() -> Self {
        // TODO: Sort elements.
        return self
    }
    
    func selectionSorted() -> Self {
        guard count > 1 else {
            return self
        }
        
        var i = 0
        var j: Int
        var copy = self
        
        while i < copy.count {
            j = i + 1
            var needsChange = false
            var lowest: (index: Int, value: Element) = (index: i, value: copy[i])
            
            while j < copy.count {
                if lowest.value > copy[j] {
                    lowest = (index: j, value: copy[j])
                    needsChange = true
                }
                j += 1
            }
            
            if needsChange {
                let temp = copy[i]
                copy[i] = lowest.value
                copy[lowest.index] = temp
            }
            
            i += 1
        }
        
        return copy
    }
    
    func insertionSorted() -> Self {
        return self
    }
}
