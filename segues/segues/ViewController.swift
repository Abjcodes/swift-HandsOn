//
//  ViewController.swift
//  segues
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "showSegue", sender:nil)
    }
    
    @IBAction func modalBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "modalSegue", sender:nil)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        // checked on run time
    }
    
    
}

