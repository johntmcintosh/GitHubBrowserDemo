//
//  RepoListFilter.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/9/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


struct RepoListFilter {
    
    func searchResults(for term: String, in list: [RepoDisplayable]) -> [RepoDisplayable] {
        guard !term.isEmpty else {
            return list
        }
        
        return list.filter({
            return $0.name.lowercased().range(of: term.lowercased()) != nil
        })
    }
}
