//
//  ProductCellView.swift
//  CombinePOC
//
//  Created by neosoft on 14/04/26.
//

import SwiftUI

struct ProductCellView: View {
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: product.thumbnailURL) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            } placeholder : {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Rs. \(product.price)")
                    .font(.subheadline)
            }
        }
    }
}
#Preview {
    ProductCellView(product: Product(id: 1, title: "Test", price: 100.0, thumbnail: "https://via.placeholder.com/150"))
}
