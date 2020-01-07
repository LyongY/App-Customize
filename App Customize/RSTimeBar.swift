//
//  RSTimeBar.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSTimeBar: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    func timeString(index: Int) -> String {
        var hour: Int = 0
        var min: Int = 0
        hour = index / 2 + 2
        min = index % 2 == 0 ? 0 : 1
        let string = String(format: "%02d:%02d", hour, min * 30)
        return string
    }
    
    var body: some View {
        GeometryReader { frame in
            ZStack {
                Path { path in
                    path.move(to: .init(x: 0, y: frame.size.height * 0.6))
                    path.addLine(to: .init(x: frame.size.width, y: frame.size.height * 0.6))
                }
                .stroke(Color(self.colors.timebar.spliteNormal))
                
                ForEach(0 ..< 19) { (index) in
                    Path { path in
                        path.move(to: .init(x: CGFloat(index) * frame.size.width / 18, y: frame.size.height * 0.6))
                        path.addLine(to: .init(x: CGFloat(index) * frame.size.width / 18, y: frame.size.height * 0.6 - 5))
                    }
                    .stroke(Color(self.colors.timebar.spliteNormal))
                }
                
                ForEach(0 ..< 7) { (index) in
                    Path { path in
                        path.move(to: .init(x: CGFloat(index) * frame.size.width / 6, y: frame.size.height * 0.6))
                        path.addLine(to: .init(x: CGFloat(index) * frame.size.width / 6, y: frame.size.height * 0.6 - 9))
                    }
                    .stroke(Color(self.colors.timebar.spliteNormal))
                }
                
                Path { path in
                    path.move(to: .init(x: frame.size.width / 2, y: 0))
                    path.addLine(to: .init(x: frame.size.width / 2, y: frame.size.height))
                }
                .stroke(Color(self.colors.timebar.spliteCenterH))
                
                VStack {
                    Spacer(minLength: (frame.size.height - 60) * 0.6)
                    HStack(spacing: 0) {
                        ForEach(0 ..< 6) { index in
                            Text(self.timeString(index: index))
                                .frame(width: frame.size.width / 6).offset(x: frame.size.width / 12, y: 0)
                                .foregroundColor(Color(self.colors.timebar.spliteNormal))
                        }
                    }
                    Spacer(minLength: (frame.size.height - 60) * 0.4)
                }
            }
        }
    }
}

struct RSTimeBar_Previews: PreviewProvider {
    static var previews: some View {
        RSTimeBar().environmentObject(UserData())
    }
}
