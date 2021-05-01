//
//  SortVisualizerViewModel.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 30/04/21.
//

import Combine
import Foundation

final class SortVisualizerViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published
    private(set) var bubbleSortTime: String = ""
    
    @Published
    private(set) var selectionSortTime: String = ""
    
    @Published
    private(set) var insertionSortTime: String = ""
    
    @Published
    private(set) var sortedList: String = ""
    
    // MARK: Imperatives
    
    func sort(_ list: [Int]) {
        // TODO: Sort list and publish values.
        debugPrint(list)
    }
}
