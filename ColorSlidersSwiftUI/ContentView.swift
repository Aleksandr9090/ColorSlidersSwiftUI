//
//  ContentView.swift
//  ColorSlidersSwiftUI
//
//  Created by Aleksandr on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = 100.0
    @State private var green = 150.0
    @State private var blue = 200.0
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        
        ZStack {
            Color(white: 0.6).ignoresSafeArea()
                .onTapGesture {
                isInputActive = false
            }
            
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

