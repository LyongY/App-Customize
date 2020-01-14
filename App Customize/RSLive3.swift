//
//  RSLive3.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/14.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSLive3: View {
    
    @EnvironmentObject var userData: UserData
    
    func spliteHStack(imageNameArr: Array<String>) -> some View {
        HStack {
            Group {
                ForEach(imageNameArr, id: \.self) { (name) in
                    Image(name)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            RSPlayView()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)
            
            VStack {
                Spacer()
                spliteHStack(imageNameArr: ["Split1", "Split4", "Split6", "Split8"])
                Rectangle().fill(Color(.clear)).frame(height: 50)
                spliteHStack(imageNameArr: ["", "Split9", "Split16", ""])
                Spacer()
            }
            .background(Color(self.userData.colors.background.basic))
            
            RSToolBar(data: ["Snap", "Record", "Split", "AudioOff", "TwoWayTalk"], paddingImageBottom: true)
                .background(Color(self.userData.colors.background.toolbar))
        }
    }
}

struct RSLive3_Previews: PreviewProvider {
    static var previews: some View {
        RSLive3().environmentObject(UserData.default)
    }
}
