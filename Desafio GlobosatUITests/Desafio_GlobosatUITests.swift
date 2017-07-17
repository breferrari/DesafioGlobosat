//
//  Desafio_GlobosatUITests.swift
//  Desafio GlobosatUITests
//
//  Created by Brenno Ferrari on 13/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import XCTest

class Desafio_GlobosatUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    func testCantLoginToHomeScreen() {
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        
        let okAlertButton = app.alerts.buttons["OK"]
        okAlertButton.tap()
    }
    
    func testCanLoginToHomeScreenAndLogout() {
        
        let textfield = app.textFields.element(boundBy: 0)
        textfield.tap()
        textfield.typeText("desafio\nroot\n")
        
        let logoutButton = app.navigationBars.buttons["Logout"]
        logoutButton.tap()
        
        let yesAlertButton = app.alerts.buttons["Yes"]
        yesAlertButton.tap()
        
        sleep(5)

    }
    
}
