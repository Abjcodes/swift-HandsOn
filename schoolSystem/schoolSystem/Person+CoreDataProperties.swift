//
//  Person+CoreDataProperties.swift
//  schoolSystem
//
//  Created by P10 on 11/10/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var student: Student?
    @NSManaged public var teacher: Teacher?

}

extension Person : Identifiable {

}
