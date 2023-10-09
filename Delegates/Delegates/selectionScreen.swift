//
//  selectionScreen.swift
//  Delegates
//
//  Created by P10 on 03/10/23.
//

import UIKit

protocol ListSelectDelegate {
    func onChoiceSelect(label: String)
}

class SelectionScreen: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let data = ["One", "Two", "Three", "Four"]
    
    var listSelectDelegate: ListSelectDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let arrContent = data[indexPath.row]
        content.text = arrContent
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        let selectedValue = data[selectedRow]
        print(selectedValue)
        if listSelectDelegate != nil{
            listSelectDelegate.onChoiceSelect(label: selectedValue)
            print("Visible")
        } else {
            print("Not visible")
        }
        dismiss(animated: true, completion: nil) }
}
