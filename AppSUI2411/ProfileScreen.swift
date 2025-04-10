//
//  ProfileScreen.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import SwiftUI

struct ProfileScreen: View {

    @State private var isSowModal: Bool = false

    var body: some View {
        Button(action: {
            isSowModal = true
        }) {
            Text("🐲 Show Modal")
                .font(.largeTitle)
        }
        .sheet(isPresented: $isSowModal) {
            Text("🐲").font(.system(size: 250))
        }
    }
}
