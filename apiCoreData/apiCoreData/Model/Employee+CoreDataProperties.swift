//
//  Employee+CoreDataProperties.swift
//  apiCoreData
//
//  Created by P10 on 05/10/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: Int64
    @NSManaged public var employeeName: String?
    @NSManaged public var employeeSalary: Int64
    @NSManaged public var employeeAge: Int64
    @NSManaged public var profileImage: String?

}

extension Employee : Identifiable {

}
