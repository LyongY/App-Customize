//
//  RSPlayView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSPlayView: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }

    func item(selected: Bool) -> some View {
        ZStack {
            Rectangle().fill(Color(.black))
            Rectangle().stroke(Color(selected ? .red : .gray), lineWidth: 3)
        }.clipped()
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                self.item(selected: false)
                self.item(selected: false)
                self.item(selected: false)
            }
            HStack(spacing: 0) {
                self.item(selected: false)
                self.item(selected: true)
                self.item(selected: false)
            }
            HStack(spacing: 0) {
                self.item(selected: false)
                self.item(selected: false)
                self.item(selected: false)
            }
        }
    }
}

struct RSPlayView_Previews: PreviewProvider {
    static var previews: some View {
        RSPlayView().environmentObject(UserData.default)
    }
}
