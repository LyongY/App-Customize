//
//  RSScrollView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/7.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSScrollView<Content: View>: View {
    
    var content: () -> Content
    
    @State var title: String = "Live 1"
    
    init(title: String? = nil, content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        RSScrollViewRepresent(title: $title) {
            self.content()
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
        
    }
}

struct RSScrollView_Previews: PreviewProvider {
    static var previews: some View {
        RSScrollView {
            HStack {
                Text("3")
                Text("4")
            }
        }
    }
}

struct RSScrollViewRepresent<Content: View>: UIViewRepresentable {
    
    @Binding var title: String
    
    var content: () -> Content
    init(title: Binding<String>, @ViewBuilder content: @escaping () -> Content) {
        self._title = title
        self.content = content
    }
    
    func makeUIView(context: UIViewRepresentableContext<RSScrollViewRepresent<Content>>) -> RSScrollViewRepresent<Content>.UIViewType {
        let scrollView = RSScrollViewR<Content>(title: $title)
        scrollView.isPagingEnabled = true
        scrollView.hostingController.rootView = AnyView(self.content())
        scrollView.delegate = scrollView
        scrollView.addSubview(scrollView.hostingController.view)
        
        let hostView = scrollView.hostingController.view!
        hostView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addConstraints([
            hostView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        return scrollView
    }
    
    func updateUIView(_ uiView: RSScrollViewR<Content>, context: UIViewRepresentableContext<RSScrollViewRepresent<Content>>) {
        
    }
}

class RSScrollViewR<Content: View>: UIScrollView, UIScrollViewDelegate {
    
    @Binding var title: String

    init(title: Binding<String>) {
        self._title = title
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int((scrollView.contentOffset.x / scrollView.contentSize.width) * (scrollView.contentSize.width / scrollView.bounds.size.width))
        let data: Array<String> = [
            "Live 1",
            "Live 2",
            "Live 3",
            "Playback 1",
            "Playback 2",
            "File 1",
            "File 2",
            "Push List",
        ]
        title = data[index]
    }
}
