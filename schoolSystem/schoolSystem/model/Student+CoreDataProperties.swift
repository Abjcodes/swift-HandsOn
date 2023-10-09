//
//  Student+CoreDataProperties.swift
//  schoolSystem
//
//  Created by P10 on 06/10/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var rollNo: Int64
    @NSManaged public var person: Person?

}

extension Student : Identifiable {

}
