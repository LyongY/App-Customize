//
//  RSColectionView.swift
//  App Customize
//
//  Created by Raysharp666 on 2020/1/8.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct RSColectionView: View {
    
    @Binding var title: String
    
    var data: Array<AnyView>
    var body: some View {
        RSColectionViewRepresent(title: $title, data: data)
    }
}

struct RSColectionView_Previews: PreviewProvider {
    static var previews: some View {
        RSColectionView(title: .constant("Live 1"), data: [
            AnyView(Text("q")),
            AnyView(Text("w")),
            AnyView(Text("e")),
        ])
    }
}

struct RSColectionViewRepresent: UIViewRepresentable {
    
    typealias UIViewType = UICollectionView

    @Binding var title: String
    var data: Array<AnyView>
    
    func makeCoordinator() -> RSColectionViewRepresent.Coordinator {
        let coordinator = Coordinator(title: $title, data: data)
        return coordinator
    }
    
    func makeUIView(context: UIViewRepresentableContext<RSColectionViewRepresent>) -> RSColectionViewRepresent.UIViewType {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")
    
        collectionView.isPagingEnabled =  true
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: UIViewRepresentableContext<RSColectionViewRepresent>) {

    }
    
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        @Binding var title: String
        var data: Array<AnyView>
        
        init(title: Binding<String>, data: Array<AnyView>) {
            self._title = title
            self.data = data
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RSColectionViewRepresent.Cell
            for view in cell.subviews {
                view.removeFromSuperview()
            }
            let hosting = cell.hosting
            hosting.rootView = data[indexPath.item]
            hosting.rootView = AnyView(hosting.rootView.edgesIgnoringSafeArea(.all))
            let hostView = hosting.view!
            cell.addSubview(hostView)
            
            hostView.translatesAutoresizingMaskIntoConstraints = false
            cell.addConstraints([
                hostView.topAnchor.constraint(equalTo: cell.topAnchor),
                hostView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                hostView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                hostView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            ])
            let back = UIView()
            back.backgroundColor = .red
            cell.backgroundView = back
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            var height = UIScreen.main.bounds.size.height - 64
            let keyWindow = collectionView.window
            let optionBottom = keyWindow?.safeAreaInsets.bottom
            if let bottomSafe = optionBottom {
                if bottomSafe == 21 || bottomSafe == 34 {
                    height = UIScreen.main.bounds.size.height - 88
                }
            }
            return .init(width: UIScreen.main.bounds.size.width, height: height)
        }
        
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
    
    class Cell: UICollectionViewCell {
        let hosting = UIHostingController(rootView: AnyView(EmptyView()))
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
