//
//  ContentView.swift
//  App Customize
//
//  Created by Raysharp666 on 2019/12/30.
//  Copyright © 2019 LyongY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    @State var showColors = false
    
    var leftButton: some View {
        Button(action: {

        }) {
            Text("Export")
        }
    }
    
    var rightButton: some View {
        Button(action: {
            self.showColors.toggle()
        }) {
            Text("Colors")
        }
    }
    
    var body: some View {
        GeometryReader { frame in
            NavigationView {
                RSScrollView {
                    HStack {
                        Text("1").frame(width: frame.size.width)
                        Text("2").frame(width: frame.size.width)
                        Text("3").frame(width: frame.size.width)
                        Text("4").frame(width: frame.size.width)
                        Text("5").frame(width: frame.size.width)
                        Text("6").frame(width: frame.size.width)
                        Text("7").frame(width: frame.size.width)
                        Text("8").frame(width: frame.size.width)
                    }
                }
                .navigationBarItems(leading: self.leftButton, trailing: self.rightButton)
                .sheet(isPresented: self.$showColors) {
                    RSColorCategoryView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
