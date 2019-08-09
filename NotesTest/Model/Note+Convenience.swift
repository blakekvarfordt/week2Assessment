//
//  Note+Convenience.swift
//  NotesTest
//
//  Created by Blake kvarfordt on 8/9/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    @discardableResult
    convenience init(title: String, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.isComplete = isComplete
    }
}
