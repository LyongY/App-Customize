//
//  RSDetail_Table.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/2/14.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI


struct RSDetail_Table: View {

    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }
    
    @State var firstPush = true
    @State var secondPush = false

    func pushDeviceItem(name: String, pushOpen: Binding<Bool>) -> some View {
        VStack(spacing: 0) {
            Toggle("", isOn: pushOpen)
//            {
//                HStack {
//                    Image("DVonline")
//                    Text(name).foregroundColor(Color(colors.text.text))
//                }
//            }
                .toggleStyle(RSToggleStyle(imageName: "DVonline", label: name, labelColor: colors.text.text, onColor: Color(colors.theme.switch), offColor: Color(.lightGray), thumbColor: Color(.white)))
                .padding([.leading, .trailing])
            
            Rectangle().fill(Color(colors.splite.normal)).frame(height: 1).offset(x: 20, y: 0)
        }
        .background(Color(colors.background.list))
    }

    var body: some View {
        VStack {
            RSDeviceList()
                .frame(maxHeight: 260)
            
            Rectangle()
                .fill(Color(.clear))
                .frame(height: 10)
                
            VStack(spacing: 0) {
                RSPush1().notification(type: .motion, checked: false, device: "Device1", channel: "Channel01", time: "2020-01-15 00:00:00")
                RSPush1().notification(type: .io, checked: false, device: "Device2", channel: "Channel02", time: "2020-01-15 00:00:00")
            }
            
            VStack(spacing: 0) {
                pushDeviceItem(name: "Device1", pushOpen: $firstPush)
                pushDeviceItem(name: "Device2", pushOpen: $secondPush)
            }
        }
    }
}

struct RSDetail_Table_Previews: PreviewProvider {
    static var previews: some View {
        RSDetail_Table().environmentObject(UserData.default)
    }
}

struct RSToggleStyle: ToggleStyle {
    var imageName = ""
    var label = ""
    var labelColor = UIColor.black
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            HStack {
                Image(imageName)
                Text(label)
//                    .font(.custom("", size: 17))
                    .foregroundColor(Color(labelColor))
            }
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
        .font(.headline)
        .frame(height: 44)
    }
}
