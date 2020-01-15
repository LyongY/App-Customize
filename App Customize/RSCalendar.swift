//
//  RSCalendar.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSCalendar: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    var data: Array<(name: String, enable: Bool, selected: Bool, today: Bool, uuid: UUID)> {
        var arr: Array<(name: String, enable: Bool, selected: Bool, today: Bool, uuid: UUID)> = [
            (name: "Sun", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Mon", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Tue", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Wed", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Thr", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Fri", enable: true, selected: false, today: false, uuid:UUID()),
            (name: "Sat", enable: true, selected: false, today: false, uuid:UUID()),
        ]
        for item in 29...31 {
            arr.append((name: "\(item)", enable: false, selected: false, today: false, uuid:UUID()))
        }
        for item in 1...31 {
            if item == 5 {
                arr.append((name: "\(item)", enable: true, selected: true, today: false, uuid:UUID()))
            } else {
                if item == 10 {
                    arr.append((name: "\(item)", enable: true, selected: false, today: true, uuid:UUID()))
                } else {
                    arr.append((name: "\(item)", enable: true, selected: false, today: false, uuid:UUID()))
                }
            }
        }
        for item in 1...8 {
            arr.append((name: "\(item)", enable: false, selected: false, today: false, uuid:UUID()))
        }

        return arr
    }
    
    func data(section: Int) -> Array<(name: String, enable: Bool, selected: Bool, today: Bool, uuid: UUID)> {
        let arr = self.data[7 * section ..< 7 * (section + 1)]
        return Array(arr)
    }
    
    var body: some View {
        GeometryReader { frame in
            VStack(spacing: 0) {
                ForEach(0..<7) { (index) in
                    HStack(spacing: 0) {
                        ForEach(self.data(section: index), id: \.uuid) { (touple) in
                            Text("  \(touple.name)  ")
                                .background(LinearGradient(gradient: .init(colors: [Color(touple.selected ? self.colors.theme.itemStart : .clear), Color(touple.selected ? self.colors.theme.itemEnd : .clear)]), startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5)))
                                .foregroundColor(Color(touple.selected ? self.colors.text.inColorView : (touple.today ? self.colors.text.today : (touple.enable ? self.colors.text.text : self.colors.text.disable))))
                                .clipShape(RoundedRectangle(cornerRadius: 200))
                                .frame(width: frame.size.width / 7, height: frame.size.height / 7)
                        }
                    }
                }
            }
        }
        .background(Color(colors.background.basic))
    }
}

struct RSCalendar_Previews: PreviewProvider {
    static var previews: some View {
        RSCalendar().environmentObject(UserData.default)
    }
}
