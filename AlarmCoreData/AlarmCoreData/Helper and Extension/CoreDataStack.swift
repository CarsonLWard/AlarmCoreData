//
//  CoreDataStack.swift
//  AlarmCoreData
//
//  Created by Carson Ward on 4/29/21.
//

import CoreData

// MARK: - Class

class CoreDataStack {

    // MARK: - Properties
    
    static let container: NSPersistentContainer = {
        
        // App name is generated from our Bundle
        
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        
        let container = NSPersistentContainer(name: appName)
        
        container.loadPersistentStores() {
            
            (storeDescription, error) in
            
            if let error = error as NSError? {fatalError("Unresolved error \(error), \(error.userInfo)")
                
        }
            
    }
        
    return container
        
}()

    static var context: NSManagedObjectContext { return container.viewContext }
    
}//End of class

