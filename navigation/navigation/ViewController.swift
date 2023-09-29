//
//  ViewController.swift
//  navigation
//
//  Created by P10 on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        let secondVC = sb.instantiateViewController(identifier: "SecondVC")
               self.navigationController?.pushViewController(secondVC, animated: true)  
    }
    
}

