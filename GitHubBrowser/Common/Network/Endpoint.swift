//
//  Endpoint.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


struct Endpoint {
    
    struct Orgs {

        let organization: String
        
        init(_ organization: String) {
            self.organization = organization
        }
        
        var repos: String {
            return "orgs/\(organization)/repos"
        }
    }
}
