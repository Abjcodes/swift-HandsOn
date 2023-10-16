//
//  ViewController.swift
//  login
//
//  Created by P10 on 13/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func logInBtnOnSubmit(_ sender: Any) {
                // Ensure that the username and password fields are not empty
                guard let username = userNameTF.text, !username.isEmpty,
                      let password = passwordTF.text, !password.isEmpty else {
                    showAlert(title: "Validation Error", message: "Please enter both username and password.")
                    return
                }

                // You can add additional validation here, e.g., minimum length for the password
                if password.count < 6 {
                    showAlert(title: "Validation Error", message: "Password must be at least 6 characters long.")
                    return
                }

    }
    
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    

}

