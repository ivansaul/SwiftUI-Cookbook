//
//  TabViewSwiftUI.swift
//  SwiftUICookbook
//
//  Created by saul on 6/25/24.
//

import SwiftUI

/*
 struct TabViewSwiftUI: View {
     init() {
         UITabBar.appearance().backgroundColor = UIColor.lightGray
     }

     var body: some View {
         TabView {
             Text("Home Tab")
                 .tabItem {
                     Image(systemName: "house")
                     Text("Home")
                 }
             Text("Settings Tab")
                 .tabItem {
                     Image(systemName: "gear")
                     Text("Settings")
                 }
         }
     }
 }
 */

/*
 struct TabViewSwiftUI: View {
     @State var selectedTab: Int = 1
     var body: some View {
         TabView(selection: $selectedTab) {
             Text("Home Tab")
                 .tabItem {
                     Image(systemName: "house")
                     Text("Home")
                 }
                 .tag(0)

             VStack {
                 Text("Messages Tab")

                 Button("Go Home") {
                     selectedTab = 0
                 }
                 .buttonStyle(.bordered)
             }
             .tabItem {
                 Image(systemName: "message.badge")
                 Text("Messages")
             }
             .tag(1)

             Text("Settings Tab")
                 .tabItem {
                     Image(systemName: "gear")
                     Text("Settings")
                 }
                 .tag(2)
         }
         .tabViewStyle(PageTabViewStyle())
     }
 }
  */

struct TabViewSwiftUI: View {
    var body: some View {
        TabView {
            Color.red
                .ignoresSafeArea()
            Color.green
                .ignoresSafeArea()
            Color.blue
                .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    TabViewSwiftUI()
}
