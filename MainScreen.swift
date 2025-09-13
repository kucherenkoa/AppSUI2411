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

    @State private var textFieldText = "Test"

    private let selectedItem: String = "🍒"

    var body: some View {
        VStack {
            UITextFieldWrapper(text: $textFieldText)
                            .frame(height: 50)
                            .padding(90)
            Text(textFieldText)

            Button(action: {
                router.goToSecondTabAndOpenItem(withTitle: selectedItem, viewModel: viewModel)
            }) {
                Text(selectedItem).font(.system(size: 250))
            }
        }
    }
}
