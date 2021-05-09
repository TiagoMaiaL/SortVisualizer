//
//  QuickSortTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 08/05/21.
//

import XCTest
@testable import SortVisualizer

class QuickSortTests: XCTestCase {
    
    // MARK: Tests
    
    func testSortingEmptyArray() {
        let numbers = [Int]()
        XCTAssertEqual(numbers.quickSorted(), numbers)
    }
    
    func testSortingArrayWithSingleElement() {
        let numbers = [5]
        XCTAssertEqual(numbers.quickSorted(), numbers)
    }
    
    func testSortingArrayWithTwoElements() {
        let numbers = [5, 2]
        XCTAssertEqual(numbers.quickSorted(), [2, 5])
    }
    
    func testSortingArrayWithThreeElements() {
        let numbers = [4, 3, 8]
        XCTAssertEqual(numbers.quickSorted(), [3, 4, 8])
    }
    
    func testSortingArrayWithFourElements() {
        let numbers = [4, 3, 100, 9, 8]
        XCTAssertEqual(numbers.quickSorted(), [3, 4, 8, 9, 100])
    }
    
    func testSortingArrayWithMultipleElements() {
        let numbers = [195, 22, 189, 24, 5551, 23, 13, 1, 5, 9, 155]
        XCTAssertEqual(numbers.quickSorted(), [1, 5, 9, 13, 22, 23, 24, 155, 189, 195, 5551])
    }
    
    func testSortingArrayWithTwoEqualElements() {
        let numbers = [1, 1]
        XCTAssertEqual(numbers.quickSorted(), [1, 1])
    }
    
    func testSortingArrayWithThreeElementsIncludingRepetition() {
        let numbers = [5, 5, 2]
        XCTAssertEqual(numbers.quickSorted(), [2, 5, 5])
    }
    
    func testSortingArrayWithRepeatedElements() {
        let numbers = [190, 11, 190, 11, 25, 78, 67, 78, 25, 5, 10, 2, 5]
        XCTAssertEqual(numbers.quickSorted(), [2, 5, 5, 10, 11, 11, 25, 25, 67, 78, 78, 190, 190])
    }
    
    func testSortingWithMutableVersion() {
        var numbers = [21, 1000, 122, 16, 8]
        numbers.quickSort()
        XCTAssertEqual([8, 16, 21, 122, 1000], numbers)
    }
}
