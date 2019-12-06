//
//  CanaryApparelUITests.swift
//  CanaryApparelUITests
//
//  Created by nathan boamah on 06/12/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import XCTest

class CanaryApparelUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testExample1() {
        
        let app = XCUIApplication()
        app.buttons["SIGN IN"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["Email"].tap()
        
        let passwordSecureTextField = elementsQuery.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["LOGIN"]/*[[".buttons[\"LOGIN\"].staticTexts[\"LOGIN\"]",".staticTexts[\"LOGIN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
         
        
    }
    
   
    func testExample2() {
       
        
        let app = XCUIApplication()
        app.buttons["SIGN IN"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.textFields["Email"].tap()
        
        let passwordSecureTextField = elementsQuery.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["LOGIN"]/*[[".buttons[\"LOGIN\"].staticTexts[\"LOGIN\"]",".staticTexts[\"LOGIN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        scrollViewsQuery.otherElements.containing(.image, identifier:"holiday").children(matching: .button).element(boundBy: 0).tap()
        app.navigationBars["CanaryApparel.ProductGalleryView"].buttons["Back"].tap()
        app.navigationBars["CanaryApparel.SearchView"].buttons["Back"].tap()
        app.navigationBars["CanaryApparel.SignInView"].buttons["Back"].tap()
        app.tabBars.buttons["Account"].tap()
        app.buttons["SIGN OUT"].tap()
        
    }
    

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
