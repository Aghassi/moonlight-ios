//
//  CoreDataHelpers.swift
//  Moonlight
//
//  Created by David Aghassi on 4/12/16.
//  Copyright © 2016 Moonlight Stream. All rights reserved.
//

import Foundation
import CoreData

/**
 Creates a temporary Managed Object Context.
 Idea originated from [Unit Testing Model Layer with Core Data and Swift](https://www.andrewcbancroft.com/2015/01/13/unit-testing-model-layer-core-data-swift/)
 
 - returns: A temporary managed object context in memory
 */
func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
  let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
  
  let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
  
  do {
    try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
  } catch {
    print("Adding in-memory persistent store coordinator failed")
  }
  
  let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
  managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
  
  return managedObjectContext
}