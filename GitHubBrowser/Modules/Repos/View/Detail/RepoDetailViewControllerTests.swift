//
//  RepoDetailViewControllerTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import SnapshotKit
import XCTest


class RepoDetailViewControllerTests: SnapshotKitTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testBasicView() {
        let vc = RepoDetailViewController(repo: MockRepo(), viewConfig: .mock())
        snapshot.fixed(size: iPhoneDeviceSize.iPhone6.resolution).verify(vc)
    }
}
