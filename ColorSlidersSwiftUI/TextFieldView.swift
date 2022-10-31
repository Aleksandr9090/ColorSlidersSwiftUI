//
//  TextFieldView.swift
//  ColorSlidersSwiftUI
//
//  Created by Aleksandr on 31.10.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $text, onEditingChanged: { _ in
            checkValue()
        })
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong format", isPresented: $showAlert, actions: {}) {
            Text("Enter value from 0 to 255")
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("111"), value: .constant(111.0))
    }
}

extension TextFieldView {
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}
