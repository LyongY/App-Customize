//
//  RSColorValueView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/3.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorValueView: View {
    
    @ObservedObject var model: RSColorModel
    var colorType: RSColorSlider.ColorType
    
    var body: some View {
        switch colorType {
        case .red:
            return TextField("", text: $model.red).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        case .green:
            return TextField("", text: $model.green).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        case .blue:
            return TextField("", text: $model.blue).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        case .hue:
            return TextField("", text: $model.hue).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        case .saturation:
            return TextField("", text: $model.saturation).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        case .brightness:
            return TextField("", text: $model.brightness).frame(minWidth: 50, idealWidth: 50, maxWidth: 50, alignment: .leading)
        }
    }
}

struct RSColorValueView_Previews: PreviewProvider {
    static var previews: some View {
        RSColorValueView(model: RSColorModel(color: .cyan), colorType: .red)
    }
}
