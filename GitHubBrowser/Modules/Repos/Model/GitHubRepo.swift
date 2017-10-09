//
//  GitHubRepo.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation
import SwiftyJSON


/// Model representation of a single Repo from the GitHub API.
struct GitHubRepo {
    
    var name: String
    var fullName: String
    var description: String?
    var createdDate: Date
    var updatedDate: Date
    var stargazersCount: Int
    var watchersCount: Int
}


// NOTE: Now that we have Swift 4, I would consider replacing this `JSONInstantiable` pattern with the now-system-provided
// Codable protocol. However, I haven't had a chance yet to work with that pattern, so I'm using the pattern I have
// traditionally used for now. Also, I typically would use the tool [sourcery](https://github.com/krzysztofzablocki/Sourcery)
// to auto-generate the implementation for each model object's JSONInstantiable conformance, but I'm doing it manually
// here for simplicity.
extension GitHubRepo: JSONInstantiable {
    
    init?(json: JSON) {
        guard let name = json["name"].string else { return nil }
        self.name = name

        guard let fullName = json["full_name"].string else { return nil }
        self.fullName = fullName

        let description = json["description"].string
        self.description = description

        guard let createdDate = json["created_at"].dateFromISO8601Sting else { return nil }
        self.createdDate = createdDate

        guard let updatedDate = json["updated_at"].dateFromISO8601Sting else { return nil }
        self.updatedDate = updatedDate

        guard let stargazersCount = json["stargazers_count"].int else { return nil }
        self.stargazersCount = stargazersCount

        guard let watchersCount = json["watchers_count"].int else { return nil }
        self.watchersCount = watchersCount
    }
}
