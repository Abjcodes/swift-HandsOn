//
//  ViewController.swift
//  plistToDo
//
//  Created by P10 on 04/10/23.
//

import UIKit

struct Task: Decodable {
    var title: String
    var completed: Bool
}

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plistPath = Bundle.main.path(forResource: "ToDoList", ofType: "plist"){
            let plistData = FileManager.default.contents(atPath: plistPath)
            do {
                let decoder = PropertyListDecoder()
                tasks = try decoder.decode([Task].self, from: plistData!)
            } catch {
                print("Error decoding plist: \(error)")
            }
        }
        
        for task in tasks {
            print("Task: \(task.title), Completed: \(task.completed)")
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let task = tasks[indexPath.row]
            cell.textLabel?.text = task.title
            cell.accessoryType = task.completed ? .checkmark : .none
            return cell
        }


}

