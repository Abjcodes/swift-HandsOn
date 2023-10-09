//
//  ViewController.swift
//  navigation
//
//  Created by P10 on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnOnTap(_ sender: Any) {
        let secondVC = storyBoard.instantiateViewController(identifier: "SecondVC")
            self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

