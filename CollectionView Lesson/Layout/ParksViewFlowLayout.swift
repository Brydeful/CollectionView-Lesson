//
//  ParksViewFlowLayout.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 09.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class ParksViewFlowLayout: UICollectionViewFlowLayout {
    
    var appearingIndexPath: IndexPath?
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let indexPath = appearingIndexPath, indexPath ==  itemIndexPath else {return nil}
        attributes.alpha = 1.0
        attributes.center = CGPoint(x: collectionView!.frame.width - 24, y: -24)
        attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attributes.zIndex = 5
        
        return attributes
    }
}
