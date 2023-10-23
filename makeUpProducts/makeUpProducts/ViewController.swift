//
//  ViewController.swift
//  makeUpProducts
//
//  Created by P10 on 18/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [ProductResponse] = []
    var filteredProductsArr: [ProductResponse] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupTableView()
        fetchDataFromAPI()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Products"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        
    }
    
    private func fetchDataFromAPI() {
        ProductService.shared.fetchMakeupProducts { [weak self] (fetchedProducts, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            } else if let fetchedProducts = fetchedProducts {
                print("Fetched \(fetchedProducts.count) products")
                self.products = fetchedProducts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
