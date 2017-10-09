//
//  RepoCountFormatterTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import XCTest


class RepoCountFormatterTests: XCTestCase {
    
    let formatter = RepoCountFormatter(legend: "★")
    
    func testZero() {
        let string = formatter.string(for: 0)
        XCTAssertEqual(string, "0 ★")
    }
    
    func testSmallNumber() {
        let string = formatter.string(for: 10)
        XCTAssertEqual(string, "10 ★")
    }
    
    func testLargeNumber() {
        let string = formatter.string(for: 12345)
        XCTAssertEqual(string, "12,345 ★")
    }
}
