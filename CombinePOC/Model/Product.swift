//
//  Product.swift
//  CombinePOC
//
//  Created by neosoft on 13/04/26.
//
import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
    
    var thumbnailURL: URL? {
        URL(string: thumbnail)
    }
}
