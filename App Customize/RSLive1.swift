//
//  RSLive1.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/8.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSLive1: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        GeometryReader { frame in
            VStack(spacing: 0) {
                RSPlayView()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)

                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color(self.userData.colors.background.list))
                            .frame(maxWidth: .infinity, maxHeight: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Demo 1 - Channel 01")
                            .foregroundColor(Color(self.userData.colors.text.text))
                    }
                    Image("RemotePlayback")
                }
                .padding()
                .background(Color(self.userData.colors.background.toolbar))
                
                RSDeviceList()
                                
                RSToolBar(data: ["Snap", "Record", "Split", "AudioOff", "TwoWayTalk"], paddingImageBottom: true)
                    .background(Color(self.userData.colors.background.toolbar))
            }
        }
    }
}

struct RSLive1_Previews: PreviewProvider {
    static var previews: some View {
        RSLive1().environmentObject(UserData.default)
    }
}
