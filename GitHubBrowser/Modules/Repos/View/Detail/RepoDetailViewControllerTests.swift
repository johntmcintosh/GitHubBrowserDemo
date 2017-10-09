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
        let vc = RepoDetailViewController(repo: MockRepo())
        snapshot.fixed(size: iPhoneDeviceSize.iPhone6.resolution).verify(vc)
    }
}


private class MockRepo: RepoDisplayable {
    
    var name: String {
        return "repo"
    }
    
    var fullName: String {
        return "sample/repo"
    }
    
    var description: String? {
        return "In egestas nulla non tortor ultricies molestie. Etiam ante quam, efficitur a commodo sed, convallis eu nunc. Curabitur aliquam, nisl et sagittis pellentesque, magna lacus porta justo, eget dictum lectus ex eu dui."
    }
    
    var createdDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
    
    var stargazersCount: Int {
        return 120
    }
    
    var watchersCount: Int {
        return 18
    }
}
