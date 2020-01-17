//
//  RSLive2.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/14.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSLive1: View {
    var body: some View {
        GeometryReader { frame in
            ZStack {
                RSLive2()
                HStack {
                    RSMenu()
                        .frame(width: frame.size.width * 3 / 4)
                    Spacer()
                }
            }
        }
    }
}

struct RSLive2_Previews: PreviewProvider {
    static var previews: some View {
        RSLive1().environmentObject(UserData.default)
    }
}
