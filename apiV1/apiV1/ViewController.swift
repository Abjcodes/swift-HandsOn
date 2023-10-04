//
//  ViewController.swift
//  apiV1
//
//  Created by P10 on 04/10/23.
//

import UIKit

struct EmployeeResponse: Codable {
    let status: String
    let data: [Employee]
    let message: String
}

struct Employee: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary: Int
    let employeeAge: Int
    let profileImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employees: [Employee] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Replace with your API URL
        let apiUrlString = "https://dummy.restapiexample.com/api/v1/employees"
        
        if let url = URL(string: apiUrlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("HTTP Response Error")
                    return
                }
                
                if let data = data {
                    // Assuming the API response is in JSON format
                    do {
                        let decoder = JSONDecoder()
                        let employeeResponse = try decoder.decode(EmployeeResponse.self, from: data)
                        
                        // Access the data like this:
                        let employees = employeeResponse.data
                        print(employees)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }

                }
            }
            task.resume()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = employees[indexPath.row]

        cell.textLabel?.text = "Employee Name: \(employee.employeeName)"
        cell.detailTextLabel?.text = "Salary: \(employee.employeeSalary), Age: \(employee.employeeAge)"
        
        return cell
    }

}




