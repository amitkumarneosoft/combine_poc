//
//  ProductViewModel.swift
//  CombinePOC
//
//  Created by neosoft on 13/04/26.
//

import Foundation
import Combine

@Observable
class ProductViewModel {
    var products: [Product] = []
    var loadingCompleted = false
    let networkManager: NetworkManagerProtocol
    private var currentvalueSubject = CurrentValueSubject<String, Never>("")
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func setupSearchPublisher() {
        currentvalueSubject
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink {[weak self] searchText in
                self?.loadProducts(searchText)
            }
            .store(in: &cancellables)
    }
    
    func loadProducts(_ search: String) {
        networkManager.fetchData(searchText: search, type: ProductResponse.self)
            .sink {[weak self] completion in
                switch completion {
                case .finished:
                    print("Finished")
                    self?.loadingCompleted = true
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {[weak self] products in
                self?.products = products.products
            }
            .store(in: &cancellables)

    }
    
    func search(for query: String) {
        currentvalueSubject.send(query)
    }
}

