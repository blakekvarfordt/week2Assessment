//
//  CoreDataStack.swift
//  NotesTest
//
//  Created by Blake kvarfordt on 8/9/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NotesTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) \(error.userInfo)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext{ return container.viewContext }
}

