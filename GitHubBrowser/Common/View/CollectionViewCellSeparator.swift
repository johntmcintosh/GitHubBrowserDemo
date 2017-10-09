//
//  CollectionViewCellSeparator.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


class CollectionViewCellSeparator: UICollectionReusableView {
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        if let attributes = layoutAttributes as? CellSeparatorLayoutAttributes {
            backgroundColor = attributes.color
        }
    }
}
