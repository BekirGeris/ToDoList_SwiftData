//
//  ToDoListSwiftDataUITests.swift
//  ToDoListSwiftDataUITests
//
//  Created by Bekir Geriş on 5.10.2023.
//

import XCTest

final class ToDoListSwiftDataUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddItem() throws {
        // UI tests must launch the application that they tes
        let app = XCUIApplication()
        let collectionViews = app.collectionViews
        app.launch()
        
        let addTodoButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Add ToDo"]
        let saveButton = app.navigationBars["Add ToDo"].buttons["Save"]
        let nameField = collectionViews.textFields["Name"]
        let priorityField = collectionViews.textFields["Priority"]
        
        addTodoButton.tap()
        
        nameField.tap()
        nameField.typeText("bekbek")
        priorityField.tap()
        priorityField.typeText("123")
        
        saveButton.tap()
                        
        let item = collectionViews.buttons["bekbek, 123"]
        
        XCTAssertTrue(item.exists)
    }
    
    func testDeleteItem() throws {
        let app = XCUIApplication()
        let collectionViews = app.collectionViews
        app.launch()
        
        let addTodoButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Add ToDo"]
        let saveButton = app.navigationBars["Add ToDo"].buttons["Save"]
        let deleteButton = collectionViews.buttons["Delete"]
        let nameField = collectionViews.textFields["Name"]
        let priorityField = collectionViews.textFields["Priority"]
        
        addTodoButton.tap()
        
        nameField.tap()
        nameField.typeText("bekbek")
        priorityField.tap()
        priorityField.typeText("1234")
        
        saveButton.tap()
                        
        let item = collectionViews.buttons["bekbek, 1234"]
        
        XCTAssertTrue(item.exists)
        
        item.swipeLeft()
        deleteButton.tap()
        
        XCTAssertTrue(!item.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
