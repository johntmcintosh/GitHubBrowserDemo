//
//  RepoListViewController.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


class RepoListViewController: UIViewController {
    
    private static let repoCellIdentifier = "RepoListCell"
    private let stargazerFormatter = RepoCountFormatter(legend: "★")
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: RepoListCollectionViewCell.nibName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: RepoListViewController.repoCellIdentifier)
            if let layout = collectionView.collectionViewLayout as? RepoListCollectionViewLayout {
                layout.itemHeight = 60.0
                layout.separatorHeight = 1.0
                layout.separatorColor = UIColor(white: 0.9, alpha: 1.0)
            }
        }
    }
    
    var repos: [RepoDisplayable] = []
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
    
    // TODO: Implement list selection
}
