//
//  Collection+Sort.swift
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
        guard count > 1 else { return self }
        var copy = self
        let lastIndex = count - 1

        for i in 0 ... lastIndex {
            var lowest = copy[i]
            
            for j in i ... lastIndex {
                if lowest > copy[j] {
                    lowest = copy[j]
                }
            }
            
            copy[i] = lowest
        }
        
         return copy
    }
    
    func insertionSorted() -> Self {
        return self
    }
}
