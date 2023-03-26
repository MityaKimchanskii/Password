//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Mitya Kim on 3/26/23.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    
    func testShort() throws { // 7
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("1234567"))
    }
    
    func testLong() throws { // 33
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("123456789234567465878675953456t34t4343452334r"))
    }
    
    func testValidShort() throws { // 8
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345678"))
    }
    
    func testValidLong() throws { // 32
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345678901234567890123456789012"))
    }
}


class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a b"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lenghtAndNoSpaceMet("12345678"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lenghtAndNoSpaceMet("123456 78"))
    }
    
    func testUpperCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("Add"))
    }
    
    func testUpperCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("adfg"))
    }
    
    func testLowerCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("asf"))
    }
    
    func testLowerCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("AAA"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("q23"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("aaa"))
    }
    
    func testSpecialCharMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("!sf"))
    }
    
    func testSpecialCharNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("aaa"))
    }
}
