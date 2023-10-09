//
//  BlueVC.swift
//  segues
//
//  Created by P10 on 04/10/23.
//

import UIKit

class PushedVC: UIViewController {
    
    @IBAction func onBtnTap(_ sender: Any) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
}
