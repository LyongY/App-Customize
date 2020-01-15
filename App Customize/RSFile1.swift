//
//  RSFile1.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/15.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSFile1: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    func fileSection(title: String) -> some View {
        HStack {
            Rectangle().fill(Color(colors.theme.switch)).frame(width: 20, height: 20, alignment: .center)
            Text(title)
            Spacer()
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                Rectangle().fill(Color(colors.background.toolbar))
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color(colors.background.basic))
                            .frame(maxWidth: .infinity, maxHeight: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        HStack {
                            Image("Search_Bar")
                            Text("Search by date or device")
                                .foregroundColor(Color(colors.text.detail))
                            Spacer()
                        }
                    }
                    
                    Image("ThumbnailMode")
                    Image("ListMode_on")
                }
                .padding([.leading, .trailing], nil)

            }
            .frame(height: 50)
            
            RSFileSection(date: "2020-01-02", dataArr: [
                .init(date: "2020-01-02", time: "09:07:33", detail: "Channel01-Demo1"),
                .init(date: "2020-01-02", time: "19:08:39", detail: "Channel03-Demo2")
            ])
            
            RSFileSection(date: "2020-01-01", dataArr: [
                .init(date: "2020-01-01", time: "09:07:33", detail: "Channel01-Demo1"),
            ])

            Spacer()
            
            RSToolBar(data: ["SelectAll", "Send", "Delete"], paddingImageBottom: true)
                .background(Color(colors.background.toolbar))
        }
        .background(Color(colors.background.basic))
    }
}

struct RSFile1_Previews: PreviewProvider {
    static var previews: some View {
        RSFile1().environmentObject(UserData.default)
    }
}
