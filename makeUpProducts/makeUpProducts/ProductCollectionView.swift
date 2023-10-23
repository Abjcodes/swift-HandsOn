//
//  ProductCollectionView.swift
//  makeUpProducts
//
//  Created by P10 on 23/10/23.
//

import UIKit

extension DetailProductView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedProductColors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let color = selectedProductColors[indexPath.item]
        cell.colorName.text = color.colour_name
        cell.color.backgroundColor = UIColor(named: color.hex_value!)
        return cell
    }
}
