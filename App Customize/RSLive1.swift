//
//  RSLive1.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/8.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSLive1: View {
    var body: some View {
        GeometryReader { frame in
            VStack(spacing: 0) {
                RSPlayView()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)
                RSToolBar(data: ["About", "File", "File", "File", "File"])
                    .frame(height: 50)
                RSDeviceList()
                Spacer()
                RSToolBar(data: ["About", "File", "File", "File"], paddingImageBottom: true)
            }
        }
    }
}

struct RSLive1_Previews: PreviewProvider {
    static var previews: some View {
        RSLive1().environmentObject(UserData.default)
    }
}
