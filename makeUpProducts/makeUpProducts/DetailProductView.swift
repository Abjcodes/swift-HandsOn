//
//  DetailProductView.swift
//  makeUpProducts
//
//  Created by P10 on 20/10/23.
//

import UIKit

class DetailProductView: UIViewController {
    
    
    @IBOutlet weak var colourCollectionView: UICollectionView!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productImage: UIImageView!
    var selectedProductDescription: String = ""
    var selectedProductImageUrl: String = ""
    var selectedProductColors: [ProductColor] = []
    
    override func viewDidLoad() {
        
        
        let layout = ColourViewLayout()
        colourCollectionView.collectionViewLayout = layout
            super.viewDidLoad()
        colourCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
            selectedProductDescription = (selectedProductDescription != "") ? selectedProductDescription : "No description found"
            productDescription.text = selectedProductDescription
            updateTextViewSize()
            productDescription.isScrollEnabled = false

            // Set content hugging and compression resistance priorities
            productDescription.setContentHuggingPriority(.required, for: .vertical)
            productDescription.setContentCompressionResistancePriority(.required, for: .vertical)

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
            updateTextViewSize()
        }
    
        private func configureCollectionView() {
          colourCollectionView.delegate = self
          colourCollectionView.dataSource = self
          colourCollectionView.reloadData()
      }
      

        // Function to update the UITextView's size
        private func updateTextViewSize() {
            let fixedWidth = productDescription.frame.size.width
            let newSize = productDescription.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            productDescription.frame.size = newSize
        }
    }


