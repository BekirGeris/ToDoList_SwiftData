//
//  ToDoListSwiftDataTests.swift
//  ToDoListSwiftDataTests
//
//  Created by Bekir Geriş on 5.10.2023.
//

import XCTest
import ToDoListSwiftData

final class ToDoListSwiftDataTests: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    let math = MathematicFunctions()
    
    func testAddIntegers() {
        let result = math.addIntegers(x: 5, y: 6)
        
        XCTAssertEqual(result, 11)
    }
    
    func testMultiplyIntegers() {
        let result = math.multiplyIntegers(x: 5, y: 6)
        
        XCTAssertEqual(result, 30)
    }
    
    func testDivideIntegers() {
        let result = math.divideIntegers(x: 10, y: 2)
        
        XCTAssertEqual(result, 5)
    }
}
