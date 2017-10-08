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
    
    enum RepoType: String {
        case all = "all"
        case publicType = "public"
        case privateType = "private"
        case fork = "forks"
        case sources = "sources"
        case member = "member"
    }
    
    func fetchPublicRepos(for organization: String, type: RepoType = .all, limit: Int? = nil, completion: @escaping (Result<[GitHubRepo], ServerError>) -> ()) {
        let typeParameter = URLQueryItem(name: "type", value: type.rawValue)
        server.get(to: Endpoint.Orgs(organization).repos, parameters: [typeParameter]) { result in
            switch result {
            case .success(let response):
                let parsedRepos = response.json.arrayValueForType(GitHubRepo.self) ?? []
                let repos = parsedRepos.lengthLimited(to: limit)
                completion(.success(repos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
