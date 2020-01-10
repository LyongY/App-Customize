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
    @State var title: String = "Live 1"
    
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
        NavigationView {
            RSColectionView(title: $title,data: [
                AnyView(RSLive1()),
                AnyView(RSLive1())
            ]).environmentObject(UserData.default)
                .background(Color(.lightGray))
                .edgesIgnoringSafeArea([.bottom])
                .navigationBarTitle(Text(title), displayMode: .inline)
                .navigationBarItems(leading: self.leftButton, trailing: self.rightButton)
                .background(RSNavigationConfig { nav in
                    nav.navigationBar.tintColor = self.userData.colors.text.navigation
                    nav.navigationBar.titleTextAttributes = [.foregroundColor: self.userData.colors.text.navigation]
                    nav.navigationBar.setBackgroundImage(UIImage(gradientColors: [self.userData.colors.theme.start, self.userData.colors.theme.end]), for: .default)
                })
                .sheet(isPresented: self.$showColors) {
                    RSColorCategoryView()
            }
        }
    }
}

public extension UIImage {
    convenience init?(gradientColors:[UIColor], size:CGSize = .init(width: UIScreen.main.bounds.size.width / UIScreen.main.scale, height: 10))
    {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map { (color) in
            color.cgColor
        }
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: nil)
        context?.drawLinearGradient(gradient!, start: .init(x: 0, y: 0.5), end: .init(x: size.width, y: 0.5), options: .init(rawValue: 0))
        self.init(cgImage:UIGraphicsGetImageFromCurrentImageContext()!.cgImage!)
        UIGraphicsEndImageContext()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData.default)
    }
}


struct RSNavigationConfig: UIViewControllerRepresentable {
    var config: (UINavigationController) -> Void
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<RSNavigationConfig>) -> RSNavigationConfig.UIViewControllerType {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<RSNavigationConfig>) {
        if let nav = uiViewController.navigationController {
            config(nav)
        }
    }
}
