//
//  RepoListCollectionViewCell.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


// NOTE: For a production app, I'd likely implement the content view of the UICollectionViewCell as it's own view and
// then add it as a subview so there was more flexibility in case it also needed to be displayed in other contexts.
// However, for simplicity in this demo app, I'm implementing it directly in the UICollectionViewCell subclass.
class RepoListCollectionViewCell: UICollectionViewCell {
    
    static let nibName = "RepoListCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var highlightedColor: UIColor {
        return UIColor(white: 0.95, alpha: 1.0)
    }
    
    var defaultColor: UIColor {
        return .white
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = (isHighlighted) ? highlightedColor : defaultColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = (isSelected) ? highlightedColor : defaultColor
        }
    }
}
