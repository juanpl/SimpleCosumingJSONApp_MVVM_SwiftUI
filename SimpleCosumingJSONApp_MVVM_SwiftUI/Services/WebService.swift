//
//  WebServices.swift
//  SimpleCosumingJSONApp_MVVM_SwiftUI
//
//  Created by Juan Pablo Lasprilla Correa on 16/12/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case decodingError
}

class WebService {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else{
            throw NetworkError.badURL
        }
        
        let (data, respose) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse  = respose as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else{
            throw NetworkError.decodingError
        }
        
        return products
    }
}
