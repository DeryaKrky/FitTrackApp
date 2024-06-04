//
//  ApiResponse.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//

import Foundation

struct ApiResponse: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Exercise]?
}
