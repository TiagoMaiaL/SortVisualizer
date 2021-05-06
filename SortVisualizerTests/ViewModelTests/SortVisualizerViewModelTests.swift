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
    
    // TODO: Add tests for sorting the lists.
}
