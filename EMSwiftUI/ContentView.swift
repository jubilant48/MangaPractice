//
//  ContentView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 17/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Manga", systemImage: "magazine")
                }
            
            FilterView()
                .tabItem {
                    Label("Filters", systemImage: "line.3.horizontal.decrease.circle")
                }
        }
    }
}
