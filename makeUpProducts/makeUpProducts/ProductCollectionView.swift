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
        cell.colorName.text = color.colourName
        // convert hex code to ui color
        if let hexValue = color.hexValue {
               cell.color.backgroundColor = colorFromHex(hexValue)
           } else {
               cell.color.backgroundColor = .clear
           }
        return cell
    }
    
    func colorFromHex(_ hex: String) -> UIColor? {
            var cleanHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            cleanHex = cleanHex.replacingOccurrences(of: "#", with: "")
            
            var rgb: UInt64 = 0
            
            Scanner(string: cleanHex).scanHexInt64(&rgb)
            
            let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgb & 0x0000FF) / 255.0
            
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    
}
