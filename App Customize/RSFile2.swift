//
//  RSFile2.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/15.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSFile2: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: UIScreen.main.bounds.size.width * 9 / 16)
            
            RSToolBar(data: ["Frame", "Rewind", "Forward", "Play"])
                .background(Color(colors.background.toolbar))
            
            Image(systemName: "camera")
                .scaleEffect(5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(colors.background.basic))
                .foregroundColor(Color(.lightText))
            
            Text("2020-01-15 00:00:00")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(colors.background.toolbar))
                .foregroundColor(Color(colors.text.text))
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color(colors.theme.progressBar))
                    .frame(width: 100)
                Rectangle()
                    .fill(Color(colors.background.basic))
                    .frame(maxWidth: .infinity)

            }
            .frame(height: 50)
            
            RSToolBar(data: ["Snap", "AudioOff"], paddingImageBottom: true)
                .background(Color(colors.background.toolbar))
        }
    }
}

struct RSFile2_Previews: PreviewProvider {
    static var previews: some View {
        RSFile2().environmentObject(UserData.default)
    }
}
