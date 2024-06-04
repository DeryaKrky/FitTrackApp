//
//  ExerciseViewModel.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//

import SwiftUI
import CoreData

class ExerciseViewModel: ObservableObject {
    @Published var exercises = [Exercise]()
    @Published var favoriteExercises = [ExerciseEntity]()
    private var service = ExerciseService()
    private var coreDataManager = CoreDataManager.shared

    func loadExercises() {
        print("Loading exercises...")
        service.fetchExercises { [weak self] exercises in
            DispatchQueue.main.async {
                if let exercises = exercises {
                    self?.exercises = exercises
                    self?.loadFavoriteExercises() // Favori egzersizleri de yükleyelim
                    print("Loaded exercises: \(exercises.count)")
                } else {
                    print("Failed to load exercises")
                }
            }
        }
    }

    func loadFavoriteExercises() {
        favoriteExercises = coreDataManager.fetchExercises()
        for favorite in favoriteExercises {
            if let index = exercises.firstIndex(where: { $0.id == favorite.id }) {
                exercises[index].isFavorite = favorite.isFavorite
            }
        }
    }

    func toggleFavorite(exercise: Exercise) {
        if let index = exercises.firstIndex(where: { $0.id == exercise.id }) {
            exercises[index].isFavorite.toggle()
            let isFavorite = exercises[index].isFavorite
            if let favoriteExercise = favoriteExercises.first(where: { $0.id == Int64(exercise.id) }) {
                coreDataManager.updateExercise(entity: favoriteExercise, isFavorite: isFavorite)
            } else {
                coreDataManager.saveExercise(id: exercise.id, name: exercise.name, descriptionText: exercise.description, isFavorite: isFavorite)
            }
            loadFavoriteExercises()
        }
    }

    func filterFavoriteExercises() -> [Exercise] {
        return exercises.filter { $0.isFavorite }
    }
}
