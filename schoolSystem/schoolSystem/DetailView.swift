//
//  detailView.swift
//  schoolSystem
//
//  Created by P10 on 09/10/23.
//

import UIKit

class DetailView: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var role: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    var personName: String = ""
    var personAge: Int64 = 0
    var personId: Int64 = 0
    var personRole: String = ""
    var personGender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Name: \(String(describing: personName))"
        age.text = "Age: \(String(describing: personAge))"
        role.text = "Role: \(String(describing: personRole))"
        id.text = "Id: \(String(describing: personId))"
        gender.text = "Gender: \(String(describing: personGender))"
        // Do any additional setup after loading the view.
    }
}
