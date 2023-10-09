//
//  ViewController.swift
//  apiCoreData
//
//  Created by P10 on 05/10/23.
//

import UIKit
import CoreData

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
        
        fetchDataFromCoreData()
        
        // Defining object url
        let apiUrlString = "https://dummy.restapiexample.com/api/v1/employees"
        
        if let url = URL(string: apiUrlString) {
            // Creating a session
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
               }
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("HTTP Response Error")
                    return
                }
                //Assigning the session a task
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let employeeResponse = try decoder.decode(EmployeeResponse.self, from: data)
                        
                        self.employees = employeeResponse.data
                        DispatchQueue.main.async {
                             self.saveToCoreData(employees: employeeResponse.data)
                       }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }

                }
            }
            //Starting the task
            task.resume()
        }
    }
    
    private func saveToCoreData(employees: [Employee]) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            for employeeData in employees {
                let employee = EmployeeEntity(context: managedContext)
                employee.id = Int64(employeeData.id)
                employee.employeeName = employeeData.employeeName
                employee.employeeSalary = Int64(employeeData.employeeSalary)
                employee.employeeAge = Int64(employeeData.employeeAge)
                employee.profileImage = employeeData.profileImage
                
                // You can add more attributes as needed
                
                // Save the managed object context
                do {
                    try managedContext.save()
                } catch {
                    print("Error saving data to Core Data: \(error)")
                }
            }
        }
    func fetchDataFromCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()

        do {
            let employees = try managedContext.fetch(fetchRequest)
            print("Fetched \(employees.count) employees from Core Data:")

            for employee in employees {
                print("Name: \(employee.employeeName ?? "N/A")")
                print("Salary: \(employee.employeeSalary)")
                print("Age: \(employee.employeeAge)")
                print("Profile Image: \(employee.profileImage ?? "N/A")")
                print("------")
            }
        } catch {
            print("Error fetching data from Core Data: \(error)")
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
