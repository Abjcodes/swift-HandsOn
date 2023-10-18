//
//  CreateUserVC.swift
//  login
//
//  Created by P10 on 17/10/23.
//

import UIKit
import FirebaseAuth

class CreateUserVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmedPassword: UITextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Add delegates for text fields
            email.delegate = self
            password.delegate = self
            confirmedPassword.delegate = self
        }
        
        // Function to validate email address
        func isValidEmail(_ email: String) -> Bool {
            return true
        }
        
        // Function to validate password
        func isValidPassword(_ password: String) -> Bool {
            return password.count >= 8
        }
        
        @IBAction func createAccount(_ sender: UIButton) {
            // Perform validation when the user tries to create an account
            if let emailText = email.text, let passwordText = password.text, let confirmedPasswordText = confirmedPassword.text {
                if isValidEmail(emailText) {
                    if isValidPassword(passwordText) {
                        if passwordText == confirmedPasswordText {
                            Auth.auth().createUser(withEmail: emailText, password: passwordText)
                            { (authResult, error) in
                                       if let error = error {
                                           self.showAlert( title: "Sign up error", message: error.localizedDescription)
                                       } else {
                                           // Login successful
                                           self.dismiss(animated: true, completion: nil)
                                           self.showAlert(title: "Succesful", message: "Account created succesfully")
                                       }
                                   }
                        } else {
                            // Passwords do not match
                            showAlert(title: "Validation error", message: "Passwords do not match.")
                        }
                    } else {
                        // Invalid password
                        showAlert(title: "Validation error", message: "Password must be at least 8 characters long.")
                    }
                } else {
                    // Invalid email
                    showAlert(title: "Validation error", message: "Please enter a valid email address.")
                }
            }
        }
        
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    }

    // MARK: - UITextFieldDelegate
    extension CreateUserVC: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Dismiss the keyboard when the Return key is tapped
            textField.resignFirstResponder()
            return true
        }
    }
