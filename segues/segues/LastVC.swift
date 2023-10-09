//
//  LastVC.swift
//  segues
//
//  Created by P10 on 05/10/23.
//

import UIKit

class LastVC: UIViewController {
    
    @IBAction func backHomeBtn(_ sender: Any) {
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    
}
