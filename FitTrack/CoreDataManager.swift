//
//  CoreDataManager.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 3.06.2024.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private let context: NSManagedObjectContext
    
    private init() {
        context = CoreDataStack.shared.managedContext
    }
    
    func saveExercise(id: Int, name: String, descriptionText: String, isFavorite: Bool) {
        let exerciseEntity = ExerciseEntity(context: context)
        exerciseEntity.id = Int64(id)
        exerciseEntity.name = name
        exerciseEntity.descriptionText = descriptionText
        exerciseEntity.isFavorite = isFavorite
        
        saveContext()
    }
    
    func fetchExercises() -> [ExerciseEntity] {
        let fetchRequest: NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch exercises: \(error)")
            return []
        }
    }
    
    func updateExercise(entity: ExerciseEntity, isFavorite: Bool) {
        entity.isFavorite = isFavorite
        saveContext()
    }
    
    private func saveContext() {
        CoreDataStack.shared.saveContext()
    }
}
