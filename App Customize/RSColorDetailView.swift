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
    
    @State var key: String
    
    var rightButton: some View {
        Button(action: {
            self.showColorView.toggle()
        }) {
            Text("Change Color")
        }
    }
    
    var body: some View {
        detailView
        .navigationBarItems(trailing: rightButton)
        .navigationBarTitle((rs_color_map[key] ?? key))
        .sheet(isPresented: $showColorView) {
            RSColorView(model: RSColorModel(key: self.key, userData: .constant(.default))!)
                .environmentObject(UserData.default)
        }
    }
    
    var detailView: AnyView {
        
        let tableArr = ["textColor", "textDetail", "textDisable", "textColorInColorView", "backgroundList", "spliteNormal", "textNotice", "themeSwitch", ]
        let timebarArr = ["timebarBackground", "timebarSpliteNormal", "timebarSpliteCenterHorizontal", ]
        let live2AndPopArr = ["textNavigation", "themeStart", "themeEnd", "backgroundBasic", "backgroundToolbar", "themeItemStart", "themeItemEnd", ]
        let playWindowArr = ["spliteSelected", ]
        let calendarArr = ["textToday", "backgroundMark", ]
        let live1Arr = ["backgroundNotice", ]
        let fileArr = ["themeProgressBar", ]
        let deviceListArr = ["textConnectOnline", "textConnectOffline", ]
        let scanQRCodeArr = ["themeButton", "themeButtonPress", ]
        
        
        if tableArr.contains(key) {
            return AnyView(RSDetail_Table())
        } else if timebarArr.contains(key) {
            return AnyView(RSDetail_Timebar())
        } else if live2AndPopArr.contains(key) {
            return AnyView(RSDetail_LiveAndPop())
        } else if playWindowArr.contains(key) {
            return AnyView(RSDetail_PlayView())
        } else if calendarArr.contains(key) {
            return AnyView(RSDetail_Calendar())
        } else if live1Arr.contains(key) {
            return AnyView(RSLive1())
        } else if fileArr.contains(key) {
            return AnyView(RSDetail_File())
        } else if deviceListArr.contains(key) {
            return AnyView(RSDetail_DeviceList())
        } else if scanQRCodeArr.contains(key) {
            return AnyView(RSDetail_ScanQRCode())
        } else {
            return AnyView(Button(action: {
                
            }) {
                Text("Come to soon")
            })
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


/*
 TableView
     <color name="textColor">#fffa00</color> <!--普通文字-->
     <color name="textDetail">#f3b1be</color> <!--文件列表通道设备细节，设备列表设备名等标题，HintTextColor-->
     <color name="textDisable">#f3b1be</color> <!--设备掉线-->
     <color name="textColorInColorView">#ff0000</color> <!--列表选中通道，码流选中文字-->
     <color name="backgroundList">#0081ff</color> <!--列表背景-->
     <color name="spliteNormal">#9bd7dc</color> <!--窗口框颜色，item分割线-->
     <color name="textNotice">#f3b1be</color> <!--通知未点击-->
     <color name="themeSwitch">#f3b1be</color> <!--Switch按钮颜色-->

 Timebar
     <color name="timebarBackground">#a55ebe</color> <!--背景色-->
     <color name="timebarSpliteNormal">#b1f3d6</color> <!--刻度-->
     <color name="timebarSpliteCenterHorizontal">#00e1f3</color> <!--中线-->

 Live2 + PopView
     <color name="textNavigation">#ffffff</color> <!--导航栏文字-->
     <color name="themeStart">#10a1c7</color> <!--导航栏 渐变色按钮-->
     <color name="themeEnd">#2fd189</color> <!--导航栏 渐变色按钮-->
     <color name="backgroundBasic">#8eb1be</color> <!--基本背景-->
     <color name="backgroundToolbar">#dcff00</color> <!--工具栏-->
     <color name="themeItemStart">#2fb1be</color> <!--选中项背景色-->
     <color name="themeItemEnd">#f3b1be</color> <!--选中项背景色-->

 PlayWindow
     <color name="spliteSelected">#0029be</color> <!--窗口选中颜色-->

 Calendar
     <color name="textToday">#f3b1be</color> <!--日历当天文字颜色-->
     <color name="backgroundMark">#f3b1be</color> <!--日历下的点-->

 RSLive1
     <color name="backgroundNotice">#ff0000</color> <!--通知数的背景色-->

 File
     <color name="themeProgressBar">#f3b1be</color> <!--本地回放进度条-->

 DeviceList
     <color name="textConnectOnline">#f3b1be</color> <!--设备列表下连接成功文字颜色-->
     <color name="textConnectOffline">#f3b1be</color> <!--设备列表下连接失败文字颜色-->

 Scan QRCode
     <color name="themeButton">#5a6b72</color> <!--非渐变色按钮颜色-->
     <color name="themeButtonPress">#d8d7dc</color> <!--非渐变色按钮点击的颜色-->
 */
