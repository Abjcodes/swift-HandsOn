//
//  BlueVC.swift
//  segues
//
//  Created by P10 on 04/10/23.
//

import UIKit

class BlueVC: UIViewController {
    @IBAction func unwindHome(unwindSegue: UIStoryboardSegue) {
        if let blueViewController = unwindSegue.source as? BlueVC {
                print("Coming from BLUE")
            }
    }
}
