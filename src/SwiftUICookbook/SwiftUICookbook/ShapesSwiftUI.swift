//
//  ShapesSwiftUI.swift
//  SwiftUICookbook
//
//  Created by ivansaul on 6/11/24.
//  https://github.com/ivansaul
//

import SwiftUI

// Circle
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Circle()
             .frame(width: 200, height: 200)
     }
 }
  */

// Ellipse
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Ellipse()
             .frame(width: 300, height: 200)
     }
 }
 */

// Rectangle
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Rectangle()
             .frame(width: 300, height: 200)
     }
 }
  */

// Rounded Rectangle
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         RoundedRectangle(cornerRadius: 30)
             .frame(width: 300, height: 200)
     }
 }
 */

// Fill
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Circle()
             .fill(.blue)
             .frame(width: 300, height: 300)
     }
 }
  */

// Stroke
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Rectangle()
             .stroke(.red, lineWidth: 20)
             .frame(width: 300, height: 300)
     }
 }
  */

// Opacity and Shadow
/*
 struct ShapesSwiftUI: View {
     var body: some View {
         Ellipse()
             .fill(Color.green)
             .frame(width: 300, height: 200)
             .shadow(color: .blue, radius: 10, x: 0, y: 15)
     }
 }
 */

// Gradient Fills
struct ShapesSwiftUI: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    ShapesSwiftUI()
}
