//
//  ViewController.swift
//  practice1
//
//  Created by P10 on 27/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    var didTap = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("View did load")
        // Do any additional setup after loading the view.
    }
    
    //action
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

