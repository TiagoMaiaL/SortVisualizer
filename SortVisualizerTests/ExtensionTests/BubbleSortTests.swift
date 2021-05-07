//
//  BubbleSortTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 02/05/21.
//

import XCTest
@testable import SortVisualizer

class BubbleSortTests: XCTestCase {

    // MARK: Tests
    
    func testSortingEmptyArray() {
        let numbers = [Int]()
        XCTAssertEqual(numbers.bubbleSorted(), numbers)
    }
    
    func testSortingArrayWithSingleElement() {
        let numbers = [1]
        XCTAssertEqual(numbers.bubbleSorted(), numbers)
    }
    
    func testSortingArrayWithTwoElements() {
        let numbers = [2, 1]
        XCTAssertEqual(numbers.bubbleSorted(), [1, 2])
    }
    
    func testSortingArrayWithThreeElements() {
        let numbers = [2, 1, 3]
        XCTAssertEqual(numbers.bubbleSorted(), [1, 2, 3])
    }
    
    func testSortingArrayWithMultipleElements() {
        let numbers = [49, 150, 58, 59, 165, 20, 150, 163, 119, 58]
        XCTAssertEqual(numbers.bubbleSorted(), [20, 49, 58, 58, 59, 119, 150, 150, 163, 165])
    }
    
    func testSortingArrayWithTwoEqualElements() {
        let numbers = [1, 1]
        XCTAssertEqual(numbers.bubbleSorted(), [1, 1])
    }
    
    func testSortingArrayWithThreeElementsIncludingRepetition() {
        let numbers = [2, 2, 1]
        XCTAssertEqual(numbers.bubbleSorted(), [1, 2, 2])
    }
    
    func testSortingArrayWithRepeatedElements() {
        let numbers = [161, 161, 161, 195, 195, 195, 130, 13, 99, 80, 120, 120]
        XCTAssertEqual(numbers.bubbleSorted(), [13, 80, 99, 120, 120, 130, 161, 161, 161, 195, 195, 195])
    }
    
    func testSortingWithMutableVersion() {
        var numbers = [255, 23, 12, 66, 8]
        numbers.bubbleSort()
        XCTAssertEqual([8, 12, 23, 66, 255], numbers)
    }
}
