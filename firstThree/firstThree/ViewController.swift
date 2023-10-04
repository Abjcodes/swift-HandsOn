//
//  ViewController.swift
//  firstThree
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    var didTap = true
    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonOnTap(_ sender: Any) {
        if(didTap){
            labelOutlet.backgroundColor = UIColor.red
        } else {
            labelOutlet.backgroundColor = UIColor.white
        }
        didTap = !didTap
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if(sender.isOn) {
            labelOutlet.text = "switch is on"
        }
        else {
            labelOutlet.text = "switch is off"
        }
    }
}

