//
//  ListScreen.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/22/24.
//


import SwiftUI

struct Food: Identifiable {

    let id: Int = UUID().hashValue
    let name: String
    let isFave: Bool
    var isSelected: Bool = false

}

final class ListViewModel: ObservableObject {

    @Published var favoritesOnly: Bool = false

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

    @StateObject var viewModel: ListViewModel = .init()

    var body: some View {
        NavigationView {
            FoodlistView()
                .environmentObject(viewModel)
                .navigationTitle("Foods")
        }
    }
}


struct FoodlistView: View {

    @EnvironmentObject var viewModel: ListViewModel
    @State var toggleText: String = "Favorites Only"

    var body: some View {
        VStack {
            FoodFilterView(toggleText: $toggleText)
            List(viewModel.foods) { item in
                let showItem = viewModel.favoritesOnly ? item.isFave : true

                switch showItem {
                case true:
                    NavigationLink(destination: FoodScreen(title: item.name)) {
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
    @EnvironmentObject var viewModel: ListViewModel

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

#Preview {
    ListScreen()
}
