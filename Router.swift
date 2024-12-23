//
//  Router.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//

import Foundation
import Combine

enum TabSelection: Hashable {
    case main
    case list
    case profile
}

final class Router: ObservableObject {
    @Published var selectedTab: TabSelection = .main

    init(
        selectedTab: TabSelection
    ) {
        self.selectedTab = selectedTab
    }

    func goToSecondTabAndOpenItem(withTitle name: String, viewModel: ListViewModel) {

        if let index = viewModel.foods.firstIndex(where: {
            $0.name == name
        }) {
            viewModel.selectedItem = viewModel.foods[index]
            selectedTab = .list
        }
    }
}
