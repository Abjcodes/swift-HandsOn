//
//  ViewController.swift
//  login
//
//  Created by P10 on 13/10/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
        gradientSetup()
    }
    
    //(opt)clear text, move validation, close button in signup page(top right)
    @IBAction func logInBtnOnSubmit(_ sender: Any) {
        validateLogInFields()
        
    }
    
    func validateLogInFields(){
        guard let username = email.text, !username.isEmpty,
              let password = password.text, !password.isEmpty else {
            showAlert(title: "Validation Error", message: "Please enter both username and password.")
            return
    }
        
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
           let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
           if !emailPredicate.evaluate(with: username) {
               showAlert(title: "Validation Error", message: "Please enter a valid email address.")
               return
           }

                // You can add additional validation here, e.g., minimum length for the password
                if password.count < 6 {
                    showAlert(title: "Validation Error", message: "Password must be at least 6 characters long.")
                    return
                }
        
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.showAlert(title: "Login Error", message: error.localizedDescription)
            }
            guard let strongSelf = self else { return }
            guard (Auth.auth().currentUser != nil) else {return}
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let logoutVC = storyboard.instantiateViewController(withIdentifier: "LogoutVC") as? LogoutVC {
                strongSelf.present(logoutVC, animated: true, completion: nil)
            }
        }
        
    }
    
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToLogoutVC(){
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
    }
}

