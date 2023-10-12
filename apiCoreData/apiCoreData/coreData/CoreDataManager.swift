//
//  CoreDataManager.swift
//  apiCoreData
//
//  Created by P10 on 10/10/23.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static func fetchDataFromCoreData() {
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
    
    static func saveToCoreData(employees: [Employee]) {
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
                
                // Save the managed object context
                do {
                    try managedContext.save()
                } catch {
                    print("Error saving data to Core Data: \(error)")
                }
            }
        }
}
