//
//  NoteController.swift
//  NotesTest
//
//  Created by Blake kvarfordt on 8/9/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class NoteController {
    
    static let shared = NoteController()
    
    // Define fetchedResultsController
    var fetchedResultsController: NSFetchedResultsController<Note>
    
    // Create fetch request.
    init() {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let resultsController: NSFetchedResultsController<Note> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController = resultsController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error")
        }
        return
    }
    
    // Create
    func createNote(title: String, isComplete: Bool) {
        Note(title: title, isComplete: isComplete)
        saveToPersistentStore()
    }
    
    func removeNote(note: Note) {
        if let moc = note.managedObjectContext {
            moc.delete(note)
        }
        saveToPersistentStore()
    }
    
    func updateNote(note: Note, title: String) {
        note.title = title
        saveToPersistentStore()
    }
    
    func toggleComplete(note: Note) {
        note.isComplete = !note.isComplete
        saveToPersistentStore()
    }
    
    private func saveToPersistentStore() {
        if CoreDataStack.context.hasChanges {
            try? CoreDataStack.context.save()
        }
    }
    
}
