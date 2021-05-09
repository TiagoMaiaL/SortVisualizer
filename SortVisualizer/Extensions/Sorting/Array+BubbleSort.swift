//
//  Array+BubbleSort.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 09/05/21.
//

import Foundation

extension Array where Element: Comparable {
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
}
