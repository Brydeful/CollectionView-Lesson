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
    var disapperingIndexPath: [IndexPath]?
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let indexPath = appearingIndexPath, indexPath ==  itemIndexPath else {return nil}
        attributes.alpha = 1.0
        attributes.center = CGPoint(x: collectionView!.frame.width - 24, y: -24)
        attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attributes.zIndex = 5
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var cache = [UICollectionViewLayoutAttributes]()
        
        if let layoutAttributes = super.layoutAttributesForElements(in: rect){
            for attributes in layoutAttributes{
                let cellAttributes = attributes.copy() as! UICollectionViewLayoutAttributes
                if attributes.representedElementKind == nil{
                    let frame = cellAttributes.frame
                    cellAttributes.frame = frame.insetBy(dx: 2.0, dy: 2.0)
                }
                cache.append(cellAttributes)
            }
        }
        return cache
    }
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath),  let indexPaths = disapperingIndexPath, indexPaths.contains(itemIndexPath) else {return nil}
        attributes.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: -CGFloat.pi / 4)
        return attributes
    }
}
