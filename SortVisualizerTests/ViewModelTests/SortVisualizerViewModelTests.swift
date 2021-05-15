//
//  SortVisualizerViewModelTests.swift
//  SortVisualizerTests
//
//  Created by Tiago Lopes on 04/05/21.
//

import XCTest
@testable import SortVisualizer

class SortVisualizerViewModelTests: XCTestCase {
    
    // MARK: Properties
    
    private var viewModel: SortVisualizerViewModel!
    
    // MARK: Setup / Teardown
    
    override func setUp() {
        super.setUp()
        viewModel = SortVisualizerViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testItParsesAnEmptyString() {
        let rawInput = ""
        let numbersList = viewModel.parse(rawInput)
        XCTAssertTrue(numbersList.isEmpty)
    }
    
    func testItParsesASingleNumber() {
        let rawInput = "123"
        let numbersList = viewModel.parse(rawInput)
        XCTAssertEqual(numbersList, [123])
    }
    
    func testItParsesNumbersSeparatedByComma() {
        let rawInput = "123, 321, 222, 12, 31"
        let numbersList = viewModel.parse(rawInput)
        XCTAssertEqual(numbersList, [123, 321, 222, 12, 31])
    }
    
    func testItDoesNotParseStringsOnly() {
        let rawInput = "abc, asd"
        let numbersList = viewModel.parse(rawInput)
        XCTAssertTrue(numbersList.isEmpty)
    }
    
    func testItParsesNumbersAmongStrings() {
        let rawInput = "asdfasdf, 123, asdfasdf"
        let numbersList = viewModel.parse(rawInput)
        XCTAssertEqual(numbersList, [123])
    }
    
    func testValidatingEmptyArrayShouldBeInvalid() {
        viewModel.validate("")
        XCTAssertFalse(viewModel.isInputValid)
    }
    
    func testValidatingInputWithLettersOnlyShouldBeInvalid() {
        viewModel.validate("asdf")
        XCTAssertFalse(viewModel.isInputValid)
    }
    
    func testValidatingInputWithLettersAndOneNumberShouldBeValid() {
        viewModel.validate("asdfs, 123")
        XCTAssertTrue(viewModel.isInputValid)
    }
    
    func testValidatingInputWithNumberAmongLettersShouldBeValid() {
        viewModel.validate("asdfasdf, 444, asdfaf")
        XCTAssertTrue(viewModel.isInputValid)
    }
    
    func testValidatingInputWithNumbersShouldBeValid() {
        viewModel.validate("123, 123, 442, 14, 65")
        XCTAssertTrue(viewModel.isInputValid)
    }
    
    func testSortingPublishesSortedListText() {
        let input = [5, 23, 44, 12, 2, 4, 1]
        
        viewModel.sort(input)
        
        let expectedSortedListText = input
            .sorted()
            .map { "\($0), " }
            .reduce("", +)
            .dropLast(2)
        
        XCTAssertEqual(String(expectedSortedListText), viewModel.sortedList)
    }
    
    func testThatSortingTimesAreInitiallyUndetermined() {
        XCTAssertEqual(viewModel.bubbleSortTime, "")
        XCTAssertEqual(viewModel.insertionSortTime, "")
        XCTAssertEqual(viewModel.selectionSortTime, "")
        XCTAssertEqual(viewModel.quickSortTime, "")
    }
    
    func testThatSortedArrayIsInitiallyUndetermined() {
        XCTAssertEqual(viewModel.sortedList, "")
    }
    
    func testSortingPublishesEmpiricalSortTimes() {
        let input = [5231, 123, 255, 32, 1, 5992, 12]
        
        viewModel.sort(input)
        
        XCTAssertTrue(viewModel.bubbleSortTime.contains("Nanoseconds"))
        XCTAssertTrue(viewModel.selectionSortTime.contains("Nanoseconds"))
        XCTAssertTrue(viewModel.insertionSortTime.contains("Nanoseconds"))
        XCTAssertTrue(viewModel.quickSortTime.contains("Nanoseconds"))
        
        [viewModel.bubbleSortTime,
         viewModel.selectionSortTime,
         viewModel.insertionSortTime,
         viewModel.quickSortTime
        ].forEach {
            XCTAssertTrue($0.isSortTimeTextValid)
        }
    }
}

// MARK: - Helper Test Extension

private extension String {
    var isSortTimeTextValid: Bool {
        !self.map(String.init)
            .compactMap(Int.init)
            .filter { $0 > 0 }
            .isEmpty
    }
}
