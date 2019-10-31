//
//  ProductListView.swift
//  animated-safari-tab
//
//  Created by thomas on 31/10/19.
//  Copyright © 2019 thomas. All rights reserved.
//

import SwiftUI

struct ProductListView: View {

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(Product.allCases, id: \.self) { product in
                        HStack {
                            ProductImageView(imageName: product.imageName)
                            Text(product.rawValue.uppercased())
                                .kerning(-0.5)
                                .bold()
                            Spacer()
                            Text("$") + Text(Int.random(in: 3...44).description).bold()
                        }
                        .padding()
                        .frame(height: 120)
                        .background(self.makeRowBackground(color: Color.gray.opacity(0.1)))
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Products")
        }
    }
    
    private func makeRowBackground(color: Color) -> some View {
        return Rectangle()
            .foregroundColor(.clear)
            .background(color)
            .cornerRadius(16)
    }
}

struct ProductImageView: View {
    
    var imageName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            Image(systemName: imageName)
                .font(Font.system(size: 56))
                .foregroundColor(.pink)
        }
        .frame(width: 90)
        .cornerRadius(8)
    }
}

// MARK: - Hardcoded Data

fileprivate extension ProductListView {
    enum Product: String, CaseIterable {
        case pencil
        case camera
        case guitars
        case iMac
        
        var imageName: String {
            switch self {
            case .pencil: return "pencil"
            case .camera: return "camera"
            case .guitars: return "guitars"
            case .iMac: return "desktopcomputer"
            }
        }
    }
}
