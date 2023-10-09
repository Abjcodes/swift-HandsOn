//
//  ViewController.swift
//  schoolSystem
//
//  Created by P10 on 05/10/23.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,CollectorVCDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var persons: [Person] = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
                
                do {
                    persons = try context.fetch(fetchRequest)
                    print(persons)
                    // Reload the table view to display the data
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error fetching data from Core Data: \(error)")
                }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowCollectorVC" {
               if let collectorVC = segue.destination as? CollectorVC {
                   collectorVC.transitionDelegate = self
                   print("Delegate set")// Set the delegate to self
               }
           }
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Get the managed object context
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            // Delete the selected person object from Core Data
            context.delete(persons[indexPath.row])
            persons.remove(at: indexPath.row)
            
            // Save the context to persist the changes
            do {
                try context.save()
            } catch {
                print("Error deleting data from Core Data: \(error)")
            }
            
            // Update the table view to reflect the deletion
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected person
        let selectedPerson = persons[indexPath.row]
        print(selectedPerson)
        
        // Instantiate the DetailViewController from the storyboard
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailView {
            // Pass the person's name to the DetailViewController
            detailVC.personName = selectedPerson.name ?? ""
            detailVC.personAge = selectedPerson.age
            detailVC.personGender = selectedPerson.gender ?? ""
            
            // Check if selectedPerson is a teacher
            if let teacher = selectedPerson.teacher {
                detailVC.personRole = "Teacher"
                detailVC.personId = teacher.empId
            }
            // Check if selectedPerson is a student
            else if let student = selectedPerson.student {
                detailVC.personRole = "Student"
                detailVC.personId = student.rollNo
            }
            
            // Push the DetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }


    
    func dataSaved() {
        print("Func called")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
                
                do {
                    persons = try context.fetch(fetchRequest)
                    print(persons)
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error fetching data from Core Data: \(error)")
                }
    }
    
    func handleUpdateAction(forRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Update Person", message: "Enter new details:", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "New Name"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "New Age"
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Update", style: .default, handler: { [weak self] action in
            guard let self = self else { return }
            
            // Get the text entered in the alert's text fields
            if let nameTextField = alertController.textFields?.first,
               let ageTextField = alertController.textFields?.last,
               let newName = nameTextField.text,
               let newAgeText = ageTextField.text,
               let newAge = Int(newAgeText) {
               
               // Update the selected person's details
               let selectedPerson = self.persons[indexPath.row]
               selectedPerson.name = newName
               selectedPerson.age = Int64(newAge)
               
               // Save the context to persist the changes
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               do {
                   try context.save()
               } catch {
                   print("Error updating data in Core Data: \(error)")
               }
               
               // Reload the table view to reflect the changes
               self.tableView.reloadRows(at: [indexPath], with: .automatic)
           }
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: "Update") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            // Handle the update action for the selected row
            self.handleUpdateAction(forRowAt: indexPath)
            completionHandler(true)
        }
        updateAction.backgroundColor = UIColor.blue // Customize the action's background color
        
        return UISwipeActionsConfiguration(actions: [updateAction])
    }


}

