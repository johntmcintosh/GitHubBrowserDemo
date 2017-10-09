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
    
    @IBOutlet weak var forksLabel: UILabel! {
        didSet {
            forksLabel.text = forksFormatter.string(for: repo.forksCount)
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

    @IBOutlet weak var createdLabel: UILabel! {
        didSet {
            let date = dateFormatter.string(from: repo.createdDate)
            createdLabel.text = String(format: NSLocalizedString("Created: %@", comment: ""), date)
        }
    }

    @IBOutlet weak var updatedLabel: UILabel! {
        didSet {
            let date = dateFormatter.string(from: repo.updatedDate)
            updatedLabel.text = String(format: NSLocalizedString("Last updated: %@", comment: ""), date)
        }
    }

    
    // MARK: Properties
    
    let repo: RepoDisplayable
    let viewConfig: ViewConfig
    
    private lazy var forksFormatter: RepoCountFormatter = {
        return RepoCountFormatter(legend: "🍴", viewConfig: self.viewConfig)
    }()
    
    private lazy var stargazersFormatter: RepoCountFormatter = {
        return RepoCountFormatter(legend: "⭐", viewConfig: self.viewConfig)
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = self.viewConfig.locale
        formatter.timeZone = self.viewConfig.timeZone
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    
    // MARK: Initializers
    
    init(repo: RepoDisplayable, viewConfig: ViewConfig = .standard()) {
        self.repo = repo
        self.viewConfig = viewConfig
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
