//
//  DetailViewController.swift
//  multipleList
//
//  Created by P10 on 28/09/23.
//

import UIKit

class DetailViewController: UIViewController{
    var selectedContact: String?
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = selectedContact {
            labelOutlet.text = contact
        } else {
            labelOutlet.text = "No contact selected"
        }
        
    }
    
    
}
