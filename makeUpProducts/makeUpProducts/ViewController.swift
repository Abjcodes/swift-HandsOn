//
//  ViewController.swift
//  makeUpProducts
//
//  Created by P10 on 18/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [ProductResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI() {
           ProductService.shared.fetchMakeupProducts { (fetchedProducts, error) in
               if let error = error {
                   print("Error fetching data: \(error.localizedDescription)")
               } else if let fetchedProducts = fetchedProducts {
                   print("Fetched \(fetchedProducts.count) products")
                   self.products = fetchedProducts
                   DispatchQueue.main.async{
                       self.tableView.reloadData()
                   }// Refresh the table view
               }
           }
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            let product = products[indexPath.row]
            cell.productName.text = "Name: \(product.name)"
            cell.productPrice.text = "Name: \(product.price)"
            let linkString = "Link: \(product.product_link)"
            let attributedString = NSMutableAttributedString(string: linkString)
            
            // Set the link attribute for the entire string
            attributedString.addAttribute(.link, value: product.product_link, range: NSRange(location: 0, length: linkString.count))
            
            // Set the attributed text for the label
            cell.productLink.attributedText = attributedString
        
        if let imageURL = URL(string: product.image_link!) {
                URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        // Update the UI on the main thread
                        DispatchQueue.main.async {
                            cell.productImage.image = image
                        }
                    }
                }.resume()
            }

            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        print(selectedProduct)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let DetailVC = storyboard.instantiateViewController(withIdentifier: "DetailProductView") as? DetailProductView {
            DetailVC.selectedProductDescription = selectedProduct.description!
            DetailVC.selectedProductImageUrl = selectedProduct.image_link!
            navigationController?.pushViewController(DetailVC, animated: true)
        }
    }


}

