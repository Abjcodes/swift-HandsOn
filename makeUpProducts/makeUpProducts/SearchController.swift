//
//  SearchController.swift
//  makeUpProducts
//
//  Created by P10 on 23/10/23.
//

import UIKit


extension HomePageVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            tableView.reloadData()
            return
        }
        
        let filteredProducts = products.filter { product in
            if let name = product.name, name.lowercased().contains(searchText.lowercased()) {
                return true
            }
            return false
        }
        
        filteredProductsArr = filteredProducts
        tableView.reloadData()
    }
}
