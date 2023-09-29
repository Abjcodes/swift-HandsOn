//
//  ViewController.swift
//  pushAndpresent
//
//  Created by P10 on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func activatePushTap(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "pushedVC") {
                    navigationController?.pushViewController(firstVC, animated: true)
                }
    }
    
    @IBAction func activatePresentTap(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "pushedVC") {
                    navigationController?.present(firstVC, animated: true)
                }
    }
}

