//
//  CategoryView.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel = ExerciseViewModel()
    @State private var searchText = ""
    @State private var showFavoritesOnly = false

    var filteredExercises: [Exercise] {
        let exercisesToFilter = showFavoritesOnly ? viewModel.filterFavoriteExercises() : viewModel.exercises
        if searchText.isEmpty {
            return exercisesToFilter
        } else {
            return exercisesToFilter.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                .padding()

                List {
                    ForEach(filteredExercises.indices, id: \.self) { index in
                        NavigationLink(destination: ExerciseDetailView(exercise: $viewModel.exercises[index], viewModel: viewModel)) {
                            HStack {
                                Text(viewModel.exercises[index].name)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                            .padding(.vertical)
                        }
                    }
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Categories")
            .onAppear {
                viewModel.loadExercises()
            }
        }
    }
}
