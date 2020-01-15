//
//  RSPlayback2.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/15.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSPlayback2: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    var body: some View {
        VStack(spacing: 0) {
            RSPlayView()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)
            
            HStack {
                HStack {
                    Image("Calender")
                    Text("2020-01")
                        .foregroundColor(Color(colors.text.text))
                        .frame(height: 30)
                }
                .frame(maxWidth: .infinity)
                .background(Color(colors.background.list))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Image("Close")
            }
            .padding([.trailing, .leading], nil)
            .padding([.top, .bottom], 5)
            .background(Color(colors.background.toolbar))
            
            RSCalendar()
            
            RSToolBar(data: ["Device", "Snap", "Record", "RecordingMode_land", "AudioOff"], paddingImageBottom: true)
                .background(Color(colors.background.toolbar))
        }
    }
}

struct RSPlayback2_Previews: PreviewProvider {
    static var previews: some View {
        RSPlayback2().environmentObject(UserData.default)
    }
}
