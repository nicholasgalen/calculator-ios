//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Nicholas Galen on 28/06/25.
//

import XCTest
@testable import calculator

final class calculatorTests: XCTestCase {

    func testAdd() {
        let vc = ViewController()
        let result = vc.add(num1: 5, num2: 3)
        XCTAssertEqual(result, 8)
    }

    func testSubtract() {
        let vc = ViewController()
        let result = vc.subtract(num1: 10, num2: 4)
        XCTAssertEqual(result, 6)
    }

    func testMultiply() {
        let vc = ViewController()
        let result = vc.multiply(num1: 3, num2: 4)
        XCTAssertEqual(result, 12)
    }

    func testDivide() {
        let vc = ViewController()
        let result = vc.divide(num1: 8, num2: 2)
        XCTAssertEqual(result, 4)
    }

    func testDivideByZero() {
        let vc = ViewController()
        let result = vc.divide(num1: 8, num2: 0)
        XCTAssertTrue(result.isInfinite || result.isNaN)
    }
}
