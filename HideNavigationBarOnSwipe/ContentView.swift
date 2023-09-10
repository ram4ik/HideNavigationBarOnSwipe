//
//  ContentView.swift
//  HideNavigationBarOnSwipe
//
//  Created by Ramill Ibragimov on 10.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var hideNavBar: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...50, id: \.self) { index in
                    NavigationLink {
                        List {
                            ForEach(1...50, id: \.self) { index in
                                Text("Sub Item \(index)")
                            }
                        }
                        .navigationTitle("Item \(index)")
                        .hideNavigationBarOnSwipe(false)
                    } label: {
                        Text("List Item \(index)")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hide On Swipe")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        hideNavBar.toggle()
                    } label: {
                        Image(systemName: hideNavBar ? "eye.slash" : "eye")
                    }
                }
            })
            .hideNavigationBarOnSwipe(hideNavBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
