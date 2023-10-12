//
//  collectorVC.swift
//  schoolSystem
//
//  Created by P10 on 06/10/23.
//
import UIKit
import CoreData

protocol CollectorVCDelegate {
    func dataSaved()
}

class CollectorVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var ageOutlet: UITextField!
    @IBOutlet weak var genderOutlet: UITextField!
    @IBOutlet weak var idOutlet: UITextField!
    @IBOutlet weak var roleOutlet: UITextField!
    
    var transitionDelegate: CollectorVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameOutlet.delegate = self
        self.ageOutlet.delegate = self
        self.genderOutlet.delegate = self
        self.idOutlet.delegate = self
        self.roleOutlet.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func btnOnTap(_ sender: Any) {
        // Perform input validation
        guard let name = nameOutlet.text, !name.isEmpty,
              let ageText = ageOutlet.text, let age = Int(ageText),
              let gender = genderOutlet.text, !gender.isEmpty,
              let idText = idOutlet.text, let id = Int(idText),
              let role = roleOutlet.text, !role.isEmpty else {
            showAlert(message: "Please fill in all required fields.")
            return
        }
        
        // Validate the role field
        if role.lowercased() != "student" && role.lowercased() != "teacher" {
            showAlert(message: "Role must be 'Student' or 'Teacher'.")
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let person = Person(context: context)
        
        person.name = name
        person.age = Int64(age)
        person.gender = gender
        
        if role.lowercased() == "student" {
            let student = Student(context: context)
            student.rollNo = Int64(id)
            person.student = student
        } else if role.lowercased() == "teacher" {
            let teacher = Teacher(context: context)
            teacher.empId = Int64(id)
            person.teacher = teacher
        }
        
        do {
            try context.save()
            print("Data saved to Core Data")
            navigationController?.popViewController(animated: true)
            if let transitionDelegate = transitionDelegate {
                transitionDelegate.dataSaved()
            }
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(
            title: "Validation Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
