//
//  calculatorUITests.swift
//  calculatorUITests
//
//  Created by Nicholas Galen on 28/06/25.
//

import XCTest

class calculatorUITests: XCTestCase {

    func waitForCalculatorScreen(app: XCUIApplication) {
        let resultLabel = app.staticTexts["result"]
        XCTAssertTrue(resultLabel.waitForExistence(timeout: 5), "A tela da calculadora não carregou a tempo")
    }

    func testAddButton() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("10")

        secondNum.tap()
        secondNum.typeText("5")

        app.buttons["addBtn"].tap()

        XCTAssertEqual(resultLabel.label, "15.0")
    }

    func testSubtractButton() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("10")

        secondNum.tap()
        secondNum.typeText("3")

        app.buttons["minusBtn"].tap()

        XCTAssertEqual(resultLabel.label, "7.0")
    }

    func testMultiplyButton() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("4")

        secondNum.tap()
        secondNum.typeText("5")

        app.buttons["multiplierBtn"].tap()

        XCTAssertEqual(resultLabel.label, "20.0")
    }

    func testDivideButton() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("20")

        secondNum.tap()
        secondNum.typeText("4")

        app.buttons["divisorBtn"].tap()

        XCTAssertEqual(resultLabel.label, "5.0")
    }

    func testDivideByZero() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("10")

        secondNum.tap()
        secondNum.typeText("0")

        app.buttons["divisorBtn"].tap()

        XCTAssertTrue(resultLabel.label == "inf" || resultLabel.label == "Error")
    }

    func testInvalidInput() throws {
        let app = XCUIApplication()
        app.launch()
        waitForCalculatorScreen(app: app)

        let firstNum = app.textFields["firstNumTxt"]
        let secondNum = app.textFields["secondNumTxt"]
        let resultLabel = app.staticTexts["result"]

        firstNum.tap()
        firstNum.typeText("abc")

        secondNum.tap()
        secondNum.typeText("5")

        app.buttons["addBtn"].tap()

        XCTAssertEqual(resultLabel.label, "Error: Invalid Number")
    }
}

