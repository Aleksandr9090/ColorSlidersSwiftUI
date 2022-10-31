//
//  TextView.swift
//  ColorSlidersSwiftUI
//
//  Created by Aleksandr on 31.10.2022.
//

import SwiftUI

struct TextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(value: 128)
    }
}
