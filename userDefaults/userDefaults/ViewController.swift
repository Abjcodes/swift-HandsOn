//
//  ViewController.swift
//  userDefaults
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var displayValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let savedValue = UserDefaults.standard.string(forKey: "savedValue"){
            displayValue.text = "Saved Value: \(savedValue)"
        }
    }

    @IBAction func saveBtnTap(_ sender: Any) {
        if let inputValue = textInput.text {
            UserDefaults.standard.set(inputValue, forKey: "savedValue")
            displayValue.text = "Saved value: \(inputValue)"
            textInput.text = ""
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func clearBtnTap(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "savedValue")
        displayValue.text = "No saved value"
        textInput.text = ""
    }
}

