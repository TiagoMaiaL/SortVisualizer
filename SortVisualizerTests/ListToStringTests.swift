//
//  ListToStringTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 02/05/21.
//

import XCTest
@testable import SortVisualizer

class ListToStringTests: XCTestCase {
    func testArrayToString() {
        let numbers = [1, 2, 3, 5, 6]
        XCTAssertEqual("1, 2, 3, 5, 6", numbers.displayText)
    }
    
    func testEmptyArrayToString() {
        let numbers = [Int]()
        XCTAssertEqual("", numbers.displayText)
    }
    
    func testSingleElementArrayToString() {
        let numbers = [1]
        XCTAssertEqual("1", numbers.displayText)
    }
}
