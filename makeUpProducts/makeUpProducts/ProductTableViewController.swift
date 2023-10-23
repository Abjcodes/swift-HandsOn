//
//  ProductTableViewController.swift
//  makeUpProducts
//
//  Created by P10 on 23/10/23.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredProductsArr.count
        } else {
            return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        let product: ProductResponse
        
        if isFiltering() {
            product = filteredProductsArr[indexPath.row]
        } else {
            product = products[indexPath.row]
        }
        
        configureCell(cell, with: product)
        
        return cell
    }
    
    func configureCell(_ cell: ProductTableViewCell, with product: ProductResponse) {
        if let name = product.name {
            cell.productName.text = name
        }
        
        if let price = product.price, let priceSign = product.price_sign {
            cell.productPrice.text = "\(price) \(priceSign)"
        }
        
        if let productLink = product.product_link {
            let attributedString = NSMutableAttributedString(string: productLink)
            attributedString.addAttribute(.link, value: productLink, range: NSRange(location: 0, length: productLink.count))
            cell.productLink.attributedText = attributedString
        }
        
        if let imageURL = URL(string: product.image_link!) {
            URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.productImage.image = image
                    }
                }
            }.resume()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        print(selectedProduct)
        navigateToDetailProductView(selectedProduct)
    }
    
    func navigateToDetailProductView(_ selectedProduct: ProductResponse) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailProductView") as? DetailProductView {
            detailVC.selectedProductDescription = selectedProduct.description ?? "No description found"
            detailVC.selectedProductImageUrl = selectedProduct.image_link!
            detailVC.selectedProductColors = selectedProduct.product_colors!
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
