//
//  DetailProductView.swift
//  makeUpProducts
//
//  Created by P10 on 20/10/23.
//

import UIKit

class DetailProductView: UIViewController{
    
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productImage: UIImageView!
    var selectedProductDescription: String = ""
    var selectedProductImageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedProductDescription = (selectedProductDescription != "") ? selectedProductDescription : "No description found"
        productDescription.text = selectedProductDescription
        if let imageURL = URL(string: selectedProductImageUrl) {
                   URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
                       if let data = data, let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                               self?.productImage.image = image
                           }
                       }
                }.resume()
            }
    }
}
