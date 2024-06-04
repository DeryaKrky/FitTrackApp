//
//  ContentView.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 31.05.2024.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemGray5).edgesIgnoringSafeArea(.all)
            CategoryView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
