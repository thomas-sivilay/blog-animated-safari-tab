//
//  ContentView.swift
//  animated-safari-tab
//
//  Created by thomas on 31/10/19.
//  Copyright © 2019 thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var animateTote: Bool = false
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection) {
            productTab
            toteTab
        }
    }
    
    private var productTab: some View {
        ProductListView(animateTote: $animateTote)
            .tabItem {
                VStack {
                    Image(systemName: "circle.grid.3x3")
                    Text("Product List")
                }
            }
            .tag(0)
    }
    
    private var toteTab: some View {
        ToteView()
            .tabItem {
               animatedTote
            }
            .tag(1)
    }
    
    private var animatedTote: some View {
        VStack {
            Image(systemName: animateTote ? "bag.fill" : "bag")
                .font(Font.system(size: animateTote ? 34 : 20))
                .animation(.easeIn(duration: 1))
                .transition(.opacity)
            if !animateTote {
                Text("Checkout")
            } else {
                Text("Nice !!!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
