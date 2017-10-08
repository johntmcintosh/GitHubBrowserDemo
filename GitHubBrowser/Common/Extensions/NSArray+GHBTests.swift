//
//  NSArray+GHBTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import XCTest


class NSArray_GHBTests: XCTestCase {
    
    func testNilLimit() {
        let input = [1, 2, 3]
        let output = input.lengthLimited(to: nil)
        XCTAssertEqual(output, [1, 2, 3])
    }
    
    func testEmptyArray() {
        let input: [Int] = []
        let output = input.lengthLimited(to: nil)
        XCTAssertEqual(output, [])
    }
    
    func testZeroLimit() {
        let input = [1, 2, 3]
        let output = input.lengthLimited(to: 0)
        XCTAssertEqual(output, [])
    }
    
    func testLimitGreaterThanArraySize() {
        let input = [1, 2, 3]
        let output = input.lengthLimited(to: 5)
        XCTAssertEqual(output, [1, 2, 3])
    }
    
    func testLimitLessThanArraySize() {
        let input = [1, 2, 3]
        let output = input.lengthLimited(to: 1)
        XCTAssertEqual(output, [1])
    }
    
    func testLimitEqualToArraySize() {
        let input = [1, 2, 3]
        let output = input.lengthLimited(to: 3)
        XCTAssertEqual(output, [1, 2, 3])
    }
}
