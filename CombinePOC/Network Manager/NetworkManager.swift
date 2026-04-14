//
//  NetworkManager.swift
//  CombinePOC
//
//  Created by neosoft on 13/04/26.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func fetchData<T:Decodable>(searchText: String, type: T.Type) -> AnyPublisher<T, Error>
}

class NetworkManager: NetworkManagerProtocol {
    
    func fetchData<T:Decodable>(searchText: String, type: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: "https://dummyjson.com/products/search?q=\(searchText)") else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {(data, response) in
                guard let httpResponse = response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .retry(3)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
                
    }
}


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Decoding Error"
        }
    }
}
