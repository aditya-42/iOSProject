//
//  CoreDataDogs+CoreDataProperties.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//
//

import Foundation
import CoreData


extension CoreDataDogs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataDogs> {
        return NSFetchRequest<CoreDataDogs>(entityName: "CoreDataDogs")
    }

    @NSManaged public var name: String?
    @NSManaged public var temperament: String?
    @NSManaged public var breed_group: String?
    @NSManaged public var bred_for: String?
    @NSManaged public var image: Data?

}

extension CoreDataDogs : Identifiable {

}
