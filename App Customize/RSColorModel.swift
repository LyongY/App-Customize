//
//  RSColorModel.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/2.
//  Copyright © 2020 LyongY. All rights reserved.
//

import UIKit

class RSColorModel: ObservableObject {
    
    enum ColorMode: String, CaseIterable {
        case rgb = "RGB Sliders"
        case hsb = "HSB Sliders"
        case all = "all"
    }
    
    @Published var mode: ColorMode = .rgb
    @Published var color: UIColor {
        didSet {
            self.updateColorValue()
        }
    }
    
    var red: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.red) != Float(red) {
//                color = UIColor(red: CGFloat(Float(red)!), green: colorTouple.green, blue: colorTouple.blue, alpha: 1)
//            }
//        }
//    }
    var green: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.green) != Float(green) {
//                color = UIColor(red: colorTouple.red, green: CGFloat(Float(green)!), blue: colorTouple.blue, alpha: 1)
//            }
//        }
//    }
    var blue: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.blue) != Float(blue) {
//                color = UIColor(red: colorTouple.red, green: colorTouple.green, blue: CGFloat(Float(blue)!), alpha: 1)
//            }
//        }
//    }
    var hue: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.hue) != Float(hue) {
//                color = UIColor(hue: CGFloat(Float(hue)!), saturation: colorTouple.saturation, brightness: colorTouple.brightness, alpha: 1)
//            }
//        }
//    }
    var saturation: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.saturation) != Float(saturation) {
//                color = UIColor(hue: colorTouple.hue, saturation: CGFloat(Float(saturation)!), brightness: colorTouple.brightness, alpha: 1)
//            }
//        }
//    }
    var brightness: String
//    {
//        didSet {
//            let colorTouple = self.getColorTouple
//            if Float(colorTouple.brightness) != Float(brightness) {
//                color = UIColor(hue: colorTouple.hue, saturation: colorTouple.saturation, brightness: CGFloat(Float(brightness)!), alpha: 1)
//            }
//        }
//    }

    
    var r: Double = 0
        
    init(color: UIColor) {
        self.color = color
        red = ""
        green = ""
        blue = ""
        hue = ""
        saturation = ""
        brightness = ""
        self.updateColorValue()
    }
    
    func updateColorValue() {
        let colorTouple = self.getColorTouple
        red = "\(Int(colorTouple.red * 255))"
        green = "\(Int(colorTouple.green * 255))"
        blue = "\(Int(colorTouple.blue * 255))"
        hue = "\(Int(colorTouple.hue * 360))°"
        saturation = "\(Int(colorTouple.saturation * 100))%"
        brightness = "\(Int(colorTouple.brightness * 100))%"
    }
    
    var getColorTouple: (red: CGFloat, green: CGFloat, blue: CGFloat, hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var blue: CGFloat = 0
        var h: CGFloat = 0
        var s: CGFloat = 0
        var brightness: CGFloat = 0
        var alph: CGFloat = 0
        
        self.color.getHue(&h, saturation: &s, brightness: &brightness, alpha: &alph)
        if !self.color.getRed(&r, green: &g, blue: &blue, alpha: &alph) {
            var white: CGFloat = 0
            if self.color.getWhite(&white, alpha: &alph) {
                r = white
                g = white
                blue = white
            }
        }
        return (r, g, blue, h, s, brightness)
    }

    var hexColorString: String {
        let colorTouple = self.getColorTouple
        let colorStr = "#" + String(format: "%02x", Int(colorTouple.red * 255)) + String(format: "%02x", Int(colorTouple.green * 255)) + String(format: "%02x", Int(colorTouple.blue * 255))
        return colorStr
    }
}
