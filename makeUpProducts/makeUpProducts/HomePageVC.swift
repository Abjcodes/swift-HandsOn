//
//  ViewController.swift
//  makeUpProducts
//
//  Created by P10 on 18/10/23.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
       private var loadingView: LoadingView? // Custom loading view
       
       var products: [ProductResponse] = []
       var filteredProductsArr: [ProductResponse] = []
       
       let searchController = UISearchController(searchResultsController: nil)
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Homepage"
           setupSearchController()
           setupTableView()
           setupLoadingView() // Initialize the loading view
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
       
       private func setupLoadingView() {
           // Create and add the loading view
           loadingView = LoadingView(frame: view.bounds)
           view.addSubview(loadingView!)
           loadingView?.isHidden = true
       }
       
       private func fetchDataFromAPI() {
           // Show loading view
           loadingView?.isHidden = false
           loadingView?.startLoading()
           
           ProductService.shared.fetchMakeupProducts { [weak self] (fetchedProducts, error) in
               guard let self = self else { return }
               if let error = error {
                   print("Error fetching data: \(error.localizedDescription)")
               } else if let fetchedProducts = fetchedProducts {
                   print("Fetched \(fetchedProducts.count) products")
                   self.products = fetchedProducts
                   
                   // Hide loading view and reload the table view
                   DispatchQueue.main.async {
                       self.loadingView?.stopLoading()
                       self.tableView.reloadData()
                   }
               }
           }
       }
}
