//
//  RepoListCoordinator.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation
import UIKit


/// The coordinator is a "flow controller" type object responsible for coordinating
/// access to data from external sources and presentation of views to the user.
/// Pulling this out of the view controller allows the view controllers to be
/// more straightforward, more data-driver, and more testable.
class RepoListCoordinator {
    
    fileprivate let navigationController: UINavigationController
    fileprivate let repoService: GitHubRepoServicing
    
    lazy var listVC: RepoListViewController = {
        let vc = RepoListViewController()
        vc.delegate = self
        return vc
    }()
    
    
    // MARK: Initializer
    
    init(navigationController: UINavigationController, repoService: GitHubRepoServicing = GitHubRepoService()) {
        self.navigationController = navigationController
        self.repoService = repoService
    }
    
    
    // MARK: Primary
    
    func start() {
        navigationController.setViewControllers([listVC], animated: false)
        fetchRepoList()
    }
    
    func fetchRepoList(completion: (() -> ())? = nil) {
        listVC.set(isRefreshing: true)
        repoService.fetchPublicRepos(for: "square", type: .sources, limit: 20) { result in
            self.listVC.set(isRefreshing: false)
            switch result {
            case .success(let repos):
                self.listVC.set(repos: repos)
                completion?()
            case .failure(let error):
                self.listVC.show(error: error)
                completion?()
            }
        }
    }
}


extension RepoListCoordinator: RepoListViewControllerDelegate {
    
    func didTriggerRefresh(in viewController: RepoListViewController) {
        fetchRepoList()
    }
    
    func didSelect(repo: RepoDisplayable, in viewController: RepoListViewController) {
        let vc = RepoDetailViewController(repo: repo)
        navigationController.pushViewController(vc, animated: true)
    }
}
