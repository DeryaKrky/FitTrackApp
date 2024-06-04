//
//  ExerciseRow.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 3.06.2024.
//

import SwiftUI

struct ExerciseRow: View {
    @Binding var exercise: Exercise
    var onFavoriteToggle: (Exercise) -> Void

    var body: some View {
        HStack {
            Text(exercise.name)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)
            Spacer()
            Button(action: {
                exercise.isFavorite.toggle()
                onFavoriteToggle(exercise)
            }) {
                Image(systemName: exercise.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(exercise.isFavorite ? .red : .gray)
                    .padding()
            }
        }
        .padding(.vertical)
    }
}
