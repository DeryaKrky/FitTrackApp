//
//  ExerciseModel.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var language: Language
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case language
    }
}

struct Language: Codable {
    var id: Int
    var short_name: String
}
