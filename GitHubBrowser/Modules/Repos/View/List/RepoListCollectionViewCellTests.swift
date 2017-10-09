//
//  RepoListCollectionViewCellTests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import SnapshotKit
import XCTest


class RepoListCollectionViewCellTests: SnapshotKitTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testStandardCell() {
        let cell = RepoListCollectionViewCell.make()
        
        cell.titleLabel.text = "square/repo"
        cell.detailLabel.text = "1.2k ★"
        
        snapshot.fixed(size: CGSize(width: 375.0, height: 60.0)).verify(cell)
    }
    
    func testTitleOverflow() {
        let cell = RepoListCollectionViewCell.make()

        cell.titleLabel.text = "square/repowithareallycomicallylongname"
        cell.detailLabel.text = "1.2k ★"

        snapshot.fixed(size: CGSize(width: 375.0, height: 60.0)).verify(cell)
    }
}


private extension RepoListCollectionViewCell {
    
    class func make() -> RepoListCollectionViewCell {
        let cell = UINib(nibName: "RepoListCollectionViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RepoListCollectionViewCell
        return cell
    }
}
