//
//  RSPlayback1.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/14.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSPlayback1: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    var body: some View {
        VStack(spacing: 0) {
            RSPlayView()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)
            
            RSToolBar(data: ["Frame", "Rewind", "Forward", "Play", "CloseAll"])
                .background(Color(colors.background.toolbar))
            
            ZStack {
                Rectangle()
                    .fill(Color(colors.background.basic))
                VStack {
                    Spacer()
                    HStack {
                        Image("Calender")
                        Text("2020-01-15 00:00:00")
                            .foregroundColor(Color(colors.text.text))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(colors.background.list))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
            }
            
            RSTimeBar()
                .frame(height: 120)
            
            RSToolBar(data: ["Device", "Snap", "Record", "RecordingMode_land", "AudioOff"], paddingImageBottom: true)
                .background(Color(colors.background.toolbar))
        }
    }
}

struct RSPlayback1_Previews: PreviewProvider {
    static var previews: some View {
        RSPlayback1().environmentObject(UserData.default)
    }
}
