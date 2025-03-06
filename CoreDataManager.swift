//
//  CoreDataManager.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 19/02/2025.
//

import Foundation
import UIKit
import CoreData


class CoreDataManager {
    
    // Singleton instance
    static let shared = CoreDataManager()
    
    // Managed Object Context
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Persistent Container
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        return container
    }()
    
    // MARK: - Save Data (Add Drink)
    func saveDrink(drinkDate: Date, drinkName: String, drinkImage: String, drinkQuantity: Int32, drinkType: String) {
        
        // Create a new DrinkEntity object
        let drinkEntity = Drink(context: context)
        
        // Set the properties of the drink entity
        drinkEntity.drinkDate = drinkDate // Use the provided custom date
        drinkEntity.drinkImage = drinkImage // Assign the image as a string (URL or asset name)
        drinkEntity.drinkName = drinkName // Assign the name of the drink
        drinkEntity.drinkQuantity = drinkQuantity // Assign the quantity of the drink
        drinkEntity.drinkType = drinkType // Assign the type (water, coffee, tea, etc.)
        
        // Save the context to persist the data
        saveContext()
    }
    
    // MARK: - Fetch Drinks (All Drinks)
    func fetchAllDrinks() -> [Drink]? {
        let fetchRequest: NSFetchRequest<Drink> = Drink.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch drinks: \(error)")
            return nil
        }
    }
    
    func fetchTodayDrinks() -> [Drink]? {
        let fetchRequest: NSFetchRequest<Drink> = Drink.fetchRequest()
        
        let calendar = Calendar.current
        let todayStart = calendar.startOfDay(for: Date()) // Aaj ke din ka start time
        
        fetchRequest.predicate = NSPredicate(format: "drinkDate >= %@", todayStart as NSDate) // Filter
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch today's drinks: \(error)")
            return nil
        }
    }
    
    
    // AnalyticsViewController ke liye data save karne ka function
    func saveToAnalytics(drink: Drink) {
        // Analytics ke liye data save karne ka logic
        print("Drink saved to Analytics: \(drink.drinkName ?? "")")
    }
    
    // MARK: - Save Context
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
