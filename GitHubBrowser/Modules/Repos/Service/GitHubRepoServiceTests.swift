//
//  GitHubRepoServiceTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import XCTest


class GitHubRepoServiceTests: XCTestCase {
    
    var server: MockServer!
    var service: GitHubRepoService!
    
    
    override func setUp() {
        super.setUp()
        server = MockServer()
        service = GitHubRepoService(server: server)
    }
    
    func testFetchRepos_request() {
        let expectation = self.expectation(description: "Completion expectation")
        service.fetchPublicRepos(for: "square") { result in
            self.server.assertLastRequestEquals(Endpoint.Orgs("square").repos)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    func testFetchRepos_responseSuccess() {
        server.queueNextResponse(localTestFile: "orgs.square.repos...success.json")
        
        let expectation = self.expectation(description: "Completion expectation")
        service.fetchPublicRepos(for: "square") { result in
            let repos = try! result.dematerialize()
            XCTAssertEqual(repos.count, 30)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    func testFetchRepos_responseError() {
        server.nextResponse = .failure(ServerError("error message"))
        
        let expectation = self.expectation(description: "Completion expectation")
        service.fetchPublicRepos(for: "square") { result in
            let error = result.error!
            XCTAssertEqual(error.message, "error message")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
}
