//
//  RSFileItem.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/7.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSFileItem: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }
    
    var date: String
    var time: String
    var detail: String
    var uuid: UUID = UUID()
    
    var body: some View {
        HStack {
            Image(systemName: "camera")
                .frame(width: 140, height: 80)
                .scaleEffect(3)
                .background(Color(.lightGray))
                .foregroundColor(Color(.white))
            VStack(alignment: .leading) {
                Text(date).foregroundColor(Color(colors.text.text))
                Text(time).foregroundColor(Color(colors.text.text))
                Text(detail).foregroundColor(Color(colors.text.detail)).font(.custom("" ,size: 13))
            }
            Spacer()
            Image("SelectAll")
        }
    }
}

struct RSFileSection: View {
    
    @EnvironmentObject var userData: UserData
    
    var colors: RSCustomColor {
        self.userData.colors
    }
    
    var date: String
    var dataArr: Array<RSFileItem>
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 0) {
            Rectangle().fill(Color(.clear)).frame(height: 10)

            HStack {
                Rectangle()
                    .fill(Color(self.colors.theme.switch))
                    .frame(width: 20, height: 20)
                Text(date)
                    .foregroundColor(Color(colors.text.text))
            }
            ForEach(dataArr, id: \.uuid) { (item) in
                item
            }
            .padding()
            
            Rectangle().fill(Color(colors.splite.normal)).frame(height: 1)
        }
    }
}

struct RSFileItem_Previews: PreviewProvider {
    static var previews: some View {
        RSFileItem(date: "2020-01-02", time: "09:07:33", detail: "Channel01-Demo1").environmentObject(UserData.default)
    }
}

struct RSFileSection_Previews: PreviewProvider {
    static var previews: some View {
        RSFileSection(date: "2020-01-02", dataArr: [
            .init(date: "2020-01-02", time: "09:07:33", detail: "Channel01-Demo1"),
            .init(date: "2020-01-02", time: "09:08:39", detail: "Channel02-Demo1"),
            .init(date: "2020-01-02", time: "19:08:39", detail: "Channel03-Demo2")
        ]).environmentObject(UserData.default)
    }
}

