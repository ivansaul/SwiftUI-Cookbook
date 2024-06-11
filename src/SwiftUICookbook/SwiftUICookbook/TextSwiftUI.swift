//
//  TextSwiftUI.swift
//  SwiftUICookbook
//
//  Created by ivansaul on 6/11/24.
//  https://github.com/ivansaul
//

import SwiftUI

struct TextSwiftUI: View {
    var body: some View {
        // Basic Text View
        Text("Hello, World!")

        // Font Style
        Text("Hello, World!")
            .font(.headline)

        // Text Color
        Text("Hello, World!")
            .foregroundStyle(.blue)

        // Bold and Italic Text
        Text("Hello, World!")
            .bold()
            .italic()

        // Custom Font and Size
        Text("Hello, World!")
            .font(.custom("Arial", size: 25))

        // Line Spacing and Alignment
        Text("Hello, World!\nWelcome to SwiftUI.")
            .lineSpacing(5)
            .multilineTextAlignment(.trailing)

        // Shadow
        Text("Hello, World!")
            .shadow(color: .gray, radius: 2, x: 0, y: 2)

        // Strikethrough and Underline
        Text("Hello, World!")
            .strikethrough(true, color: .red)
            .underline(true, color: .blue)

        // Applying Multiple Modifiers
        Text("Hello, World!")
            .font(.headline)
            .foregroundStyle(.blue)
            .bold()
            .italic()
            .underline()
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

#Preview {
    TextSwiftUI()
}
