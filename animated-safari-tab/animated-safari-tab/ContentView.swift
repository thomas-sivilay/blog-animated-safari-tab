//
//  ContentView.swift
//  animated-safari-tab
//
//  Created by thomas on 31/10/19.
//  Copyright © 2019 thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection) {
            productTab
            toteTab
        }
    }
    
    private var productTab: some View {
        ProductListView()
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
                  VStack {
                      Image(systemName: "bag")
                      Text("Checkout")
                  }
              }
              .tag(1)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
