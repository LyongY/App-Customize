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
            VStack {
                RSPlayView()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9 / 16)
                HStack { // Toolbar
                    Image("About")
                    Image("File")
                }
                RSDeviceList()
                Spacer()
                HStack { // Toolbar
                    Image("About").padding(.bottom, nil)
                    Image("File").padding(.bottom, nil)
                }
            }
    }
}

struct RSLive1_Previews: PreviewProvider {
    static var previews: some View {
        RSLive1().environmentObject(UserData.default)
    }
}
