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
        "Maryse": "10101010",
        "A": "156"
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            // Create and configure a custom header view
            let headerView = UIView()
            headerView.backgroundColor = UIColor.white

            // Create a label for the header text
            let headerLabel = UILabel()
            headerLabel.text = "Contacts"
            headerLabel.textColor = UIColor.black
            headerLabel.frame = CGRect(x: 15, y: 5, width: 200, height: 20)
            headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
            
            headerView.addSubview(headerLabel)
            
            return headerView
        }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // Create and configure a custom footer view
        let footerView = UIView()

        // Create a label for the footer text
        let footerLabel = UILabel()
        footerLabel.text = "End of the list"
        footerLabel.textColor = UIColor.systemBlue
        footerLabel.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        footerLabel.font = UIFont.systemFont(ofSize: 12)
        
        // Add the label to the footer view
        footerView.addSubview(footerLabel)
        
        // Center the label in the footer view
        NSLayoutConstraint.activate([
            footerLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            footerLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
        ])
        
        return footerView
    }

    
}

