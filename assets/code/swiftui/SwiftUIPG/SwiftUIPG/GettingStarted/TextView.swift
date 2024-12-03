//
//  TextView.swift
//  SwiftUIPG
//
//  Created by @ivansaul on 12/2/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .font(.headline)
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .fontWeight(.light)
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .foregroundStyle(.orange)
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .italic()
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .underline()
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .shadow(color: .gray, radius: 2, x: 0, y: 2)
//    }
// }

// struct TextView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .font(.headline)
//            .foregroundColor(.orange)
//            .italic()
//            .underline()
//            .shadow(color: .gray, radius: 2, x: 0, y: 2)
//            .strikethrough(true, color: .red)
//    }
// }

struct TextView: View {
    var body: some View {
        Text("Hello, World!\nWelcome to SwiftUI\nThe future of app development")
            .lineSpacing(5)
            .lineLimit(2)
            .multilineTextAlignment(.trailing)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TextView()
        .padding()
}
