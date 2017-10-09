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
        
        vc.set(repos: [
            MockRepo(),
            MockRepo(),
            MockRepo(),
            MockRepo(),
            ])
        vc.loadViewIfNeeded()
        vc.collectionView.reloadData()
        
        snapshot.fixed(size: iPhoneDeviceSize.iPhone6.resolution).verify(vc)
    }
}
