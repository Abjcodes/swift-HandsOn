//
//  Teacher+CoreDataProperties.swift
//  schoolSystem
//
//  Created by P10 on 11/10/23.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var empId: Int64
    @NSManaged public var person: Person?

}

extension Teacher : Identifiable {

}
