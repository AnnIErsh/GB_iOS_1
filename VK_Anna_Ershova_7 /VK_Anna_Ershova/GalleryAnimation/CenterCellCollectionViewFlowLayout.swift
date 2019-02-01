//
//  CenterCellCollectionViewFlowLayout.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 1/31/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

import UIKit

class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    // MARK: Public
    private var mostRecentOffset = CGPoint()
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard velocity.x != 0 else {
            return mostRecentOffset
        }
        
        guard let collectionView = collectionView else {
            mostRecentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
            return mostRecentOffset
        }
        
        let bounds = collectionView.bounds
        
        guard let attributesForVisibleCells = layoutAttributesForElements(in: bounds) else { return mostRecentOffset }
        
        let halfWidth = bounds.size.width / 2.0
        
        let _candidateAttributes = candidateAttributes(attributesForVisibleCells: attributesForVisibleCells, velocity: velocity, halfWidth: halfWidth)
        
        if proposedContentOffset.x == -collectionView.contentInset.left {
            return proposedContentOffset
        }
        
        guard let candidateAttr = _candidateAttributes else {
            return mostRecentOffset
        }
        
        mostRecentOffset = CGPoint(x: floor(candidateAttr.center.x - halfWidth), y: proposedContentOffset.y)
        return mostRecentOffset
    }
    
    
    
    
    // MARK: Private
    
    private func candidateAttributes(attributesForVisibleCells: [UICollectionViewLayoutAttributes], velocity: CGPoint, halfWidth: CGFloat) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        
        var candidateAttributes: UICollectionViewLayoutAttributes?
        for attributes in attributesForVisibleCells {
            if !isCell(attributes: attributes) {
                continue
            }
            
            if (attributes.center.x == 0) || (attributes.center.x > (collectionView.contentOffset.x + halfWidth) && velocity.x < 0) {
                continue
            }
            
            candidateAttributes = attributes
        }
        
        return candidateAttributes
    }
    
    private func isCell(attributes: UICollectionViewLayoutAttributes) -> Bool {
        return attributes.representedElementCategory == .cell
    }
}
