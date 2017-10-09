//
//  RepoListViewController.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


protocol RepoListViewControllerDelegate: class {
    
    func didTriggerRefresh(in viewController: RepoListViewController)
    func didSelect(repo: RepoDisplayable, in viewController: RepoListViewController)
}


class RepoListViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: RepoListViewControllerDelegate?
    private(set) var repos: [RepoDisplayable] = []

    private static let repoCellIdentifier = "RepoListCell"
    private let stargazerFormatter = RepoCountFormatter(legend: "★")
    
    
    // MARK: Outlets and Views
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: RepoListCollectionViewCell.nibName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: RepoListViewController.repoCellIdentifier)
            collectionView.addSubview(refreshControl)
            if let layout = collectionView.collectionViewLayout as? RepoListCollectionViewLayout {
                layout.itemHeight = 60.0
                layout.separatorHeight = 1.0
                layout.separatorColor = UIColor(white: 0.9, alpha: 1.0)
            }
        }
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshTriggered), for: .valueChanged)
        return refresh
    }()

    
    // MARK: View Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("Square First 20 Repositories", comment: "")
        clearBackButtonTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for indexPath in collectionView.indexPathsForSelectedItems ?? [] {
            collectionView.deselectItem(at: indexPath, animated: animated)
        }
    }
    
    
    // MARK: Public
    
    func set(isRefreshing: Bool) {
        if isRefreshing {
            loadViewIfNeeded()
            refreshControl.beginRefreshing()
            if repos.isEmpty {
                let offset = CGPoint(x: 0, y: -refreshControl.bounds.height)
                collectionView?.setContentOffset(offset, animated: true)
            }
        }
        else {
            refreshControl.endRefreshing()
        }
    }
    
    func set(repos: [RepoDisplayable]) {
        self.repos = repos
        collectionView?.reloadData()
    }
    
    func show(error: ServerError) {
        // NOTE: In a production app, we would likely want to display errors in an inline
        // view rather than presenting an alert with the message.
        presentOkAlert(message: error.message)
    }
    
    
    // MARK: Actions
    
    @objc func refreshTriggered() {
        delegate?.didTriggerRefresh(in: self)
    }
}


extension RepoListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepoListViewController.repoCellIdentifier, for: indexPath) as! RepoListCollectionViewCell
        
        let repo = repos[indexPath.row]
        cell.titleLabel.text = repo.fullName
        cell.detailLabel.text = stargazerFormatter.string(for: repo.stargazersCount)
        
        return cell
    }
}


extension RepoListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let repo = repos[indexPath.row]
        delegate?.didSelect(repo: repo, in: self)
    }
}
