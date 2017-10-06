//
//  MockURLProtocol.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


/// Mock URLProtocol implementation used in testing the server implementation so that we can inspect requests and
/// trigger responses back through the server response handling.
class MockURLProtocol: URLProtocol {
    
    static var lastRequest: URLRequest?
    static var nextResponse: Response?
    
    enum Response {
        case success(URLResponse, Data)
        case error(Error)
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        lastRequest = request
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        DispatchQueue.main.async {
            guard let response = MockURLProtocol.nextResponse else {
                self.client?.urlProtocolDidFinishLoading(self)
                return
            }
            
            switch response {
            case .success(let urlResponse, let data):
                self.client?.urlProtocol(self, didReceive: urlResponse, cacheStoragePolicy: .notAllowed)
                self.client?.urlProtocol(self, didLoad: data)
                self.client?.urlProtocolDidFinishLoading(self)
            case .error(let error):
                self.client?.urlProtocol(self, didFailWithError: error)
            }
        }
    }
    
    override func stopLoading() {
        // Nothing to do
    }
}
