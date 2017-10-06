//
//  GitHubRepoService.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation
import Result


class GitHubRepoService {
    
    let server: Server
    
    init(server: Server = DefaultServer()) {
        self.server = server
    }
    
    func fetchPublicRepos(for organization: String, completion: @escaping (Result<[GitHubRepo], ServerError>) -> ()) {
        server.get(to: Endpoint.Orgs(organization).repos, parameters: nil) { result in
            switch result {
            case .success(let response):
                // TODO: Implement response parsing
                completion(.success([]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
