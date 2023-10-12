//
//  TableController.swift
//  schoolSystem
//
//  Created by P10 on 12/10/23.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected person
        let selectedPerson = filteredPersons[indexPath.row]
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Get the managed object context
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            // Delete the selected person object from Core Data
            context.delete(filteredPersons[indexPath.row])
            filteredPersons.remove(at: indexPath.row)
            persons = filteredPersons
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPersons.count // Use filteredPersons array
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = filteredPersons[indexPath.row] // Use filteredPersons array
        cell.textLabel?.text = person.name
        return cell
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
}
