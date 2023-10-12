//
//  ViewController.swift
//  schoolSystem
//
//  Created by P10 on 05/10/23.
//

// Refactor


import UIKit
import CoreData

class ViewController: UIViewController, CollectorVCDelegate {
    
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var persons: [Person] = []
    var filteredPersons: [Person] = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        setupSegmentedControl()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "ShowCollectorVC" {
           if let collectorVC = segue.destination as? CollectorVC {
               collectorVC.transitionDelegate = self
               print("Delegate set")// Set the delegate to self
           }
       }
       }
        
        func loadData() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
            
            do {
                persons = try context.fetch(fetchRequest)
                filteredPersons = persons
                print(persons)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            } catch {
                print("Error fetching data from Core Data: \(error)")
            }
    }

    func dataSaved() {
        print("Func called")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
                
                do {
                    persons = try context.fetch(fetchRequest)
                    filteredPersons = persons
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error fetching data from Core Data: \(error)")
                }
    }
}
