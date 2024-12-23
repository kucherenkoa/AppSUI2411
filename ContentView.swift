//
//  ContentView.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: ListViewModel = ListViewModel()
    @StateObject var router: Router = Router(selectedTab: .main)

    var body: some View {
        TabView(selection: $router.selectedTab) {
            MainScreen(router: router, viewModel: viewModel)
                .tag(TabSelection.main)
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            ListScreen(viewModel: viewModel)
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
