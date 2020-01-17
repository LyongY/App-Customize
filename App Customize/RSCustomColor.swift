//
//  RSCustomColor.swift
//  App Customize
//
//  Created by Raysharp666 on 2019/12/30.
//  Copyright © 2019 LyongY. All rights reserved.
//

import UIKit
import Combine

struct RSCustomColor {
    var text = TextColor()
    var background = Background()
    var timebar = Timebar()
    var theme = Theme()
    var splite = Splite()
    
    subscript(_ colorKey: String) -> UIColor {
        return allColor[colorKey]!
    }
}

extension RSCustomColor {
    struct TextColor {
        var text: UIColor = allColor["textColor"]! { didSet { allColor["textColor"] = text } }
        var detail: UIColor = allColor["textDetail"]! { didSet { allColor["textDetail"] = detail } }
        var disable: UIColor = allColor["textDisable"]! { didSet { allColor["textDisable"] = disable } }
        var navigation: UIColor = allColor["textNavigation"]! { didSet { allColor["textNavigation"] = navigation } }
        var today: UIColor = allColor["textToday"]! { didSet { allColor["textToday"] = today } }
        var notice: UIColor = allColor["textNotice"]! { didSet { allColor["textNotice"] = notice } }
        var inColorView: UIColor = allColor["textColorInColorView"]! { didSet { allColor["textColorInColorView"] = inColorView } }
        var connectOnline: UIColor = allColor["textConnectOnline"]! { didSet { allColor["textConnectOnline"] = connectOnline } }
        var connectOffline: UIColor = allColor["textConnectOffline"]! { didSet { allColor["textConnectOffline"] = connectOffline } }
    }
}

extension RSCustomColor {
    struct Background {
        var basic: UIColor = allColor["backgroundBasic"]! { didSet { allColor["backgroundBasic"] = basic } }
        var list: UIColor = allColor["backgroundList"]! { didSet { allColor["backgroundList"] = list } }
        var toolbar: UIColor = allColor["backgroundToolbar"]! { didSet { allColor["backgroundToolbar"] = toolbar } }
        var mark: UIColor = allColor["backgroundMark"]! { didSet { allColor["backgroundMark"] = mark } }
        var notice: UIColor = allColor["backgroundNotice"]! { didSet { allColor["backgroundNotice"] = notice } }
    }
}

extension RSCustomColor {
    struct Timebar {
        var background: UIColor = allColor["timebarBackground"]! { didSet { allColor["timebarBackground"] = background } }
        var spliteNormal: UIColor = allColor["timebarSpliteNormal"]! { didSet { allColor["timebarSpliteNormal"] = spliteNormal } }
        var spliteCenterH: UIColor = allColor["timebarSpliteCenterHorizontal"]! { didSet { allColor["timebarSpliteCenterHorizontal"] = spliteCenterH } }
    }
}

extension RSCustomColor {
    struct Theme {
        var start: UIColor = allColor["themeStart"]! { didSet { allColor["themeStart"] = start } }
        var end: UIColor = allColor["themeEnd"]! { didSet { allColor["themeEnd"] = end } }
        var itemStart: UIColor = allColor["themeItemStart"]! { didSet { allColor["themeItemStart"] = itemStart } }
        var itemEnd: UIColor = allColor["themeItemEnd"]! { didSet { allColor["themeItemEnd"] = itemEnd } }
        var `switch`: UIColor = allColor["themeSwitch"]! { didSet { allColor["themeSwitch"] = `switch` } }
        var progressBar: UIColor = allColor["themeProgressBar"]! { didSet { allColor["themeProgressBar"] = progressBar } }
        var button: UIColor = allColor["themeButton"]! { didSet { allColor["themeButton"] = button } }
        var buttonPress: UIColor = allColor["themeButtonPress"]! { didSet { allColor["themeButtonPress"] = buttonPress } }
    }
}

extension RSCustomColor {
    struct Splite {
        var normal: UIColor = allColor["spliteNormal"]! { didSet { allColor["spliteNormal"] = normal } }
        var selected: UIColor = allColor["spliteSelected"]! { didSet { allColor["spliteSelected"] = selected } }
    }
}










