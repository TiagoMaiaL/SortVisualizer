//
//  InsertionSortTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 02/05/21.
//

import XCTest
@testable import SortVisualizer

class InsertionSortTests: XCTestCase {

    // MARK: Tests
    
    func testSortingEmptyArray() {
        let numbers = [Int]()
        XCTAssertEqual(numbers.insertionSorted(), numbers)
    }
    
    func testSortingArrayWithSingleElement() {
        let numbers = [1]
        XCTAssertEqual(numbers.insertionSorted(), numbers)
    }
    
    func testSortingArrayWithTwoElements() {
        let numbers = [2, 1]
        XCTAssertEqual(numbers.insertionSorted(), [1, 2])
    }
    
    func testSortingArrayWithThreeElements() {
        let numbers = [2, 1, 3]
        XCTAssertEqual(numbers.insertionSorted(), [1, 2, 3])
    }
    
    func testSortingArrayWithMultipleElements() {
        let numbers = [2005, 12, 5, 54, 21, 1, 23, 2, 66, 3, 155]
        XCTAssertEqual(numbers.insertionSorted(), [1, 2, 3, 5, 12, 21, 23, 54, 66, 155, 2005])
    }
    
    func testSortingArrayWithTwoEqualElements() {
        let numbers = [1, 1]
        XCTAssertEqual(numbers.insertionSorted(), [1, 1])
    }
    
    func testSortingArrayWithThreeElementsIncludingRepetition() {
        let numbers = [2, 2, 1]
        XCTAssertEqual(numbers.insertionSorted(), [1, 2, 2])
    }
    
    func testSortingArrayWithRepeatedElements() {
        let numbers = [3, 3, 2, 2, 1, 5, 5, 10, 10, 5, 10, 2, 1]
        XCTAssertEqual(numbers.insertionSorted(), [1, 1, 2, 2, 2, 3, 3, 5, 5, 5, 10, 10, 10])
    }
    
    func testSortingWithMutableVersion() {
        var numbers = [567, 2343, 242, 16, 2]
        numbers.insertionSort()
        XCTAssertEqual([2, 16, 242, 567, 2343], numbers)
    }

}
