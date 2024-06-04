//
//  HTMLTextView.swift
//  FitTrack
//
//  Created by DERYA KARAKAYA on 3.06.2024.
//


import SwiftUI
import UIKit

struct HTMLTextView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.dataDetectorTypes = [.link, .phoneNumber]
        textView.backgroundColor = .clear // Arka plan rengini uygun şekilde ayarlayın
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if let data = htmlContent.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]

            if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                uiView.attributedText = attributedString
            } else {
                uiView.text = "Invalid HTML content"
            }
        }
    }
}
