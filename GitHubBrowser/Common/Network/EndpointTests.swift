//
//  EndpointTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import XCTest


class EndpointTests: XCTestCase {
    
    func testOranizationRepos() {
        let endpoint = Endpoint.Orgs("square").repos
        XCTAssertEqual(endpoint, "orgs/square/repos")
    }
}
