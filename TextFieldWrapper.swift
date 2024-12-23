//
//  TextFieldWrapper.swift
//  AppSUI2411
//
//  Created by Andrei Kucherenko on 12/23/24.
//

import SwiftUI

struct UITextFieldWrapper: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no

        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged), for: .editingChanged)

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject {
        var parent: UITextFieldWrapper

        init(_ parent: UITextFieldWrapper) {
            self.parent = parent
        }

        @objc func textChanged(_ sender: UITextField) {
            parent.text = sender.text ?? ""
        }
    }
}
