//
//  Product.swift
//  Vape-Store
//
//  Created by mac on 19/01/2023.
//

import Foundation





struct GetproductElement: Codable {
    let id: Int
    let productDescription: String
    let image: Image
    let price: Int
    
}

// MARK: - Image
struct Image: Codable {
    let width, height: Int
    let url: String
}

typealias Getproduct = [GetproductElement]

