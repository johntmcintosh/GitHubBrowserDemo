//
//  MockRepo.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import Foundation


class MockRepo: RepoDisplayable {
    
    var name: String
    
    var fullName: String {
        return "sample/\(name)"
    }
    
    var description: String? {
        return "In egestas nulla non tortor ultricies molestie. Etiam ante quam, efficitur a commodo sed, convallis eu nunc. Curabitur aliquam, nisl et sagittis pellentesque, magna lacus porta justo, eget dictum lectus ex eu dui."
    }
    
    var createdDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
    
    var updatedDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
    
    var stargazersCount: Int {
        return 120
    }
    
    var forksCount: Int {
        return 18
    }
    
    init(name: String = "repo") {
        self.name = name
    }
}
