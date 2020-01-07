//
//  RSColorView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/2.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorView: View {
    @ObservedObject var model: RSColorModel
    
    var body: some View {
            VStack {

                Picker("", selection: $model.mode) {
                    ForEach(RSColorModel.ColorMode.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Rectangle()
                    .fill(Color(model.color))
                    .shadow(radius: 3)
                    .frame(width: 100, height: 100, alignment: .top)
                Text(model.hexColorString)
                
                
                if model.mode == .rgb || model.mode == .all {
                    VStack(alignment: .leading) {
                        Text("RGB")
                        RSColorSlider(model: model, colorType: .red)
                        RSColorSlider(model: model, colorType: .green)
                        RSColorSlider(model: model, colorType: .blue)
                    }
                }
                if model.mode == .hsb || model.mode == .all {
                    VStack(alignment: .leading) {
                        Text("HSB")
                        RSColorSlider(model: model, colorType: .hue)
                        RSColorSlider(model: model, colorType: .saturation)
                        RSColorSlider(model: model, colorType: .brightness)
                    }
                }
                Spacer()
                
                

            }
            .padding()
    }
}

struct RSColorView_Previews: PreviewProvider {
    static var previews: some View {
        RSColorView(model: .init(color: .cyan))
    }
}
