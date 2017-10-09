//
//  RepoDetailViewController.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


class RepoDetailViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var watchersLabel: UILabel! {
        didSet {
            watchersLabel.text = watchersFormatter.string(for: repo.watchersCount)
        }
    }
    
    @IBOutlet weak var stargazersLabel: UILabel! {
        didSet {
            stargazersLabel.text = stargazersFormatter.string(for: repo.stargazersCount)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = repo.name
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = repo.description
        }
    }
    
    
    // MARK: Properties
    
    let repo: RepoDisplayable
    
    private lazy var watchersFormatter: RepoCountFormatter = {
        return RepoCountFormatter(legend: "👀")
    }()
    
    private lazy var stargazersFormatter: RepoCountFormatter = {
        return RepoCountFormatter(legend: "⭐")
    }()

    
    // MARK: Initializers
    
    init(repo: RepoDisplayable) {
        self.repo = repo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = repo.fullName
    }
}
