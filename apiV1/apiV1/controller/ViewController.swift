//
//  ViewController.swift
//  apiV1
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    var employees: [Employee] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        
        EmployeeService.fetchEmployees { [weak self] (employees, error) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                
                if let error = error {
                    print("Error: \(error)")
                    // Handle the error, e.g., show an alert
                    return
                }
                
                if let employees = employees {
                    self?.employees = employees
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = employees[indexPath.row]
        cell.textLabel?.text = "Name: \(employee.employeeName) | Salary: \(employee.employeeSalary)"
        return cell
    }
}
