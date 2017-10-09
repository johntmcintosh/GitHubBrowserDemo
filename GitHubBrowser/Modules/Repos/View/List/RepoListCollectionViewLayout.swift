//
//  RepoListCollectionViewLayout.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


class RepoListCollectionViewLayout: UICollectionViewFlowLayout {
    
    static let viewKindSeparator = "Separator"
    
    var itemHeight: CGFloat = 40.0
    
    var separatorColor: UIColor?
    
    var separatorHeight: CGFloat {
        get { return minimumLineSpacing }
        set { minimumLineSpacing = newValue }
    }
    
    
    // MARK: Initializers
    
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        scrollDirection = .vertical
        register(CollectionViewCellSeparator.self, forDecorationViewOfKind: RepoListCollectionViewLayout.viewKindSeparator)
        separatorHeight = 1.0
        separatorColor = .lightGray
    }
    
    
    // MARK: Layout
    
    override var itemSize: CGSize {
        set {
            // This is a fixed-size layout, so don't allow custom sizes to be set.
        }
        get {
            guard let collectionView = collectionView else {
                return .zero
            }
            return CGSize(width: collectionView.bounds.width, height: itemHeight)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let superLayoutAttributes = super.layoutAttributesForElements(in: rect) ?? []
        
        // Create separator lines before every cell but the first
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        for layoutAttributes in superLayoutAttributes {
            let indexPath = layoutAttributes.indexPath
            if indexPath.item > 0 {
                let cellFrame = layoutAttributes.frame
                let separatorAttributes = CellSeparatorLayoutAttributes(forDecorationViewOfKind: RepoListCollectionViewLayout.viewKindSeparator, with: indexPath)
                separatorAttributes.color = separatorColor
                separatorAttributes.frame = CGRect(x: cellFrame.minX,
                                                   y: cellFrame.minY - separatorHeight,
                                                   width: cellFrame.width,
                                                   height: separatorHeight)
                separatorAttributes.zIndex = 1000
                decorationAttributes.append(separatorAttributes)
            }
        }
        
        return superLayoutAttributes + decorationAttributes
    }
    
    override func initialLayoutAttributesForAppearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return layoutAttributesForDecorationView(ofKind:RepoListCollectionViewLayout.viewKindSeparator, at: decorationIndexPath)
    }
}

