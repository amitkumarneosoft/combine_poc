//
//  ProductView.swift
//  CombinePOC
//
//  Created by neosoft on 13/04/26.
//

import SwiftUI

struct ProductView: View {
    @State var viewModel: ProductViewModel
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.products, id: \.id) { product in
                    ProductCellView(product: product)
                }
                .navigationTitle("Products")
                .searchable(text: $searchText)
                .onChange(of: searchText) {
                    viewModel.search(for: searchText)
                }
                .onAppear {
                    viewModel.setupSearchPublisher()
                }
                
                //MARK: Loader
                if !viewModel.loadingCompleted {
                    ProgressView("Loading...")
                        .scaleEffect(1.5)
                }
            }
        }
    }
}

#Preview {
    ProductView(viewModel: ProductViewModel(networkManager: NetworkManager()))
    
}
