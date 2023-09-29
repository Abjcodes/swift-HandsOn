//
//  ViewController.swift
//  segues
//
//  Created by P10 on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushSegueAction(_ sender: Any) {
        performSegue(withIdentifier: "showSegue", sender: self)
        
    }
    
    @IBAction func modalSegueAction(_ sender: Any) {
        performSegue(withIdentifier: "modalSegue", sender: self)
    }
    
    @IBAction func popoverSegueAction(_ sender: Any) {
    }
}

