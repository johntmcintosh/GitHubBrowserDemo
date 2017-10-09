//
//  RepoDisplayable.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


protocol RepoDisplayable {
    
    var name: String { get }
    var fullName: String { get }
    var description: String? { get }
    var createdDate: Date { get }
    var updatedDate: Date { get }
    var stargazersCount: Int { get }
    var forksCount: Int { get }
}
