//
//  RepoListFilterTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/9/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import XCTest


class RepoListFilterTests: XCTestCase {
    
    let filter = RepoListFilter()
    
    func testFilterAlgorithm_emptyInput() {
        let repos = [
            MockRepo(name: "apple"),
            MockRepo(name: "banana"),
            MockRepo(name: "cherry"),
            MockRepo(name: "dragonfruit")
        ]
        let results = filter.searchResults(for: "", in: repos)
        let strings = results.map { $0.name }
        XCTAssertEqual(strings, ["apple", "banana", "cherry", "dragonfruit"])
    }
    
    func testFilterAlgorithm_matchingInput() {
        let repos = [
            MockRepo(name: "apple"),
            MockRepo(name: "banana"),
            MockRepo(name: "cherry"),
            MockRepo(name: "dragonfruit")
        ]
        let results = filter.searchResults(for: "ppl", in: repos)
        let strings = results.map { $0.name }
        XCTAssertEqual(strings, ["apple"])
    }
    
    func testFilterAlgorithm_caseMismatch() {
        let repos = [
            MockRepo(name: "apple"),
            MockRepo(name: "banana"),
            MockRepo(name: "cherry"),
            MockRepo(name: "dragonfruit")
        ]
        let results = filter.searchResults(for: "BAN", in: repos)
        let strings = results.map { $0.name }
        XCTAssertEqual(strings, ["banana"])
    }
}
