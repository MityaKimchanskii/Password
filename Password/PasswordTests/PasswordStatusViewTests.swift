//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Mitya Kim on 3/26/23.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "123456!Aa"
    let tooShort = "123!aA"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isChekMarkImage)
    }
    
    func testTooShort()  throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isResetImage)
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "123456!Aa"
    let tooShort = "123!aA"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isChekMarkImage)
    }
    
    func testTooShort()  throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isXmarkImage)
    }
}

class PasswordStatusViewTests_Validate_Three_of_Four: XCTestCase {
    var statusView: PasswordStatusView!
    let twoOfFour = "12345678A"
    let threeOfFour = "1234567Aa"
    let fourOfFour = "12345678Aa!"
    
    // Verify is valid if three of four criteria met
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    
    func testTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    
    func testThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }
    
    func testFourOfFour() throws {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}
