//
//  DefaultServerTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import Result
import SwiftyJSON
import XCTest


class DefaultServerTests: XCTestCase {
    
    var server: DefaultServer!
    
    override func setUp() {
        super.setUp()
        server = DefaultServer(protocolClass: MockURLProtocol.self)
    }
    
    override func tearDown() {
        MockURLProtocol.lastRequest = nil
        MockURLProtocol.nextResponse = nil
        super.tearDown()
    }
    
    
    // MARK: Request
    
    func testStandardNetworkRequest() {
        let expectation = self.expectation(description: "completion expectation")
        server.get(to: "endpoint", parameters: nil) { result in
            let request = MockURLProtocol.lastRequest!
            XCTAssertEqual(request.url?.absoluteString, "https://api.github.com/endpoint")
            XCTAssertEqual(request.allHTTPHeaderFields?["User-Agent"], "GitHubBrowserDemo")
            XCTAssertEqual(request.allHTTPHeaderFields?["Accept"], "application/vnd.github.v3+json")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    func testNetworkRequest_withCustomParameters() {
        let parameters = [
            URLQueryItem(name: "key", value: "value string")
        ]
        
        let expectation = self.expectation(description: "completion expectation")
        server.get(to: "endpoint", parameters: parameters) { result in
            let request = MockURLProtocol.lastRequest!
            XCTAssertEqual(request.url?.absoluteString, "https://api.github.com/endpoint?key=value%20string")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    
    // MARK: Response
    
    func testResponseSuccessful() {
        let url = URL(string: "https://api.github.com/endpoint")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        
        let responseBody: [String: Any] = ["success": true]
        let data = try! JSONSerialization.data(withJSONObject: responseBody, options: .prettyPrinted)
        MockURLProtocol.nextResponse = MockURLProtocol.Response.success(response, data)
        
        let expectation = self.expectation(description: "completion expectation")
        server.get(to: "endpoint", parameters: nil) { result in
            let response = try! result.dematerialize()
            let json = response.json
            XCTAssertEqual(json["success"].bool, true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    func testResponseError() {
        let userInfo = [NSLocalizedDescriptionKey: "The Internet connection appears to be offline."]
        let offlineError = NSError(domain: "NSURLErrorDomain", code: -1099, userInfo: userInfo)
        MockURLProtocol.nextResponse = MockURLProtocol.Response.error(offlineError)
        
        let expectation = self.expectation(description: "completion expectation")
        server.get(to: "endpoint", parameters: nil) { result in
            let error = result.error!
            XCTAssertEqual(error.message, "The Internet connection appears to be offline.")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
}
