//
//  MainScreen.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import SwiftUI

struct MainScreen: View {
    @Binding var tabSelection: TabSelection
    var body: some View {
        Button(action: {
            tabSelection = .list
        }) {
            Text("🍒").font(.system(size: 250))
        }
    }
}
