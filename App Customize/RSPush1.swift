//
//  RSPush1.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/15.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSPush1: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    
    enum NotiFicationType {
        case motion
        case io
    }
    
    func notification(type: NotiFicationType, checked: Bool, device: String, channel: String, time: String) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("f")
                        Text("\(device) - \(channel)")
                        Text(time)
                    }
                    .foregroundColor(Color(checked ? colors.text.text : colors.text.notice))
                }
                
                Spacer()
            }
            .padding(.leading, nil)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            notification(type: .motion, checked: false, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
            notification(type: .motion, checked: true, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
            notification(type: .io, checked: false, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
            notification(type: .io, checked: true, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
            notification(type: .motion, checked: false, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
            
            Spacer()
            
            RSToolBar(data: ["ClearAll", "AllChecked"], paddingImageBottom: true)
            .background(Color(colors.background.toolbar))
        }
    }
}

struct RSPush1_Previews: PreviewProvider {
    static var previews: some View {
        RSPush1().environmentObject(UserData.default)
    }
}
