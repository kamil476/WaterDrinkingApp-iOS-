//
//  Drink+CoreDataProperties.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 19/02/2025.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var drinkName: String?
    @NSManaged public var drinkQuantity: Int32
    @NSManaged public var drinkImage: String?
    @NSManaged public var drinkDate: Date?
    @NSManaged public var drinkType: String?

}

extension Drink : Identifiable {

}
