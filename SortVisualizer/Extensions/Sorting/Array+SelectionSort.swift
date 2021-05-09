//
//  Array+SelectionSort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 09/05/21.
//

import Foundation

extension Array where Element: Comparable {
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
}
