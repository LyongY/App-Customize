//
//  RSMenu.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSMenu: View {
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }
    
    func listItem(imageName: String, name: String) -> some View {
        HStack {
            Image(imageName)
                .frame(width: 40, height: 40)
            Text(name)
                .foregroundColor(Color(colors.text.text))
            Spacer()
        }
    }
    
    var body: some View {
        VStack {
            Image("LOGO")
            Rectangle().fill(Color(self.colors.splite.normal)).frame(height: 1)
            HStack {
                VStack(alignment: .leading) {
                    listItem(imageName: "RemoteSetting", name: "Remote Setting")
                    listItem(imageName: "LocalSetting", name: "Local Setting")
                    listItem(imageName: "File", name: "File")
                    listItem(imageName: "ServerList", name: "Device List")
                    HStack {
                        listItem(imageName: "Notifications", name: "Notification")
                        Text(" 299 ")
                            .background(Color(colors.background.notice))
                            .foregroundColor(Color(colors.text.notice))
                            .clipShape(RoundedRectangle(cornerRadius: 200))
                    }
                    listItem(imageName: "Help", name: "Help")
                    listItem(imageName: "About", name: "About")
                }
                Spacer()
            }
            .padding()
            Spacer()
        }
        .background(Color(colors.background.basic))
    }
}

struct RSMenu_Previews: PreviewProvider {
    static var previews: some View {
        RSMenu().environmentObject(UserData.default)
    }
}
