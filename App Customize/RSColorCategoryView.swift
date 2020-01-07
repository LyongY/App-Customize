//
//  RSColorCategoryView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/6.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColorCategoryView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(rs_color_category_data, id: \.category) { touple in
                    NavigationLink(destination: RSColorTypeView(data: (category: touple.category, data: touple.data))) {
                        Text(touple.category)
                    }
                }
            }
            .navigationBarTitle("Color Category")
        }
    }
}

struct RSColorCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RSColorCategoryView()
    }
}
