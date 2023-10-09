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

class CollectorVC: UIViewController {

    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var ageOutlet: UITextField!
    
    @IBOutlet weak var genderOutlet: UITextField!
    
    @IBOutlet weak var idOutlet: UITextField!
    
    @IBOutlet weak var roleOutlet: UITextField!
    
    var transitionDelegate: CollectorVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOnTap(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let person = Person(context: context)
        let student = Student(context: context)
        let teacher = Teacher(context: context)
        person.name = nameOutlet.text
        person.age = Int64(ageOutlet.text!) ?? 0
        person.gender = String(genderOutlet.text!)
        if(roleOutlet.text == "Student" || roleOutlet.text == "student"){
            student.rollNo = Int64(idOutlet.text!) ?? 0
            person.student = student
        } else if(roleOutlet.text == "Teacher" || roleOutlet.text == "teacher"){
            teacher.empId = Int64(idOutlet.text!) ?? 0
            person.teacher = teacher
        }
        do {
            try context.save()
            print("Data saved to Core Data")
            navigationController?.popViewController(animated: true)
            if transitionDelegate != nil {
                transitionDelegate.dataSaved()
            }
        }
            catch{
                print("Error saving to core data \(error)")
            }
        }
}
