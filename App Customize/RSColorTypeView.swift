//
//  RSColorTypeView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorTypeView: View {
    
    var data: (category: String, data: Array<String>)
    var body: some View {
        List {
            ForEach(data.data, id: \.self) { (key) in
                NavigationLink(destination: RSColorDetailView(key: key)) {
                    Text(rs_color_map[key] ?? key)
                }
            }
        }
        .navigationBarTitle(data.category)
    }
}

struct RSColorTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RSColorTypeView(data: (category: "textDetail", data: ["123", "456", "789"]))
    }
}
