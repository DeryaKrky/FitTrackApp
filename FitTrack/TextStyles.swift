//
//  TextStyles.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 3.06.2024.
//

import SwiftUI

struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(.blue)
            .padding()
    }
}

struct BodyTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(.black)
            .padding([.leading, .trailing, .vertical], 10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.modifier(TitleTextStyle())
    }

    func bodyTextStyle() -> some View {
        self.modifier(BodyTextStyle())
    }
}

