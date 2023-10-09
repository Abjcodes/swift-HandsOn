//
//  CustomTableViewCell.swift
//  storyboardAndXib
//
//  Created by P10 on 28/09/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // state values
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
