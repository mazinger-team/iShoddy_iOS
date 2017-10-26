//
//  COREDAT.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import CoreData



public func setupCoreDataStack(storeURL : URL)-> NSManagedObjectContext {
    
    let bundles = [Bundle(for: CategoryData.self)]
    guard let model = NSManagedObjectModel.mergedModel(from: bundles ) else {
        fatalError("Error al inicializar CoreData")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
    
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    context.persistentStoreCoordinator = psc
    
    do {
        try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
    } catch {
        fatalError("Error migrating store: \(error)")
    }
    return context
    
}


public func saveContext(context: NSManagedObjectContext, onError: errorBlock? = nil) {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            if onError != nil {
               // errorClosure(error)
            }
        }
    }
}
