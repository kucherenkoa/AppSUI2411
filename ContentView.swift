//
//  ContentView.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import SwiftUI

enum TabSelection: Hashable {
    case main
    case list
    case profile
}

struct ContentView: View {
    @State var tabSelection: TabSelection = .main
    var body: some View {
        TabView(selection: $tabSelection) {
            MainScreen(tabSelection: $tabSelection)
                .tag(TabSelection.main)
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            ListScreen()
                .tag(TabSelection.list)
                .tabItem {
                    Label("List", systemImage: "list.clipboard")
                }
            ProfileScreen()
                .tag(TabSelection.profile)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
