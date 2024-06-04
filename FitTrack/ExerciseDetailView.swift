//
//  ExerciseDetailView.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//


import SwiftUI

struct ExerciseDetailView: View {
    @Binding var exercise: Exercise
    @ObservedObject var viewModel: ExerciseViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(exercise.name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding([.top, .horizontal])

                Text(exercise.description)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding([.horizontal, .bottom])

                Button(action: {
                    exercise.isFavorite.toggle()
                    viewModel.toggleFavorite(exercise: exercise)
                }) {
                    HStack {
                        Image(systemName: exercise.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(exercise.isFavorite ? .red : .gray)
                        Text(exercise.isFavorite ? "Remove from Favorites" : "Add to Favorites")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            .background(Color(.white))
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
