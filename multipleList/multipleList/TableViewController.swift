//
//  ViewController.swift
//  multipleList
//
//  Created by P10 on 27/09/23.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    let contacts: [String: String] = [
        "John" : "123",
        "David" : "456",
        "Elsa" : "789",
        "Maryse": "10101010"
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"contactCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let contactName = Array(contacts.keys)[indexPath.row]
        let associateData = contacts[contactName] ?? " "
        content.text = contactName
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndexPath = indexPath.row
        let selectedContactName = Array(contacts.keys)[selectedIndexPath]
        let selectedContactNumber = contacts[selectedContactName]
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        destinationVC.selectedContact = selectedContactNumber
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    

}

