//
//  ProductTableViewCell.swift
//  makeUpProducts
//
//  Created by P10 on 18/10/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // pass as object

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productLink: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
