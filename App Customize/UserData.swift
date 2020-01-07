//
//  UserData.swift
//  App Customize
//
//  Created by Raysharp666 on 2019/12/31.
//  Copyright © 2019 LyongY. All rights reserved.
//

import UIKit
import Combine
import Kanna

class UserData: NSObject, ObservableObject {
    var xml: XMLDocument
    @Published var colors: RSCustomColor {
        didSet {
            writeAllColor(path: Bundle.main.path(forResource: "colors", ofType: "xml")!, xml: xml, colors: allColor)
        }
    }
    
    override init() {
        xml = try! Kanna.XML(url: URL(fileURLWithPath: Bundle.main.path(forResource: "colors", ofType: "xml")!), encoding: .utf8)
        colors = RSCustomColor.default
    }
}

var allColor: Dictionary<String, UIColor> = loadAllColor(path: Bundle.main.path(forResource: "colors", ofType: "xml"))

func loadAllColor(path: String?) -> Dictionary<String, UIColor> {
    var colorDic: Dictionary<String, UIColor> = [:]
    guard let path = path, let doc = try? Kanna.XML(url: URL(fileURLWithPath: path), encoding: .utf8) else {
        return colorDic
    }
    let colorElement = doc.xpath("//color")
    for item in colorElement {
        if let key = item["name"],
            let value = item.text
        {
            let hexString = value.replacingOccurrences(of: "#", with: "")
            var rgb: UInt64 = 0
            Scanner(string: hexString).scanHexInt64(&rgb)
            
            let color = UIColor(red: CGFloat(Double((rgb & 0xFF0000) >> 16) / 255.0),
                                green: CGFloat(Double((rgb & 0xFF00) >> 8) / 255.0),
                                blue: CGFloat(Double((rgb & 0xFF) >> 0) / 255.0),
                                alpha: 1)
            colorDic[key] = color
        }
    }
    return colorDic
}

func writeAllColor(path: String, xml: XMLDocument, colors: Dictionary<String, UIColor>) {
    for (colorKey, colorValue) in colors {
        for var element in xml.xpath("//color") {
            if element["name"] == colorKey {
                var r: CGFloat = 0;
                var g: CGFloat = 0;
                var b: CGFloat = 0;
                var a: CGFloat = 0;
                if !colorValue.getRed(&r, green: &g, blue: &b, alpha: &a) {
                    var white: CGFloat = 0
                    if colorValue.getWhite(&white, alpha: &a) {
                        r = white
                        g = white
                        b = white
                    }
                }
                
                let colorStr = "#" + String(format: "%02x", Int(r * 255)) + String(format: "%02x", Int(g * 255)) + String(format: "%02x", Int(b * 255))
                element.content = colorStr
                break
            }
        }
    }
    if let xmlStr = xml.toXML {
        try? xmlStr.write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
        print(path)
    }
}
