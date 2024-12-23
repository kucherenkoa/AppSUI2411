//
//  ListScreen.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//


import SwiftUI

struct Food: Identifiable, Hashable {
    let id: Int = UUID().hashValue
    let name: String
    let isFave: Bool

    static func == (lhs: Food, rhs: Food) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

final class ListViewModel: ObservableObject {

    @Published var favoritesOnly: Bool = false
    @Published var selectedItem: Food? = nil

    @Published var foods: [Food] = [
        .init(name: "🍏", isFave: true),
        .init(name: "🍔", isFave: false),
        .init(name: "🥑", isFave: true),
        .init(name: "🥚", isFave: false),
        .init(name: "🍒", isFave: true),
        .init(name: "🥬", isFave: true),
    ]
}

struct ListScreen: View {

    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        NavigationView {
            FoodlistView(viewModel: viewModel)
                .navigationTitle("Foods")
        }
    }
}


struct FoodlistView: View {

    @ObservedObject var viewModel: ListViewModel
    @State var toggleText: String = "Favorites Only"

    var body: some View {
        VStack {
            FoodFilterView(toggleText: $toggleText, viewModel: viewModel)

            List(viewModel.foods) { item in
                let showItem = viewModel.favoritesOnly ? item.isFave : true

                switch showItem {
                    case true:
                        NavigationLink(
                            destination: FoodScreen(title: item.name),
                            tag: item,
                            selection: $viewModel.selectedItem
                        ) {
                            Text(item.name)
                                .font(.system(size: 80))
                        }
                    case false:
                        EmptyView()
                }
            }
        }
    }
}

struct FoodFilterView: View {

    @Binding var toggleText: String
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        Toggle(isOn: $viewModel.favoritesOnly) {
            Text(toggleText)
                .font(.headline)
                .padding(.leading)
        }
    }
}

struct FoodScreen: View {
    
    var title: String

    var body: some View {
        Text(title).font(.system(size: 250))
    }
}
