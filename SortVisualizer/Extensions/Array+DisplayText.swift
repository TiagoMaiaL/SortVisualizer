//
//  Array+DisplayText.swift
//  SortVisualizer
//
//  Created by Tiago Lopes on 02/05/21.
//

import Foundation

extension Array {
    var displayText: String {
        var text = description
        text.remove(at: text.startIndex)
        text.remove(at: text.index(text.endIndex, offsetBy: -1))
        return text
    }
}
