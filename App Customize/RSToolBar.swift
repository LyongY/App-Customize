//
//  RSToolBar.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/10.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSToolBar: View {
    
    @EnvironmentObject var userData: UserData
    
    var data: Array<String>
    var paddingImageBottom: Bool = false
    var body: some View {
        HStack(spacing: 0) { // Toolbar
            Group {
                ForEach(data, id: \.self) { (name) in
                    Image(name)
                }
            }
            .padding(.bottom, paddingImageBottom ? 34 : 0)
            .frame(maxWidth: .infinity)
        }
    }
}

struct RSToolBar_Previews: PreviewProvider {
    static var previews: some View {
        RSToolBar(data: ["About", "File"]).environmentObject(UserData.default)
    }
}
