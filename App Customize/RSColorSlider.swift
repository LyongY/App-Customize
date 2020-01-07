//
//  RSColorSlider.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/2.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorSlider: View {
    
    enum ColorType {
        case red
        case green
        case blue
        case hue
        case saturation
        case brightness
    }
    
    @ObservedObject var model: RSColorModel
    var colorType: ColorType
    
    var gradientArr: [Color] {
        var colorTouple = self.model.getColorTouple
        var color: UIColor
        
        var arr: [Color] = []

        switch self.colorType {
        case .red:
            colorTouple.red = 0
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))
            colorTouple.red = 1
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))

        case .green:
            colorTouple.green = 0
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))
            colorTouple.green = 1
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))

        case .blue:
            colorTouple.blue = 0
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))
            colorTouple.blue = 1
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
            arr.append(Color(color))

        case .hue:
            for hue in 0...255 {
                colorTouple.hue = CGFloat(Double(hue) / 255.0)
                color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
                arr.append(Color(color))
            }
        case .saturation:
            colorTouple.saturation = 0
            color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
            arr.append(Color(color))
            colorTouple.saturation = 1
            color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
            arr.append(Color(color))

        case .brightness:
            colorTouple.brightness = 0
            color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
            arr.append(Color(color))
            colorTouple.brightness = 1
            color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
            arr.append(Color(color))

        }
        return arr
    }
    
    var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        return AnyTransition.asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        HStack {
            RSColorSliderRepresent(parent: self).background(LinearGradient(gradient: .init(colors: self.gradientArr), startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5)))
            RSColorValueView(model: model, colorType: self.colorType)
        }
        .transition(transition)
        .animation(.easeOut)
    }
}

struct RSColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        RSColorSlider(model: .init(color: .cyan), colorType: .hue)
    }
}



struct RSColorSliderRepresent: UIViewRepresentable {
    
    var parent: RSColorSlider
    
    func makeUIView(context: UIViewRepresentableContext<RSColorSliderRepresent>) -> UISlider {
        let rect = CGRect(origin: .zero, size: CGSize(width: 20, height: 30))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        UIColor.blue.setFill()
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 20, height: 30))
        UIColor.black.setStroke()
        UIColor.white.setFill()
        path.fill()
        path.stroke()
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let slider = RSColorSliderRepresentClass(parent: self.parent)
        slider.setThumbImage(image, for: .normal)
        slider.maximumTrackTintColor = .clear
        slider.minimumTrackTintColor = .clear
        
        let colorTouple = self.parent.model.getColorTouple
        
        switch self.parent.colorType {
        case .red:
            slider.value = Float(colorTouple.red)
        case .green:
            slider.value = Float(colorTouple.green)
        case .blue:
            slider.value = Float(colorTouple.blue)
        case .hue:
            slider.value = Float(colorTouple.hue)
        case .saturation:
            slider.value = Float(colorTouple.saturation)
        case .brightness:
            slider.value = Float(colorTouple.brightness)
        }
        
        return slider
    }
        
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<RSColorSliderRepresent>) {
        let colorTouple = self.parent.model.getColorTouple
        switch self.parent.colorType {
        case .red:
            uiView.value = Float(colorTouple.red)
        case .green:
            uiView.value = Float(colorTouple.green)
        case .blue:
            uiView.value = Float(colorTouple.blue)
        case .hue:
            uiView.value = Float(colorTouple.hue)
        case .saturation:
            uiView.value = Float(colorTouple.saturation)
        case .brightness:
            uiView.value = Float(colorTouple.brightness)
        }
    }
}

class RSColorSliderRepresentClass: UISlider {
    var parent: RSColorSlider
    init(parent: RSColorSlider) {
        self.parent = parent
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueChange(slider:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func valueChange(slider: UISlider) {
        let colorTouple = self.parent.model.getColorTouple
        var color: UIColor?
        switch parent.colorType {
        case .red:
            color = UIColor(red: CGFloat(slider.value), green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
        case .green:
            color = UIColor(red: colorTouple.red, green: CGFloat(slider.value), blue: colorTouple.blue, alpha: 1)
        case .blue:
            color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: CGFloat(slider.value), alpha: 1)
        case .hue:
            color = UIColor(hue: CGFloat(slider.value), saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
        case .saturation:
            color = UIColor(hue: colorTouple.hue, saturation: CGFloat(slider.value), brightness: colorTouple.brightness, alpha: 1)
        case .brightness:
            color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: CGFloat(slider.value), alpha: 1)
        }
        print(color!)
        parent.model.color = color!
    }
}
