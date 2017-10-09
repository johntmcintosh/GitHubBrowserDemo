//
//  RepoListViewControllerTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import SnapshotKit
import XCTest


class RepoListViewControllerTests: SnapshotKitTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testBasicList() {
        let vc = RepoListViewController()
        
        vc.repos = [
            MockRepo(),
            MockRepo(),
            MockRepo(),
            MockRepo(),
        ]
        vc.loadViewIfNeeded()
        vc.collectionView.reloadData()
        
        snapshot.fixed(size: iPhoneDeviceSize.iPhone6.resolution).verify(vc)
    }
}


private class MockRepo: RepoDisplayable {
    
    var name: String {
        return "sample/repo"
    }
    
    var createdDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
    
    var stargazersCount: Int {
        return 120
    }
}
