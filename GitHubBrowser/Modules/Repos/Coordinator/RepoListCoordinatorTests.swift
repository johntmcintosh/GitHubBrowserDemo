//
//  RepoListCoordinatorTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import Result
import XCTest


class RepoListCoordinatorTests: XCTestCase {
    
    private var navigtionController: UINavigationController!
    private var repoService: MockRepoService!
    private var coordinator: RepoListCoordinator!
    
    override func setUp() {
        super.setUp()
        
        navigtionController = UINavigationController()
        UIApplication.shared.keyWindow?.rootViewController = navigtionController
        
        repoService = MockRepoService()
        coordinator = RepoListCoordinator(navigationController: navigtionController, repoService: repoService)
        coordinator.start()
    }
    
    // MARK: Start
    
    func testStart_presentsList() {
        XCTAssertEqual(navigtionController.viewControllers.count, 1)
        
        XCTAssertTrue(navigtionController.topViewController is RepoListViewController)
    }
    
    func testStart_autoFetches() {
        XCTAssertTrue(repoService.fetchTriggered)
    }
    
    
    // MARK: List fetching
    
    func testFetchingListSuccess_updatesViewController() {
        repoService.nextResponse = .success([MockRepo()])
        
        let expectation = self.expectation(description: "Completion expectation")
        coordinator.fetchRepoList {
            XCTAssertEqual(self.coordinator.listVC.repos.count, 1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    func testFetchingListFailure_presentsError() {
        repoService.nextResponse = .failure(ServerError(NSError.make()))
        
        let expectation = self.expectation(description: "Completion expectation")
        coordinator.fetchRepoList {
            XCTAssertTrue(self.coordinator.listVC.presentedViewController is UIAlertController)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
}


private class MockRepoService: GitHubRepoServicing {
    
    var fetchTriggered: Bool = false
    var nextResponse: Result<[RepoDisplayable], ServerError>?
    
    func fetchPublicRepos(for organization: String, type: RepoType, limit: Int?, completion: @escaping (Result<[RepoDisplayable], ServerError>) -> ()) {
        fetchTriggered = true
        if let response = nextResponse {
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}


private extension NSError {
    
    static func make() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: "Mock error"]
        return NSError(domain: "com.flickrdemo.tests", code: 1, userInfo: userInfo)
    }
}

