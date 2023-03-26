//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Mitya Kim on 3/26/23.
//

import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "1234567!Aa"
    let tooShort = "dlsg"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = "^"
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Your password must meet the requirements below")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "")
    }
}


class ViewControllerTests_ConfirmPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "1234567!Aa"
    let tooShort = "dlsg"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Enter your password")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Passwords do not match.")
    }
    
    func testPasswordMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "1234567!Aa"
    let tooShort = "dlsg"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success")
    }
    
    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordTapped(UIButton())
        
        XCTAssertNil(vc.alert)
    }
}
