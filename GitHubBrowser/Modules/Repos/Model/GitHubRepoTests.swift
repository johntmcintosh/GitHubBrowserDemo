//
//  GitHubRepoTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import SwiftyJSON
import XCTest


class GitHubRepoTests: XCTestCase {
    
    func testPhotoParsing_valid() {
        let json = jsonFromTestFile("orgs.square.repos...success[0].json")
        let repo = GitHubRepo(json: json)!
        
        let dateFormatter = ISO8601DateFormatter()
        
        XCTAssertEqual(repo.name, "html5")
        XCTAssertEqual(repo.fullName, "square/html5")
        XCTAssertEqual(repo.description, "A Rails plugin for playing around with HTML5.")
        XCTAssertEqual(repo.createdDate, dateFormatter.date(from: "2009-06-18T23:22:44Z"))
        XCTAssertEqual(repo.updatedDate, dateFormatter.date(from: "2016-04-30T14:29:45Z"))
        XCTAssertEqual(repo.stargazersCount, 8)
        XCTAssertEqual(repo.watchersCount, 7)
    }
}
