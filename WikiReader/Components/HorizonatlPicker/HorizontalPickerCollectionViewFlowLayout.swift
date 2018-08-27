//
//  HorizontalPickerCollectionViewFlowLayout.swift
//  WikiReader
//
//  Created by Višeslav Šako on 16/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation
import UIKit

class HorizontalPickerCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private var firstSetupDone = false
    private let smallItemScale: CGFloat = 0.5
    private let smallItemAlpha: CGFloat = 0.2
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            setup()
            firstSetupDone = true
        }
    }
    
    private func setup() {
        scrollDirection = .horizontal
        minimumLineSpacing = 16
        minimumInteritemSpacing = 16
        itemSize = CGSize(width: 256, height: 80)
        let sideMargin = (UIScreen.main.bounds.size.width - itemSize.width )/2
        sectionInset = UIEdgeInsetsMake(0, sideMargin, 0, sideMargin)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let layoutAttributes = layoutAttributesForElements(in: collectionView!.bounds)
        
        let centerOffset = collectionView!.bounds.size.width / 2
        let offsetWithCenter = proposedContentOffset.x + centerOffset
        
        let closestAttribute = layoutAttributes!
            .sorted { abs($0.center.x - offsetWithCenter) < abs($1.center.x - offsetWithCenter) }
            .first ?? UICollectionViewLayoutAttributes()
        
        return CGPoint(x: closestAttribute.center.x - centerOffset, y: 0)
    }
}
