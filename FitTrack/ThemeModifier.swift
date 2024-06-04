//
//  ThemeModifier.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 3.06.2024.
//

import SwiftUI

struct ThemeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium, design: .default))
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)).shadow(radius: 5))
    }
}

extension View {
    func applyTheme() -> some View {
        self.modifier(ThemeModifier())
    }
}
