//
//  MainScreen.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import SwiftUI

struct MainScreen: View {

    @ObservedObject var router: Router
    @ObservedObject var viewModel: ListViewModel

    private let selectedItem: String = "🍒"

    var body: some View {
        Button(action: {
            router.goToSecondTabAndOpenItem(withTitle: selectedItem, viewModel: viewModel)
        }) {
            Text(selectedItem).font(.system(size: 250))
        }
    }
}
