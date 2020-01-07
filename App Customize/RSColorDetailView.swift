//
//  RSColorDetailView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorDetailView: View {
    
    @State var showColorView: Bool = false
    
    var key: String
    
    var rightButton: some View {
        Button(action: {
            self.showColorView.toggle()
        }) {
            Text("Change Color")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .navigationBarItems(trailing: rightButton)
        .navigationBarTitle((rs_color_map[key] ?? key))
        .sheet(isPresented: $showColorView) {
            RSColorView(model: RSColorModel(color: .magenta))
        }
    }
}

struct RSColorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RSColorDetailView(key: "textColorInColorView")
        }.environmentObject(UserData.default)
    }
}
