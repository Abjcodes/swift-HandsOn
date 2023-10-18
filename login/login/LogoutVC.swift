//
//  LogoutVC.swift
//  login
//
//  Created by P10 on 18/10/23.
//

import UIKit
import FirebaseAuth

class LogoutVC: UIViewController {
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        let user = Auth.auth().currentUser
        userName.text = "Email: \(String(describing: user!.email))"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutOnSubmit(_ sender: Any) {
        let firebaseAuth = Auth.auth()
          do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: nil)
          } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
    }
    
}
