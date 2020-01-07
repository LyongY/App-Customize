//
//  RSDeviceList.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSDeviceList: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    func deviceItem(name: String, online: Bool, fold: Bool) -> some View {
        VStack {
            HStack {
                Image(online ? "DVonline" : "DVoffline")
                Text(name).foregroundColor(Color(online ? colors.text.text : colors.text.disable))
                Spacer()
                Image(online ? (fold ? "Fold" : "Unfold") : "")
            }
            .padding([.leading, .trailing])
            
            Rectangle().fill(Color(colors.splite.normal)).frame(height: 1).offset(x: 20, y: 0)
        }
    }
    
    func background(online: Bool, selected: Bool) -> some View {
        if online {
            if selected {
                return LinearGradient(gradient: .init(colors: [Color(colors.theme.itemStart), Color(colors.theme.itemEnd)]), startPoint: .init(x: 0.0, y: 0.5), endPoint: .init(x: 1, y: 0.5))
            } else {
                return LinearGradient(gradient: .init(colors: [Color(.clear), Color(.clear)]), startPoint: .init(x: 0.0, y: 0.5), endPoint: .init(x: 1, y: 0.5))
            }
        } else {
            return LinearGradient(gradient: .init(colors: [Color(.clear), Color(.clear)]), startPoint: .init(x: 0.0, y: 0.5), endPoint: .init(x: 1, y: 0.5))
        }
    }
    
    func channelItem(name: String, online: Bool, selected: Bool) -> some View {
        HStack {
            Image(online ? "CHonline" : "CHoffline")
            Text("  \(name)  ")
                .background(background(online: online, selected: selected))
                .foregroundColor(Color(online ? (selected ? colors.text.inColorView : colors.text.text) : colors.text.disable))
                .clipShape(RoundedRectangle(cornerRadius: 200))
            Spacer()
        }.offset(x: 30)
    }
    
    var body: some View {
        VStack {
            deviceItem(name: "Demo2 Online", online: true, fold: true)
            deviceItem(name: "Demo1 Offline", online: false, fold: true)
            deviceItem(name: "Demo3 Unfold", online: true, fold: false)
            channelItem(name: "Channel 1", online: true, selected: false)
            channelItem(name: "Channel 2", online: false, selected: false)
            channelItem(name: "Channel 3", online: true, selected: true)
            channelItem(name: "Channel 4", online: true, selected: false)
                
            Spacer()
        }
    }
}

struct RSDeviceList_Previews: PreviewProvider {
    static var previews: some View {
        RSDeviceList().environmentObject(UserData())
    }
}
