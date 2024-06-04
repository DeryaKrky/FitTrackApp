//
//  ExerciseService.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//

import Foundation

class ExerciseService {
    let baseUrl = "https://wger.de/api/v2/exerciseinfo/?format=json"
    
    func fetchExercises(completion: @escaping ([Exercise]?) -> Void) {
        guard let url = URL(string: baseUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Token e5af9b2aacb8fd80a767c70d2e744eaf411f", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data")
                completion(nil)
                return
            }

            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(apiResponse.results)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }

        task.resume()
    }
}
