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
                let temp = copy[i]
                copy[i] = lowest.value
                copy[lowest.index] = temp
            }
        }
        
        return copy
    }
    
    func insertionSorted() -> Self {
        guard count > 1 else {
            return self
        }
        
        return self
    }
}
