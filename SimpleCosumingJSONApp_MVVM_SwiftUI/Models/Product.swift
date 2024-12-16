//
//  Product.swift
//  SimpleCosumingJSONApp_MVVM_SwiftUI
//
//  Created by Juan Pablo Lasprilla Correa on 16/12/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
}
