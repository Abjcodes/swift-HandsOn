//
//  EmployeeEntity+CoreDataProperties.swift
//  apiCoreData
//
//  Created by P10 on 05/10/23.
//
//

import Foundation
import CoreData


extension EmployeeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeEntity> {
        return NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var employeeName: String?
    @NSManaged public var employeeSalary: Int64
    @NSManaged public var employeeAge: Int64
    @NSManaged public var profileImage: String?

}

extension EmployeeEntity : Identifiable {

}
