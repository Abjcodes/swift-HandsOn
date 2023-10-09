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
    }

    @IBAction func pushToNextViewController(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "pushedVC") 
        {
            navigationController?.pushViewController(firstVC, animated: true)
        }
    }
    
    @IBAction func presentNextViewController(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "presentedVC") 
        {
            navigationController?.present(firstVC, animated: true)
        }
    }
}

