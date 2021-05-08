//
//  SelectionSortTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 02/05/21.
//

import XCTest
@testable import SortVisualizer

class SelectionSortTests: XCTestCase {

    // MARK: Tests
    
    func testSortingEmptyArray() {
        let numbers = [Int]()
        XCTAssertEqual(numbers.selectionSorted(), numbers)
    }
    
    func testSortingArrayWithSingleElement() {
        let numbers = [1]
        XCTAssertEqual(numbers.selectionSorted(), numbers)
    }
    
    func testSortingArrayWithTwoElements() {
        let numbers = [2, 1]
        XCTAssertEqual(numbers.selectionSorted(), [1, 2])
    }
    
    func testSortingArrayWithThreeElements() {
        let numbers = [2, 1, 3]
        XCTAssertEqual(numbers.selectionSorted(), [1, 2, 3])
    }
    
    func testSortingArrayWithMultipleElements() {
        let numbers = [555, 12, 254, 124, 421, 1, 23, 2, 66, 3, 155]
        XCTAssertEqual(numbers.selectionSorted(), [1, 2, 3, 12, 23, 66, 124, 155, 254, 421, 555])
    }
    
    func testSortingArrayWithTwoEqualElements() {
        let numbers = [1, 1]
        XCTAssertEqual(numbers.selectionSorted(), [1, 1])
    }
    
    func testSortingArrayWithThreeElementsIncludingRepetition() {
        let numbers = [2, 2, 1]
        XCTAssertEqual(numbers.selectionSorted(), [1, 2, 2])
    }
    
    func testSortingArrayWithRepeatedElements() {
        let numbers = [100, 100, 2, 2, 1, 78, 78, 10, 10, 5, 10, 2, 1]
        XCTAssertEqual(numbers.selectionSorted(), [1, 1, 2, 2, 2, 5, 10, 10, 10, 78, 78, 100, 100])
    }
    
    func testSortingWithMutableVersion() {
        var numbers = [1225, 233, 55, 3552, 23]
        numbers.selectionSort()
        XCTAssertEqual([23, 55, 233, 1225, 3552], numbers)
    }
}
