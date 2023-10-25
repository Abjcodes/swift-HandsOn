//
//  DetailProductView.swift
//  makeUpProducts
//
//  Created by P10 on 20/10/23.
//

import UIKit

class DetailProductView: UIViewController {
    
    
    @IBOutlet weak var colourCollectionView: UICollectionView!
    @IBOutlet weak var availableColors: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var selectedProductDescription: String = ""
    var selectedProductImageUrl: String = ""
    var selectedProductColors: [ProductColor] = []
    
    override func viewDidLoad() {
        
        // change in storyboard
        if let labelFont = availableColors.font {
               let boldFont = UIFont.boldSystemFont(ofSize: labelFont.pointSize)
               availableColors.font = boldFont
        }
        
        title = "Product Details"
        let layout = ColourViewLayout()
        colourCollectionView.collectionViewLayout = layout
            super.viewDidLoad()
        colourCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
            selectedProductDescription = (selectedProductDescription != "") ? selectedProductDescription : "No description found"
            productDescription.text = selectedProductDescription

            if let imageURL = URL(string: selectedProductImageUrl) {
                URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.productImage.image = image
                            self?.productImage.layer.shadowColor = UIColor.darkGray.cgColor
                            self?.productImage.layer.shadowOffset = CGSize(width: 0, height: 2)
                            self?.productImage.layer.shadowRadius = 4
                            self?.productImage.layer.shadowOpacity = 0.5
                        }
                    }
                }.resume()
            }
        
            configureCollectionView()
        }
    
        private func configureCollectionView() {
          colourCollectionView.delegate = self
          colourCollectionView.dataSource = self
          colourCollectionView.reloadData()
      }
      
    }
