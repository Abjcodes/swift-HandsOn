//
//  ViewControllerTests.swift
//  loginTests
//
//  Created by P10 on 19/10/23.
//

import XCTest
@testable import login

final class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    override func setUpWithError() throws {
        print("Setup called")
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        print("teardown called")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewControllerObjectCreation() {
        XCTAssertNotNil(sut, "view controller is not initialized")
//        XCTAssertEqual(sut, <#T##expression2: Equatable##Equatable#>)
    }
    
    func testLogin_withEmptyData() {
        print("Test b completed")
    }
    
    func testShowAlert(){
        sut.show
    }
    
    func testD(){
        print("Test d completed")
    }
    
    

}
