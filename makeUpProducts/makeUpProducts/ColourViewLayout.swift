//
//  ColourViewLayout.swift
//  makeUpProducts
//
//  Created by P10 on 23/10/23.
//

import UIKit

class ColourViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
       super.prepare()
       
       guard let collectionView = collectionView else { return }
       
       let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right
       let widthPerItem = (availableWidth - minimumInteritemSpacing) / 2
       
       itemSize = CGSize(width: widthPerItem, height: itemSize.height)
    }
}
